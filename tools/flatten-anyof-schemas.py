#!/usr/bin/env python3
"""
Script to flatten anyOf and oneOf references in OpenAPI schema.

For any components.schemas with anyOf or oneOf references, this script:
1. Resolves each referenced schema
2. Combines all properties from referenced schemas into one object
3. Ensures there are no duplicate properties (keeps first occurrence)

Note: allOf is left alone and not flattened.
"""

import yaml
import sys
import os
import copy
from pathlib import Path
from typing import Dict, Any, List, Set, Tuple


def resolve_schema_ref(schemas: Dict[str, Any], ref: str) -> Dict[str, Any]:
    """
    Resolve a schema reference like '#/components/schemas/asset' to the actual schema.
    
    Args:
        schemas: The components.schemas dictionary
        ref: The reference string (e.g., '#/components/schemas/asset')
    
    Returns:
        The resolved schema dictionary
    """
    if not ref.startswith('#/components/schemas/'):
        raise ValueError(f"Unsupported reference format: {ref}")
    
    schema_name = ref.split('/')[-1]
    if schema_name not in schemas:
        raise ValueError(f"Schema not found: {schema_name}")
    
    return schemas[schema_name]


def get_schema_properties(schemas: Dict[str, Any], schema: Dict[str, Any], visited: Set[str] = None) -> Dict[str, Any]:
    """
    Recursively extract all properties from a schema, handling allOf (for resolution only), anyOf, oneOf, and direct properties.
    
    Note: allOf is followed to resolve properties, but schemas with allOf are not flattened.
    
    Args:
        schemas: The components.schemas dictionary
        schema: The schema to extract properties from
        visited: Set of visited schema names to prevent circular references
    
    Returns:
        Dictionary of all properties
    """
    if visited is None:
        visited = set()
    
    properties = {}
    
    # Handle allOf - merge all referenced schemas and inline schemas
    # This must be processed first to properly resolve properties from schemas that use allOf
    if 'allOf' in schema:
        for item in schema['allOf']:
            if isinstance(item, dict):
                if '$ref' in item:
                    ref = item['$ref']
                    schema_name = ref.split('/')[-1]
                    if schema_name in visited:
                        continue  # Skip circular references
                    visited.add(schema_name)
                    ref_schema = resolve_schema_ref(schemas, ref)
                    ref_props = get_schema_properties(schemas, ref_schema, visited)
                    properties.update(ref_props)
                    visited.remove(schema_name)
                elif 'properties' in item:
                    # Inline schema with properties
                    properties.update(item['properties'])
                else:
                    # Inline schema - extract properties recursively
                    inline_props = get_schema_properties(schemas, item, visited.copy())
                    properties.update(inline_props)
    
    # Handle anyOf - merge all referenced schemas
    if 'anyOf' in schema:
        for item in schema['anyOf']:
            if '$ref' in item:
                ref = item['$ref']
                schema_name = ref.split('/')[-1]
                if schema_name in visited:
                    continue  # Skip circular references
                visited.add(schema_name)
                ref_schema = resolve_schema_ref(schemas, ref)
                ref_props = get_schema_properties(schemas, ref_schema, visited)
                properties.update(ref_props)
                visited.remove(schema_name)
            elif 'properties' in item:
                properties.update(item['properties'])
    
    # Handle oneOf - merge all referenced schemas
    if 'oneOf' in schema:
        for item in schema['oneOf']:
            if '$ref' in item:
                ref = item['$ref']
                schema_name = ref.split('/')[-1]
                if schema_name in visited:
                    continue  # Skip circular references
                visited.add(schema_name)
                ref_schema = resolve_schema_ref(schemas, ref)
                ref_props = get_schema_properties(schemas, ref_schema, visited)
                properties.update(ref_props)
                visited.remove(schema_name)
            elif 'properties' in item:
                properties.update(item['properties'])
    
    # Handle direct properties
    if 'properties' in schema:
        properties.update(schema['properties'])
    
    return properties


