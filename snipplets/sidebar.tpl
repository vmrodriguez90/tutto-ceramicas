<div class="span2 visible-when-content-ready hidden-phone">
    {% if filter_categories is not empty %}
        {% include "snipplets/categories.tpl" %}
    {% endif %}
    {% if product_filters is not empty %}
        {% include "snipplets/filters.tpl" with {'filters_mobile': false} %}
    {% endif %}
</div>