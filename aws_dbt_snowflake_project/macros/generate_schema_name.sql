{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if target is not none -%}
        {%- set default_schema = target.schema -%}
    {%- else -%}
        {%- set default_schema = 'public' -%}
    {%- endif -%}
    
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}