def flatten_anyof_oneof_in_schema(schemas: Dict[str, Any], schema_obj: Dict[str, Any], path: str = "") -> Tuple[Dict[str, Any], int]:
    """
    Flatten anyOf or oneOf in a schema object (can be a top-level schema or nested property).
    
    Args:
        schemas: The components.schemas dictionary
        schema_obj: The schema object to flatten (can be a schema or a property definition)
        path: Path string for logging (e.g., "assetManager.manager")
    
    Returns:
        Tuple of (flattened_schema, count_of_flattened_items)
    """
    flattened_count = 0
    
    # Check if this schema object has anyOf or oneOf with $ref references
    ref_type = None
    has_refs = False
    
    if 'anyOf' in schema_obj:
        # Check if anyOf contains $ref references (not just constraint objects)
        has_refs = any('$ref' in item for item in schema_obj['anyOf'] if isinstance(item, dict))
        if has_refs:
            ref_type = 'anyOf'
    elif 'oneOf' in schema_obj:
        # Check if oneOf contains $ref references (not just constraint objects)
        has_refs = any('$ref' in item for item in schema_obj['oneOf'] if isinstance(item, dict))
        if has_refs:
            ref_type = 'oneOf'
    
    if ref_type and has_refs:
        print(f"Flattening {path} (has {ref_type} with $ref references)")
        
        # Collect all properties from anyOf/oneOf references
        all_properties = {}
        visited = set()
        
        for item in schema_obj[ref_type]:
            if '$ref' in item:
                ref = item['$ref']
                ref_schema_name = ref.split('/')[-1]
                print(f"  Resolving reference: {ref_schema_name}")
                
                if ref_schema_name in visited:
                    print(f"  Warning: Circular reference detected for {ref_schema_name}, skipping")
                    continue
                
                visited.add(ref_schema_name)
                ref_schema = resolve_schema_ref(schemas, ref)
                ref_properties = get_schema_properties(schemas, ref_schema, visited.copy())
                
                # Merge properties, keeping first occurrence if duplicates exist
                # Deep copy to avoid reference issues and YAML anchors
                for prop_name, prop_value in ref_properties.items():
                    if prop_name not in all_properties:
                        # Deep copy to avoid YAML anchor/alias issues
                        all_properties[prop_name] = copy.deepcopy(prop_value)
                    else:
                        print(f"  Warning: Duplicate property '{prop_name}' found, keeping first occurrence")
                
                visited.remove(ref_schema_name)
            elif isinstance(item, dict):
                # Handle direct properties or inline schema in anyOf/oneOf
                if 'properties' in item:
                    for prop_name, prop_value in item['properties'].items():
                        if prop_name not in all_properties:
                            # Deep copy to avoid YAML anchor/alias issues
                            all_properties[prop_name] = copy.deepcopy(prop_value)
                        else:
                            print(f"  Warning: Duplicate property '{prop_name}' found, keeping first occurrence")
                else:
                    # Inline schema - extract properties recursively
                    inline_props = get_schema_properties(schemas, item, visited.copy())
                    for prop_name, prop_value in inline_props.items():
                        if prop_name not in all_properties:
                            # Deep copy to avoid YAML anchor/alias issues
                            all_properties[prop_name] = copy.deepcopy(prop_value)
                        else:
                            print(f"  Warning: Duplicate property '{prop_name}' found, keeping first occurrence")
        
        # Also merge any direct properties from the schema itself (if any)
        if 'properties' in schema_obj:
            for prop_name, prop_value in schema_obj['properties'].items():
                if prop_name not in all_properties:
                    # Deep copy to avoid YAML anchor/alias issues
                    all_properties[prop_name] = copy.deepcopy(prop_value)
                else:
                    print(f"  Warning: Duplicate property '{prop_name}' found in schema itself, keeping from {ref_type}")
        
        # Replace anyOf/oneOf with merged properties
        new_schema = {
            'type': 'object',
            'properties': all_properties
        }
        
        # Preserve other fields from original schema (like description, required, etc.)
        for key, value in schema_obj.items():
            if key not in [ref_type, 'anyOf', 'oneOf', 'type', 'properties']:
                new_schema[key] = value
        
        print(f"  Flattened {path}: {len(all_properties)} properties merged")
        flattened_count += 1
        return new_schema, flattened_count
    
    # No anyOf/oneOf to flatten, but recursively process nested properties
    if 'properties' in schema_obj:
        for prop_name, prop_value in schema_obj['properties'].items():
            if isinstance(prop_value, dict):
                prop_path = f"{path}.{prop_name}" if path else prop_name
                flattened_prop, count = flatten_anyof_oneof_in_schema(schemas, prop_value, prop_path)
                schema_obj['properties'][prop_name] = flattened_prop
                flattened_count += count
    
    # Also check items in arrays
    if 'items' in schema_obj and isinstance(schema_obj['items'], dict):
        items_path = f"{path}.items" if path else "items"
        flattened_items, count = flatten_anyof_oneof_in_schema(schemas, schema_obj['items'], items_path)
        schema_obj['items'] = flattened_items
        flattened_count += count
    
    return schema_obj, flattened_count


