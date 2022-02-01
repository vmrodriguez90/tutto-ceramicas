{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

{# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
{# Quantity by Square Meters #}
{% set SQUARE_METERS_LABEL = "M2 x Caja" %}
{% set has_square_meters = false %}
{% set square_meters = "" %}
{% set product_price_per_meter = "" %}
{% for variant in product.variations %}
    {% if variant.name == SQUARE_METERS_LABEL %}
        {% set has_square_meters = true %}
        {% set square_meters = variant.options[0].id %}
        {% set product_price_per_meter = product.price / square_meters %}
    {% endif %}
{% endfor %}
{# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}

{% set has_multiple_slides = product.images_count > 1 or product.video_url %}

<div class="row-fluid container-wide producto container-xs m-section-half">
    <div class="js-product-breadcrumbs-container span12">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div id="single-product" class="js-product-detail js-shipping-calculator-container js-has-new-shipping" >
        <div class="js-product-container" data-variants="{{product.variants_object | json_encode }}" data-component="product">
            <div class="js-product-left-col span7 p-relative" data-store="product-image-{{ product.id }}">
                <div class="product-img-col js-product-image-container">
                    <div class="product-img-desktop-container">
                        {% if has_multiple_slides %}
                            <div class="span3 hidden-phone">
                                <div class="js-swiper-product-thumbnails product-thumbnails-slider swiper-container">
                                    <div class="swiper-wrapper">
                                        {% for image in product.images %}
                                            <div class="swiper-slide">
                                                <a href="#" class="js-product-thumb product-thumb" data-slide-index="{{loop.index0}}">
                                                    <img src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="thumbnail-image lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                                                </a>
                                            </div>
                                        {% endfor %}
                                        {% include 'snipplets/product-video.tpl' with {thumb: true} %}
                                    </div>
                                    <div class="js-swiper-product-thumbnails-prev swiper-vertical-btn swiper-vertical-btn-prev">{% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x scroller-btn-arrow"} %}</div>
                                    <div class="js-swiper-product-thumbnails-next swiper-vertical-btn swiper-vertical-btn-next">{% include "snipplets/svg/angle-down-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-2x scroller-btn-arrow"} %}</div>
                                </div>
                            </div>
                        {% endif %}
                        <div class="m-height-auto-xs {% if has_multiple_slides %} span9 {% else %} span12 product-with-1-img {% endif %}">
                            <div class="product-featured-image p-relative text-center">
                                <div id="product-slider-container" class="product-slider-container {% if not has_multiple_slides %} product-single-image {% endif %}">
                                    {% if product.video_url %}
                                        <div class="js-labels-group">
                                    {% endif %}
                                        <div data-store="product-item-labels">
                                            <div class="product-label product-detail-label h6 label-primary {% if not product.promotional_offer %} js-offer-label {% endif %}" {% if not (product.compare_at_price or product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-{% if product.compare_at_price %}offer{% else %}promotion{% endif %}-label">
                                                <span>
                                                  {% if product.promotional_offer %}
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
                                                  {% else %}
                                                      <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>% OFF
                                                  {% endif %}
                                                </span>
                                            </div>
                                            {% if sections.new.products | find(product.id) %}
                                                <div class="product-label product-detail-label label-secondary">
                                                    <span>{{ "Nuevo" | translate }}</span>
                                                </div>
                                            {% endif %}
                                        </div>
                                    {% if product.video_url %}
                                        </div>
                                    {% endif %}
                                    <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>
                                    {% if product.images_count > 0 %}
                                        <div class="js-swiper-product product-slider no-slide-effect-md swiper-container" style="visibility:hidden; height:0;">
                                            <div class="swiper-wrapper">
                                                {% for image in product.images %}
                                                 <div class="swiper-slide js-product-slide {% if loop.first %}js-product-featured-image{% endif %} slider-slide product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ image | product_image_url('huge') }}">
                                                    <a href="{{ image | product_image_url('original') }}" class="js-desktop-zoom cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                                                        <img data-sizes="auto" src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                                                    </a>
                                                 </div>
                                                {% endfor %}
                                                {% include 'snipplets/product-video.tpl' %}
                                            </div>
                                            {% if has_multiple_slides %}
                                                <div class="js-swiper-product-pagination swiper-product-pagination swiper-pagination swiper-pagination-white visible-phone"></div>
                                            {% endif %}
                                        </div>
                                    {% endif %}
                                    <div class="visible-when-content-ready visible-phone">
                                        <a href="#" class="js-open-mobile-zoom btn-floating m-right-quarter m-top-quarter">
                                            <div class="zoom-svg-icon svg-icon-text">
                                                {% include "snipplets/svg/zoom-in.tpl" %}
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="hidden-phone">
                                {% include "snipplets/social-widgets.tpl" with {'mobile': false} %}
                            </div>
                        </div>
                    </div>
                </div>
                {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
                {% if product.description is not empty %}
                    <div class="description product-description product-description-desktop visible-when-content-ready user-content clear-both hidden-phone pull-left m-top" data-store="product-description-{{ product.id }}">
                        {{ product.description }}
                    </div>
                {% endif %}
            </div>
            <div class="js-product-right-col span5" data-store="product-info-{{ product.id }}">
                <div class="product-form-container">
                    <div class="js-product-name-price-container row-fluid">
                        <div class="span12">
                            <div class="title m-top-xs full-width">
                                <h1 id="product-name" class="product-name h2 h4-xs" itemprop="name" data-store="product-name-{{ product.id }}" data-component="product.name" data-component-value="{{ product.name }}">{{ product.name }}</h1>
                            </div>
                            <div class="price-holder pull-left-xs full-width" data-store="product-price-{{ product.id }}">
                                {% if product.promotional_offer.script.is_percentage_off %}
                                    <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                                {% endif %}
                                <div class="price product-price-container m-top-half text-left-xs m-bottom-xs m-bottom-half">
                                    {% if has_square_meters %}
                                        <div class="per-m2-container">
                                            <span class="price-compare per-m2">
                                                <span id="compare_price_display" class="js-compare-price-display price-compare h4 p-right-quarter" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                                    {% if product.compare_at_price %}
                                                        {{ (product.compare_at_price / square_meters) | money }}
                                                    {% endif %}
                                                </span>
                                            </span>
                                            <span class="price per-m2 product-price js-price-display" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %}>
                                                {% if product.display_price %}
                                                    {{ product_price_per_meter | money }} m²
                                                {% endif %}
                                            </span>
                                        </div>
                                    {% endif %}
                                    <span class="price-compare">
                                        <span id="compare_price_display" class="js-compare-price-display price-compare h4 p-right-quarter" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.compare_at_price %}
                                            {{ product.compare_at_price | money }}
                                        {% endif %}
                                      </span>
                                    </span>
                                  
                                    <span class="price product-price js-price-display" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.display_price %}
                                            {{ product.price | money }}
                                        {% endif %}
                                        {% if has_square_meters %}
                                            por caja
                                        {% endif %}
                                    </span>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-label product-detail-label label-light js-stock-label pull-left m-bottom-quarter m-right-quarter m-bottom-xs" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
                    {% if product.free_shipping %}
                        <div class="product-label product-detail-label label-light pull-left m-bottom-quarter m-bottom-xs">
                            <span class="m-right-quarter label-shipping-icon svg-icon-text">
                                {% include "snipplets/svg/truck.tpl" %}
                            </span>
                            {{ "Envío gratis" | translate }}
                        </div>
                    {% endif %}

                    {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}

                    {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                    <div class="js-product-promo-container row-fluid m-bottom-half clear-both pull-left m-top-quarter" data-store="product-promotion-info">
                        {% if product.promotional_offer.script.is_discount_for_quantity %}
                            {% for threshold in product.promotional_offer.parameters %}
                                <h4 class="promo-title text-secondary"><strong>{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h4>
                            {% endfor %}
                        {% else %}
                            <h4 class="promo-title text-secondary"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4>
                        {% endif %}
                        {% if product.promotional_offer.scope_type == 'categories' %}
                            <p class="promo-message font-small m-top-quarter">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
                            {% for scope_value in product.promotional_offer.scope_value_info %}
                               {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                            {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
                        {% elseif product.promotional_offer.scope_type == 'all'  %}
                            <p class="promo-message font-small m-top-quarter">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
                        {% endif %}
                    </div>
                    {% endif %}

                    <form id="product_form" class="js-product-form display-when-content-ready product-form clear-both" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">

                        <div class="p-relative m-bottom pull-left full-width">

                            {% if product.show_installments and product.display_price %}
                                {% set installments_info_base_variant = product.installments_info %}
                                {% set installments_info = product.installments_info_from_any_variant %}
                                {% if installments_info %}
                                    <a href="#installments-modal" data-toggle="modal" data-modal-url="modal-fullscreen-payments" class="js-fullscreen-modal-open js-product-payments-container visible-when-content-ready link-module product-payment-link" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                        <div class="m-bottom-half">
                                            {% snipplet "installments_in_product.tpl" %}
                                        </div>
                                        {% set has_payment_logos = settings.payments %}
                                        {% if has_payment_logos %}
                                            <div class="span6 m-left-none m-bottom-quarter">
                                                <ul class="list-style-none p-none-left">
                                                    {% for payment in settings.payments %}
                                                        {# Payment methods flags #}
                                                        {% if store.country == 'BR' %}
                                                            {% if payment in ['visa', 'mastercard'] %}
                                                                <li class="d-inline-block">
                                                                    <span class="js-product-detail-payment-logo">
                                                                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" />
                                                                    </span>
                                                                </li>
                                                            {% endif %}
                                                        {% else %}
                                                            {% if payment in ['visa', 'amex', 'mastercard'] %}
                                                                <li class="d-inline-block">
                                                                    <span class="js-product-detail-payment-logo">
                                                                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" />
                                                                    </span>
                                                                </li>
                                                            {% endif %}
                                                        {% endif %}
                                                    {% endfor %}
                                                    <li class="d-inline-block">
                                                        <span class="js-product-detail-payment-logo svg-icon-text p-relative pull-left opacity-80">
                                                            {% include "snipplets/svg/credit-card-installments-regular.tpl" %}
                                                            {% include "snipplets/svg/plus-solid.tpl" %}
                                                        </span>
                                                    </li>
                                                </ul>
                                            </div>
                                        {% endif %}
                                        {# Cash discount #}
                                        {% if custom_payment.discount > 0 %}
                                            <div class="span12 m-left-none m-bottom-half p-right-double">
                                                <span class="text-tertiary"><strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ custom_payment.name }}</span>
                                            </div>
                                        {% endif %}

                                        {% if product.show_installments and product.display_price %}
                                            {# Desktop installments link #}
                                            <div id="btn-installments" class="btn-link pull-left clear-both {% if store.installments_on_steroids_enabled %} js-open-installments-modal-desktop {% endif %}" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                                {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                                                {% if store_set_for_new_installments_view %}
                                                    {{ "Ver medios de pago" | translate }}
                                                {% else %}
                                                    {{ "Ver el detalle de las cuotas" | translate }}
                                                {% endif %}
                                            </div>
                                            <div class="visible-phone link-module-icon link-module-icon-right">
                                                {% include "snipplets/svg/angle-right-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}
                                            </div>
                                        {% endif %}
                                    </a>
                                {% endif %}
                            {% endif %}
                        </div>

                        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                        {% if product.variations %}
                            <div class="js-product-variants row-fluid">
                                {% include "snipplets/variants.tpl" with {'quickshop': false, 'show_size_guide': true} %}
                            </div>
                        {% endif %}
                        {% if product.available and product.display_price %}
                            {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
                            {# Quantity by Square Meters #}
                            {% if has_square_meters == true %}
                                <div class="square-meters-container">
                                    <label class="variant-label">
                                        Metros² que necesitas cubrir:
                                    </label>
                                    <input id="squarequantity" class="spinner quantity-input" value="1" type="number" name="squarequantity" min="1" />
                                    <a href="#" class="btn btn-primary calculate-boxes">
                                        Calcular
                                    </a>
                                </div >
                            {% endif %}
                            {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}

                            <div class="js-product-quantity-container row-fluid quantity-container {% if settings.shipping_calculator_product_page and not product.free_shipping %}border-bottom-none-xs m-bottom-none{% endif %}">
                                <div class="quantity span3" data-component="product.adding-amount">
                                    <label for="quantity" class="quantity-label">
                                        {{ "Cantidad" | translate }}
                                    </label>
                                    <input id="quantity" class="js-product-quantity js-quantity-input spinner quantity-input" value="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" data-component="adding-amount.value"/>
                                </div>
                                {% if settings.last_product %}
                                    <div class="{% if product.variations %}js-last-product {% endif %}span9 pull-left-xs"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                                        <div class="product-detail-text text-primary weight-strong">
                                            {{ settings.last_product_text }}
                                        </div>
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}

                        {# Ghost button placeholder to maintain position of elements when CTA is fixed #}
                        <div class="js-product-buy-placeholder hidden hidden-phone">
                        </div>
                        <div class="js-product-buy-container product-buy-fixed">
                            <div class="row-fluid">
                                <div class="product-buy-container span12">
                                    <div class="product-fixed-info pull-left">
                                        <span class="product-name-fixed h5 row-fluid pull-left">{{ product.name }}</span>
                                        <span class="price product-price product-price-fixed h2 js-price-display row-fluid" {% if not product.display_price %}style="display:none;"{% endif %}>
                                            {% if product.display_price %}
                                                {{ product.price | money }}
                                            {% endif %}
                                        </span>
                                    </div>
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                    {# Add to cart CTA #}

                                    <input type="submit" class="product-buy-btn btn btn-primary js-prod-submit-form js-addtocart span12 {{state}}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

                                    {# Fake add to cart CTA visible during add to cart event #}
                                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "full-width"} %}
                                    
                                    {% if settings.ajax_cart %}
                                        <div class="js-added-to-cart-product-message pull-left full-width m-bottom-half m-top-half" style="display: none;">
                                            {{'Ya agregaste este producto.' | translate }}
                                            <a href="#" class="js-toggle-cart js-fullscreen-modal-open btn btn-link p-left-quarter p-bottom-none p-top-none" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                        </div>

                        {# Define contitions to show shipping calculator and store branches on product page #}

                        {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

                        {% if show_product_fulfillment %}

                            {% set store_has_pickup_and_shipping = store.has_shipping and store.branches %}

                            <div id="product-shipping-container" class="js-product-shipping-container row-fluid m-top p-top-half" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                                {# Shipping Calculator #}

                                {% if store.has_shipping %}
                                    <div class="row-fluid {% if store_has_pickup_and_shipping %}m-bottom-half p-bottom-quarter{% endif %}">
                                        {% include "snipplets/shipping/shipping_cost_calculator.tpl" with { 'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                                    </div>
                                {% endif %}

                                {# Store branches #}

                                {% if store.branches %}
                                    {# Link for branches modal #}
                                    {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': true} %}
                                {% endif %}
                            </div>
                        {% endif %}
                    </form>
                    {% include "snipplets/social-widgets.tpl" with {'mobile': true} %}
                    {% if product.description is not empty %}
                        <div class="description product-description product-description-mobile visible-when-content-ready user-content clear-both visible-phone" data-store="product-description-{{ product.id }}">
                            {{ product.description }}
                        </div>
                    {% endif %}
                </div>
            </div>
            {% if settings.show_product_fb_comment_box %}
                <div class="row-fluid fb-com-cont js-facebook-comments clear-both">
                    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                </div>
            {% endif %}
        </div>
    </div>
</div>
<div id="related-products" class="js-related-products m-section" data-store="related-products">
    {% set related_products = [] %}
    {% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
    {% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}
    {% if has_related_products_from_app %}
        {% set related_products = related_products_ids_from_app | get_products %}
    {% endif %}
    {% if related_products is empty %}
        {% set max_related_products_length = 4 %}
        {% set max_related_products_achieved = false %}
        {% set related_products_without_stock = [] %}
        {% set max_related_products_without_achieved = false %}
        
        {% set products_from_category = category.products | shuffle %}
        {% for product_from_category in products_from_category if not max_related_products_achieved and product_from_category.id != product.id %}
            {%  if product_from_category.stock is null or product_from_category.stock > 0 %}
                {% set related_products = related_products | merge([product_from_category]) %}
            {% elseif (related_products_without_stock | length < max_related_products_length) %}
                {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
            {% endif %}
            {%  if (related_products | length == max_related_products_length) %}
                {% set max_related_products_achieved = true %}
            {% endif %}
        {% endfor %}
        {% if (related_products | length < max_related_products_length) %}
            {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
            {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}
            
            {% set related_products = related_products | merge(related_products_for_refill)  %}
        {% endif %}
    {% endif %}
    {% if related_products | length > 0 %}
        <div class="row-fluid container-wide">
            <div class="subtitle-container m-bottom">
                <h2 class="h5-xs">{{ "Productos Relacionados" | translate }}</h2>
            </div>
            <div class="grid-row">
                {% for related in related_products %}
                    {% include 'snipplets/single_product.tpl' with { product : related } %}
                {% endfor %}
            </div>
        </div>
    {% endif %}
</div>

{# Payments details #}

{% include 'snipplets/payments/payments.tpl' %}

<div class="js-mobile-zoom-panel mobile-zoom-panel">
    {% include "snipplets/svg/sync-alt-regular.tpl" with {fa_custom_class: "js-mobile-zoom-spinner svg-inline--fa fa-2x  mobile-zoom-spinner fa-spin svg-icon-text"} %}
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn-floating m-right m-top">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}
    </a>
</div>

{# Product video modal on mobile #}

{% include 'snipplets/product-video.tpl' with {product_video_modal: true} %}
