{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
{% set all_tags_displayed = (not product.has_stock and product.free_shipping and product.compare_at_price > product.price) or (product.has_stock and product.free_shipping and product.compare_at_price > product.price) %}
{% set has_color_variant = false %}
{% if settings.product_color_variants %}
    {% for variation in product.variations if variation.name in ['Color', 'Cor'] and variation.options | length > 1 %}
        {% set has_color_variant = true %}
    {% endfor %}
{% endif %}
{# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
{# Quantity by Square Meters #}
{% set SQUARE_METERS_LABEL = "M2 x Caja" %}
{% set has_square_meters = false %}
{% set product_price_per_meter = "" %}
{% set square_meters = "" %}
{% for variation in product.variations %}
    {% if variation.name == SQUARE_METERS_LABEL %}
        {% set has_square_meters = true %}
        {% set square_meters = variation.options[0].id %}
        {% set product_price_per_meter = product.price / square_meters %}
    {% endif %}
{% endfor %}
{# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}

<div class="js-item-product {% if slide_item %}js-item-slide swiper-slide products-slider-item item-mobile-container{% else %}item span3{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
    {% if slide_item %}
        <div class="item span3 full-width">
    {% endif %}
            {% if settings.quick_view or settings.product_color_variants %}
                <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}">
            {% endif %}
                    {% set product_url_with_selected_variant = filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
                    
                    <div class="js-item-image-container item-image-container">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">

                            {% if has_color_variant %}

                                {# Item image will be the first avaiable variant #}

                                {% set item_img_width = product.featured_variant_image.dimensions['width'] %}
                                {% set item_img_height = product.featured_variant_image.dimensions['height'] %}
                                {% set item_img_srcset = product.featured_variant_image %}
                                {% set item_img_alt = product.featured_variant_image.alt %}
                            {% else %}

                                {# Item image will be the first image regardless the variant #}

                                {% set item_img_width = product.featured_image.dimensions['width'] %}
                                {% set item_img_height = product.featured_image.dimensions['height'] %}
                                {% set item_img_srcset = product.featured_image %}
                                {% set item_img_alt = product.featured_image.alt %}
                            {% endif %}

                            {% set item_img_spacing = item_img_height / item_img_width * 100 %}

                            <div style="padding-bottom: {{ item_img_spacing }}%;" class="p-relative" data-store="product-item-image-{{ product.id }}">
                                <div class="labels-floating">
                                    <div class="js-stock-label label label-circle label-secondary label-circle-big pull-left" {% if product.has_stock %} style="display: none"{% endif %}>
                                        <span class="label-text">{{ "Sin stock" | translate }}</span>
                                    </div>
                                    <div class="labels pull-right" data-store="product-item-labels">
                                        {% if product.promotional_offer %}
                                            <div class="label label-circle label-primary label-accent clear-both m-bottom-quarter" {% if not product.display_price %} style="display: none"{% endif %} data-store="product-item-promotion-label">
                                                <span class="label-text">
                                                    {% if product.promotional_offer.script.is_percentage_off %}
                                                        <div>{{ product.promotional_offer.parameters.percent * 100 }}%</div>
                                                        <div> OFF</div>
                                                    {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                                        <div class="p-top-quarter"><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></div>
                                                        <div class="label-small p-right-quarter p-left-quarter">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                                    {% else %}
                                                        {% if store.country == 'BR' %}
                                                            <span class="font-small-extra">
                                                                {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                                            </span>
                                                        {% else %}
                                                            <div>{{ product.promotional_offer.script.type }}</div>
                                                        {% endif %}
                                                    {% endif %}
                                                </span>
                                            </div>
                                        {% elseif product.compare_at_price > product.price %}
                                            <div class="js-offer-label label label-accent label-circle label-primary clear-both m-bottom-quarter" {% if not product.display_price %} style="display: none"{% endif %} data-store="product-item-offer-label">
                                                <span class="label-text">
                                                    <div><span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>%</div>
                                                    <div> OFF</div>
                                                </span>
                                            </div>
                                        {% endif %}
                                        {% if product.free_shipping %}
                                            <div class="label label-accent label-circle label-primary clear-both">
                                                <span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
                                            </div>
                                        {% endif %}
                                    </div>
                                </div>
                                <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>

                                <img alt="{{ item_img_alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w" class="js-item-image lazyload item-image img-absolute img-absolute-centered fade-in {% if not product.has_stock %}opacity-50{% endif %}" width="{{ item_img_width }}" height="{{ item_img_height }}"/>
                                <div class="placeholder-fade">
                                </div>
                            </div>
                        </a>
                        {% if settings.product_color_variants %}
                            {% include 'snipplets/item-colors.tpl' %}
                        {% endif %}
                    </div>

                    {# Include quickshop form if quickshop or color pills are active on item #}
                    
                    {% include 'snipplets/quick-shop.tpl' %}

                    <div class="item-info-container m-top-half m-bottom-half" data-store="product-item-info-{{ product.id }}">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter" data-store="product-item-name-{{ product.id }}">{{ product.name }}</h6>
                            <div class="item-price-container {% if not product.display_price%}hidden{% endif %}">
                                {% if product.promotional_offer.script.is_percentage_off %}
                                    <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                                {% endif %}
                                <div data-store="product-item-price-{{ product.id }}">
                                    <span class="js-price-display item-price weight-strong text-primary" {% if not product.display_price %}class="hidden"{% endif %}>
                                    {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
                                    {% if not has_square_meters and product.display_price %}
                                        {{ product.price | money }}
                                    {% endif %}
                                    {% if has_square_meters and product.display_price %}
                                        {{ product_price_per_meter | money }} x m²
                                    {% endif %}
                                    </span>
                                    <span class="js-compare-price-display item-price-compare price-compare">
                                        <span {% if not product.compare_at_price %}class="hidden"{% endif %}>
                                        {% if not has_square_meters and product.compare_at_price %}
                                            {{ product.compare_at_price | money }}
                                        {% endif %}
                                        {% if has_square_meters and product.compare_at_price %}
                                            {{ (product.compare_at_price / square_meters) | money }} x m²
                                        {% endif %}
                                        </span>
                                    </span>
                                </div>
                                {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                                {% if product_can_show_installments %}
                                    <div class="js-max-installments-container">
                                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                                        {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                            <div class="js-max-installments item-installments m-top-quarter text-tertiary font-small-xs">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money ) }}</div>
                                        {% else %}
                                            {% if store.country != 'AR' %}
                                                {% set max_installments_with_interests = product.get_max_installments %}
                                                {% if max_installments_with_interests %}
                                                    <div class="js-max-installments item-installments m-top-quarter text-tertiary font-small-xs">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                                {% endif %}
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                {% endif %}
                            </div>
                        </a>
                    </div>
            {% if settings.quick_view or settings.product_color_variants %}
                </div>{# This closes the product data variants #}
            {% endif %}
            {% if product.category.id != 0 %}
                <div class="text-uppercase font-small-extra m-top-quarter m-top-half-xs">
                    <a class="item-category" href="{{ product.category.url }}" title="{{ product.category.name }}" aria-label="{{ product.category.name }}">{{ product.category.name }}</a>
                </div>
            {% endif %} 
            {# Structured data to provide information for Google about the product content #}
            {% include 'snipplets/structured_data/item-structured-data.tpl' %}
    {% if slide_item %}
        </div>
    {% endif %}
</div>