def flatten_anyof_oneof_schemas(openapi_spec: Dict[str, Any]) -> Dict[str, Any]:
    """
    Flatten all anyOf and oneOf references in components.schemas.
    Handles both top-level schemas and nested properties.
    Note: allOf is left alone and not flattened.
    
    Args:
        openapi_spec: The OpenAPI specification dictionary
    
    Returns:
        Modified OpenAPI specification with flattened anyOf and oneOf schemas
    """
    if 'components' not in openapi_spec or 'schemas' not in openapi_spec['components']:
        print("No components.schemas found in OpenAPI spec")
        return openapi_spec
    
    schemas = openapi_spec['components']['schemas']
    total_flattened = 0
    
    # Process each schema (both top-level anyOf/oneOf and nested ones)
    for schema_name, schema in schemas.items():
        if isinstance(schema, dict):
            flattened_schema, count = flatten_anyof_oneof_in_schema(schemas, schema, schema_name)
            schemas[schema_name] = flattened_schema
            total_flattened += count
    
    print(f"\nTotal anyOf/oneOf flattened: {total_flattened}")
    return openapi_spec


def main():
    """Main function to process the OpenAPI YAML file."""
    script_dir = Path(__file__).parent
    src_dir = script_dir.parent / 'src'
    input_file = src_dir / 'openapi.yaml'
    output_file = src_dir / 'openapi-flattened.yaml'

    if not input_file.exists():
        print(f"Error: File not found: {input_file}")
        sys.exit(1)
    
    print(f"Reading OpenAPI spec from: {input_file}")
    
    # Read the YAML file
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            openapi_spec = yaml.safe_load(f)
    except Exception as e:
        print(f"Error reading YAML file: {e}")
        sys.exit(1)
    
    # Flatten anyOf and oneOf schemas
    print("\nFlattening anyOf and oneOf references...\n")
    flattened_spec = flatten_anyof_oneof_schemas(openapi_spec)
    
    # Write to a separate file, leaving the original spec untouched
    print(f"\nWriting flattened spec to: {output_file}")
    try:
        # Use a custom dumper that doesn't use anchors/aliases
        class NoAliasDumper(yaml.SafeDumper):
            def ignore_aliases(self, data):
                return True
        
        with open(output_file, 'w', encoding='utf-8') as f:
            yaml.dump(
                flattened_spec, 
                f, 
                Dumper=NoAliasDumper,
                default_flow_style=False, 
                sort_keys=False, 
                allow_unicode=True, 
                width=120
            )
        print("Done!")
    except Exception as e:
        print(f"Error writing YAML file: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()

