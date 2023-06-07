{% if not mobile %}
    <div class="full-width-container m-bottom-half">
        {% include "snipplets/filters.tpl" with {applied_filters: true} %}

        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back hidden-phone m-bottom">
                {% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa m-right-half svg-text-fill"} %}
                {{ parent_category.name }}
            </a>
        {% endif %}
{% endif %}
        {% if filter_categories %}
            <div class="{% if mobile %}filters-container full-width-container m-bottom{% else %}hidden-phone{% endif %}">  
                <h5 class="{% if mobile %}m-bottom p-top-half{% else %}m-bottom-half p-bottom-half{% endif %} weight-normal">{{ "Categorías" | translate }}</h5>
                <ul>
                    {% for category in filter_categories %}
                        <li data-item="{{ loop.index }}" class="{% if mobile and not (loop.last or loop.index == 8) %}m-bottom-half{% else %}m-bottom-quarter{% endif %}"><a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
                        {% if loop.index == 8 and filter_categories | length > 8 %}
                            <div class="js-accordion-container {% if mobile %}m-top-half{% endif %}" style="display: none;">
                        {% endif %}
                        {% if loop.last and filter_categories | length > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle btn-link full-width-container m-top-quarter">
                                <span class="js-accordion-toggle-inactive">
                                    {{ 'Ver más' | translate }}
                                </span>
                               <span class="js-accordion-toggle-active" style="display: none;">
                                    {{ 'Ver menos' | translate }}
                                </span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </ul>
            </div>
        {% endif %}
{% if not mobile %}
    </div>
{% endif %}
