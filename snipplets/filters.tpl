{% if applied_filters %}
    
    {# Applied filters chips #}

    {% if has_applied_filters %}
        <div class="m-bottom">
            <div class="m-bottom-half">{{ 'Filtrado por:' | translate }}</div>
            {% for product_filter in product_filters %}
                {% for value in product_filter.values %}

                    {# List applied filters as tags #}
                    
                    {% if value.selected %}
                        <button class="js-remove-filter chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}">
                            {{ value.pill_label }}
                            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa chip-remove-icon"} %}
                        </button>
                    {% endif %}
                {% endfor %}
            {% endfor %}
            <a href="#" class="js-remove-all-filters btn-link d-inline-block">{{ 'Borrar filtros' | translate }}</a> 
        </div>
    {% endif %}
{% else %}
    {% if product_filters is not empty %}
        <div id="filters-container" data-store="filters-nav">
            <div id="filters-column" class="filters {% if not filters_mobile %}m-top{% endif %}">
                {% for product_filter in product_filters %}
                    {% if product_filter.type == 'price' %}
                        {% if not filters_mobile %}
                            {% set btn_price_classes = 'btn-square btn-icon chevron' %}
                        {% endif %}
             
                        {{ component(
                            'price-filter',
                            {'group_class': 'full-width-container p-bottom-double', 'title_class': 'h5 m-bottom p-top weight-normal', 'button_class': 'btn btn-default btn-small ' ~ btn_price_classes }
                        ) }}
                    {% else %}
                        {% if product_filter.has_products %}
                            <div class="filters-container full-width-container m-bottom" data-store="filters-group">
                                <h5 class="m-bottom p-top weight-normal">{{product_filter.name}}</h5>
                                {% set index = 0 %}
                                {% for value in product_filter.values %}
                                    {% if value.product_count > 0 %}
                                        {% set index = index + 1 %}
                                        <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container m-bottom-half" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}">
                                            <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}>
                                            <span class="checkbox">
                                                <span class="checkbox-icon{% if product_filter.type == 'color' and value.color_type == 'insta_color' %}  with-color{% endif %}"></span>
                                                {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                    <span class="checkbox-icon-color" style="background-color: {{ value.color_hexa }};"></span>
                                                {% endif %}
                                                {{ value.name }} ({{ value.product_count }})
                                            </span>
                                        </label>
                                        {% if index == 8 and product_filter.values_with_products > 8 %}
                                            <div class="js-accordion-container full-width-container" style="display: none;">
                                        {% endif %}
                                    {% endif %}
                                    {% if loop.last and product_filter.values_with_products > 8 %}
                                        </div>
                                        <a href="#" class="js-accordion-toggle btn-link full-width-container">
                                            <span class="js-accordion-toggle-inactive">
                                                {{ 'Ver todos' | translate }}
                                            </span>
                                           <span class="js-accordion-toggle-active" style="display: none;">
                                                {{ 'Ver menos' | translate }}
                                            </span>
                                        </a>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        {% endif %}
                    {% endif %}
                {% endfor %}
            </div>
        </div>
    {% endif %}
{% endif %}