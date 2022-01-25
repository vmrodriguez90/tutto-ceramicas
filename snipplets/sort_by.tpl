{% set sort_text = {
'user': 'Destacado',
'price-ascending': 'Precio: Menor a Mayor',
'price-descending': 'Precio: Mayor a Menor',
'alpha-ascending': 'A - Z',
'alpha-descending': 'Z - A',
'created-ascending': 'Más Viejo al más Nuevo',
'created-descending': 'Más Nuevo al más Viejo',
'best-selling': 'Más Vendidos',
} %}
<label for="sort" class="d-inline">{{ 'Ordenar por:' | t }}</label>
<select id="sort" class="js-sort-by sort-by full-width-xs">
    {% for sort_method in sort_methods %}
        {# This is done so we only show the user sorting method when the user chooses it #}
        {% if sort_method != 'user' or category.sort_method == 'user' %}
            <option value="{{ sort_method }}" {% if sort_by == sort_method %}selected{% endif %}>{{ sort_text[sort_method] | t }}</option>
        {% endif %}
    {% endfor %}
</select>
