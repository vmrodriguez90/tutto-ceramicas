<div class="item-small" data-store="product-item-{{ product.id }}">
    <div class="span3 item-image-container">

        {% set item_img_width = product.featured_image.dimensions['width'] %}
        {% set item_img_height = product.featured_image.dimensions['height'] %}
        {% set item_img_spacing = item_img_height / item_img_width * 100 %}

        <div class="p-relative" style="padding-bottom: {{ item_img_spacing }}%;" data-store="product-item-image-{{ product.id }}">
            <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}">
                <img alt="{{ product.featured_image.alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ product.featured_image | product_image_url('small')}} 240w, {{ product.featured_image | product_image_url('medium')}} 320w" class="lazyload item-image img-absolute img-absolute-centered fade-in {% if not product.has_stock %}opacity-50{% endif %}" width="{{ item_img_width }}" height="{{ item_img_height }}"/>
                <div class="placeholder-fade">
                </div>
            </a>
        </div>
    </div>
    <div class="span9 item-info-container font-small" data-store="product-item-info-{{ product.id }}">
        {% if product.category.id != 0 %}
            <div class="text-tertiary">
            	{{ product.category.name }}
            </div>
        {% endif %}
    	<a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-name" data-store="product-item-name-{{ product.id }}">{{ product.name }}</a>
        <div class="item-price-container {% if not product.display_price%}hidden{% endif %}">
            {% if product.promotional_offer.script.is_percentage_off %}
                <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
            {% endif %}
            <div data-store="product-item-price-{{ product.id }}">
                <span class="item-price weight-strong" {% if not product.display_price %}class="hidden"{% endif %}>
                    {% if product.display_price %}
                        {{ product.price | money }}
                    {% endif %}
                </span>
    			<span class="item-price-compare price-compare">
                    <span {% if not product.compare_at_price %}class="hidden"{% endif %}>
                    {% if product.compare_at_price %}
                        {{ product.compare_at_price | money }}
                    {% endif %}
                    </span>
                </span>
            </div>
            <div data-store="product-item-labels">
                {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                    <p class="text-primary" data-store="product-item-promotion-label">
                        {% if product.promotional_offer.script.is_discount_for_quantity %}
                            {% for threshold in product.promotional_offer.parameters %}
                                {{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}
                            {% endfor %}
                        {% else %}
                        {{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                    {% endif %}
                    </p> 
                {% endif %}
            </div>
        </div>
    </div>
    {# Structured data to provide information for Google about the product content #}
    {% include 'snipplets/structured_data/item-structured-data.tpl' %}
</div>

