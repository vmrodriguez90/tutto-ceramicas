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

<div class="{% if slide_item %}js-item-slide swiper-slide m-bottom-none-xs{% else %}span3{% endif %} item-container m-bottom-half" data-store="product-item-{{ product.id }}">
    <div class="js-item-product item m-top-none-xs" data-product-type="list" data-product-id="{{ product.id }}" data-component="product-list-item" data-component-value="{{ product.id }}">
        {% if settings.quick_view or settings.product_color_variants %}
            <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %}{% if slide_item %} item-slide{% endif %}" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}">
        {% endif %}
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

                <div class="js-item-image-container item-image-container">
                    {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

                    <div style="padding-bottom: {{ item_img_spacing }}%;" class="js-item-image-padding p-relative" data-store="product-item-image-{{ product.id }}">
                        <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}">
                            
                            <img alt="{{ item_img_alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w" class="js-item-image lazyload item-image img-absolute img-absolute-centered fade-in" width="{{ item_img_width }}" height="{{ item_img_height }}" />
                            <div class="placeholder-fade">
                            </div>
                        </a>
                    </div>
                    <div data-store="product-item-labels">
                        {% if product.promotional_offer %}
                            <div class="item-label item-label-offer product-label label-primary{% if product.promotional_offer.script.is_discount_for_quantity and sections.new.products | find(product.id) %} label-max-width{% endif %}" {% if not product.display_price %}style="display:none;"{% endif %} data-store="product-item-promotion-label">
                                <span>
                                {% if product.promotional_offer.script.is_percentage_off %}
                                    {{ product.promotional_offer.parameters.percent * 100 }}% OFF
                                {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                    <div class="text-left">
                                        <h6><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></h6>
                                        <div class="label-small">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                    </div>
                                {% elseif store.country == 'BR' %}
                                    {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                {% else %}
                                    {{ "Promo" | translate }} {{ product.promotional_offer.script.type }}
                                {% endif %}
                                </span>
                            </div>
                        {% else %}
                            <div class="js-offer-label item-label item-label-offer product-label label-primary" {% if not product.compare_at_price %} style="display: none;" {% endif %} data-store="product-item-offer-label">
                                <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>
                                % OFF
                            </div>
                        {% endif %}
                    </div>
                    {% if product.free_shipping %}
                        <div class="item-label product-label label-bottom {% if has_color_variant %}label-bottom-double {% endif %}label-light">
                            <span class="m-right-quarter d-inline-block label-shipping-icon svg-icon-text">
                                {% include "snipplets/svg/truck.tpl" %}
                            </span>
                            <span class="d-inline-block line-height-initial">
                                {{ "Envío gratis" | translate }}
                            </span>
                        </div>
                    {% endif %}
                    {% if sections.new.products | find(product.id) %}
                        <div class="item-label product-label label-secondary">
                            <span>{{ "Nuevo" | translate }}</span>
                        </div>
                    {% endif %}
                    {% if settings.product_color_variants %}
                        {% include 'snipplets/item-colors.tpl' %}
                    {% endif %}
                    {% if (settings.quick_view or settings.product_color_variants) and product.variations %}
                        <div class="js-item-variants item-buy-variants hidden">
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% include "snipplets/variants.tpl" with {'quickshop': true} %}
                                <div class="pull-left full-width m-bottom">
                                    <div class="item-quantity-container pull-left">
                                        <input type="number" class="item-quantity-input" value="1" type="number" name="quantity" value="1" min="1" aria-label="{{ 'Cantidad' | translate }}"/>
                                    </div>
                                    <div class="item-button-container pull-right">
                                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                        <input type="submit" class="js-prod-submit-form js-addtocart btn btn-primary btn-block d-inline-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-detail.add-to-cart" data-component-value="{{product.id}}" />

                                        {# Fake add to cart CTA visible during add to cart event #}
                                        {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "full-width"} %}
                                    </div>
                                </div>
                                <a href="{{ product.url }}" title="{{ product.name }}" class="btn-link">{{ "Ver más detalles" | translate }}</a>
                            </form>
                        </div>
                    {% endif %}
                </div>
                <div class="item-info-container" data-store="product-item-info-{{ product.id }}">
                    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="js-item-name item-name" aria-label="{{ product.name }}" data-store="product-item-name-{{ product.id }}">
                        {% if product.name | length > 40 %}
                            {{ product.name | truncate(40) }}
                        {% else %}
                            {{ product.name }}
                        {% endif %}
                    </a>
                    <div class="item-price-container m-none-xs {% if not product.display_price%} hidden {% endif %}" data-store="product-item-price-{{ product.id }}">
                        <span class="price-compare">
                            <span class="js-compare-price-display item-price-compare p-none-left-xs p-right-quarter-xs" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                {{ product.compare_at_price | money }}
                            </span>
                        </span>
                        <span class="js-price-display item-price h6">
                            {% if product.display_price %}
                                {{ product.price | money }}
                            {% endif %}
                        </span>
                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                        {% if product_can_show_installments %}
                            <div class="js-max-installments-container"> 
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                    <div class="js-max-installments item-installments label-line m-top-quarter">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money ) }}</div>
                                {% else %}
                                    {% if store.country != 'AR' %}
                                        {% set max_installments_with_interests = product.get_max_installments %}
                                        {% if max_installments_with_interests %}
                                            <div class="js-max-installments item-installments m-top-quarter font-small">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <div class="product-grid-labels">
                    <div class="js-stock-label item-label product-label label-light font-small" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
                </div>
                <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>
                {% if settings.quick_view and product.available and product.display_price %}
                    <div class="item-actions m-top-half">
                        {% if product.variations %}
                            <a data-toggle="modal" data-target="#quickshop-modal" data-modal-url="modal-fullscreen-quickshop" class="js-quickshop-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-fullscreen-modal-open btn btn-primary full-width-xs btn-small btn-smallest font-small-extra p-right p-left p-right-half-xs p-left-half-xs" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" >{{ 'Agregar al carrito' | translate }}</a>
                        {% else %}
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary full-width-xs btn-small btn-smallest font-small-extra p-right p-left p-right-half-xs p-left-half-xs {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}"/>

                            {# Fake add to cart CTA visible during add to cart event #}
                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "js-addtocart-placeholder-inline full-width-xs btn-small btn-smallest font-small-extra p-right p-left p-right-half-xs p-left-half-xs"} %}

                        </form>
                        {% endif %}
                    </div>
                {% endif %}
        {% if settings.quick_view or settings.product_color_variants %}
            </div>
        {% endif %}
    </div>
    {# Structured data to provide information for Google about the product content #}
    {% include 'snipplets/structured_data/item-structured-data.tpl' %}
</div>
