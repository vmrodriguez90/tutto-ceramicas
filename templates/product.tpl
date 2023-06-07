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

<div class="row-fluid">
	<div class="container">
        <div class="pull-right full-width text-center-xs">
            {% snipplet "breadcrumbs.tpl" %}
        </div>
        <div id="single-product" class="js-product-detail js-shipping-calculator-container js-has-new-shipping">
            <div id="single-product-container" class="js-product-container" data-variants="{{product.variants_object | json_encode }}">
                <div class="span6" data-store="product-image-{{ product.id }}">
                    <div class="js-product-image-container product-img-col p-relative pull-left full-width m-bottom">
                        <div class="{% if product.video_url %}js-labels-group{% endif %} labels-floating labels-floating-left-xs">
                            <div class="js-stock-label label label-circle label-secondary label-circle-big m-bottom-quarter pull-left" {% if product.has_stock %}style="display:none;"{% endif %}>
                                <span class="label-text">{{ "Sin stock" | translate }}</span>
                            </div>
                            <div class="pull-right pull-left-xs clear-both-xs" data-store="product-item-labels">
                                <div class="label label-circle label-primary label-accent clear-both m-bottom-quarter {% if not product.promotional_offer %}js-offer-label{% endif %}" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-{% if product.compare_at_price %}offer{% else %}promotion{% endif %}-label">
                                    {% if product.promotional_offer.script.is_percentage_off %}
                                        <span class="label-text">
                                            <div>
                                                {{ product.promotional_offer.parameters.percent * 100 }}%
                                            </div>
                                            <div> OFF</div>
                                        </span>
                                    {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                        <span class="label-text">
                                            <div>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</div>
                                            <div class="label-small p-right-quarter p-left-quarter">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                        </span>
                                    {% elseif product.promotional_offer %}
                                        {% if store.country == 'BR' %}
                                            <span class="label-text">
                                            {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                            </span>
                                        {% else %}
                                            <span class="label-text">
                                                <div>{{ product.promotional_offer.script.type }}</div>
                                            </span>
                                        {% endif %}
                                    {% else %}
                                        <span class="label-text">
                                            <div>
                                                <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>%
                                            </div>
                                            <div> OFF</div>
                                        </span>
                                    {% endif %}
                                </div>
                                 {% if product.free_shipping %}
                                    <div class="label label-accent label-circle label-primary clear-both">
                                        <span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                        <span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>
                        <div class="product-slider-container no-slide-effect-md {% if not has_multiple_slides %} product-single-image {% endif %}">
                            {% if product.images_count > 0 %}
                                <div class="js-swiper-product swiper-container product-slider no-slide-effect-md">
                                    <div class="thumbs-container swiper-wrapper">
                                        {% for image in product.images %}
                                            <div class="js-product-slide swiper-slide slider-slide product-slide {% if store.useNativeJsLibraries() %}desktop-zoom-container{% endif %}" data-image="{{image.id}}" data-image-position="{{loop.index0}}" {% if not store.useNativeJsLibraries() %}
                                                data-zoom-url="{{ image | product_image_url('huge') }}"
                                            {% endif %}
                                            >
                                            {% if store.useNativeJsLibraries() %}
                                                <div class="js-desktop-zoom p-relative d-block" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                                            {% else %}
                                                <a href="{{ image | product_image_url('original') }}" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                                            {% endif %}
                                                    <img data-sizes="auto" src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                                                {% if store.useNativeJsLibraries() %}
                                                    <div class="js-desktop-zoom-big desktop-zoom-big product-slider-image hidden-phone" data-desktop-zoom="{{ image | product_image_url('original') }}"></div>
                                                {% endif %}
                                            {% if store.useNativeJsLibraries() %}
                                                </div>
                                            {% else %}
                                                </a>
                                            {% endif %}
                                            </div>
                                        {% endfor %}
                                        {% include 'snipplets/product-video.tpl' %}
                                    </div>
                                    {% if has_multiple_slides %}
                                        <div class="js-swiper-product-pagination swiper-pagination m-bottom-quarter visible-phone"></div>
                                    {% endif %}
                                </div>
                            {% endif %}
                            <div class="visible-when-content-ready visible-phone">
                                <a href="#" class="js-open-mobile-zoom btn-floating m-right-quarter m-top-quarter">
                                    <div class="zoom-svg-icon svg-primary-fill">
                                        {% include 'snipplets/svg/expand.tpl' %}
                                    </div>
                                </a>
                            </div>
                        </div>
                        {% if has_multiple_slides %}
                            <div class="js-swiper-product-thumbnails product-thumbnails-slider swiper-container hidden-phone m-top">
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
                                <div class="js-swiper-product-thumbnails-prev swiper-button-prev thumbs-btn">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}</div>
                                <div class="js-swiper-product-thumbnails-next swiper-button-next thumbs-btn">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}</div>
                            </div>
                        {% endif %}
					</div>
                    {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
                </div>
                <div class="span6 clear-both-xs" data-store="product-info-{{ product.id }}">
                    <div class="product-form-container">
                        <div class="row-fluid">
                            <h1 itemprop="name" class="product-name" data-store="product-name-{{ product.id }}">{{ product.name }}</h1>
                            <div {% if not product.display_price %}style="display:none;"{% endif %}>
                                {% if product.promotional_offer.script.is_percentage_off %}
                                    <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                                {% endif %}
                                <div class="product-price-container" data-store="product-price-{{ product.id }}">
                                    {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
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
                                                {{ product_price_per_meter | money }} x m²
                                            {% endif %}
                                        </span>
                                    </div>
                                    {% endif %}
                                    {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
                                    <span class="js-price-display product-price" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.display_price %}
                                            {{ product.price | money }}
                                        {% endif %}
                                        {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
                                        {% if has_square_meters %}
                                            por caja
                                        {% endif %}
                                        {# CHANGE MADE BY: victormanuelrodriguez90@gmail.com  #}
                                    </span>
                                    <span id="compare_price_display" class="js-compare-price-display product-price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.compare_at_price %}
                                            {{ product.compare_at_price | money }}
                                        {% endif %}
                                    </span>

                                    {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                                        <div data-store="product-promotion-info">
                                            <h6 class="m-top text-primary">
                                            {% if product.promotional_offer.script.is_discount_for_quantity %}
                                                {% for threshold in product.promotional_offer.parameters %}
                                                   {{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}
                                                {% endfor %}
                                            {% else %}
                                                {{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                            {% endif %}
                                            </h6>
                                            {% if product.promotional_offer.scope_type == 'categories' %}
                                                <p class="font-small m-top-half">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
                                                {% for scope_value in product.promotional_offer.scope_value_info %}
                                                   {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                                                {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
                                            {% elseif product.promotional_offer.scope_type == 'all'  %}
                                                <p class="font-small m-top-half">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
                                            {% endif %}
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                        {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}
                        <div class="m-bottom pull-left full-width">
                            {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
                            {% if product.show_installments and product.display_price %}
                                {% set installments_info_base_variant = product.installments_info %}
                                {% set installments_info = product.installments_info_from_any_variant %}
                                {% if installments_info or hasDiscount %}
                                    <a href="#installments-modal" data-toggle="modal" data-modal-url="modal-fullscreen-payments" class="js-fullscreen-modal-open js-product-payments-container js-refresh-installment-data display-when-content-ready link-module product-payment-link" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
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
                                                        <span class="js-product-detail-payment-logo p-relative pull-left svg-text-fill opacity-80">
                                                            {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg fa-credit-card payment-credit-icon pull-left"} %}
                                                            {% include "snipplets/svg/plus-solid.tpl" %}
                                                        </span>
                                                    </li>
                                                </ul>
                                            </div>
                                        {% endif %}
                                        {# Max Payment Discount #}
                                        {% if hasDiscount %}
                                          <div class="span12 m-left-none m-bottom-half">
                                            <span class="text-tertiary"><strong>{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}</span>
                                          </div>
                                        {% endif %}

                                        {% if product.show_installments and product.display_price %}
                                            <div id="btn-installments" class="btn-link pull-left clear-both" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                                {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                                                {% if store_set_for_new_installments_view %}
                                                    {{ "Ver medios de pago" | translate }}
                                                {% else %}
                                                    {{ "Ver el detalle de las cuotas" | translate }}
                                                {% endif %}
                                            </div>
                                            <div class="visible-phone link-module-icon-right link-module-icon">
                                                {% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
                                            </div>
                                        {% endif %}
                                    </a>
                                {% endif %}
                            {% endif %}
                        </div>
                        <form id="product_form" class="js-product-form display-when-content-ready" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                {% include "snipplets/variants.tpl" with {'quickshop': false} %}
                            {% endif %}
                            <div class="row-fluid">
                                {% include "snipplets/product-quantity.tpl" %}
                                <div class="js-product-cta-container product-buy-container span9 {% if product.available and product.display_price %} m-top p-top-quarter {% endif %} m-bottom">
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                    {# Add to cart CTA #}

                                    <input type="submit" class="btn btn-primary full-width js-prod-submit-form js-addtocart {{state}} m-bottom-half" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button"/>

                                    {# Fake add to cart CTA visible during add to cart event #}
                                        
                                    {% include 'snipplets/placeholders/button-placeholder.tpl' %}
                                </div>
                                {% if settings.ajax_cart %}
                                    <div class="js-added-to-cart-product-message pull-left full-width m-bottom p-bottom-quarter m-top" style="display: none;">
                                        {{'Ya agregaste este producto.' | translate }}
                                        <a href="#" class="js-toggle-cart js-fullscreen-modal-open btn-link btn-link-small p-left-quarter"  data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                                    </div>
                                {% endif %}
                            </div>

                            {# Define contitions to show shipping calculator and store branches on product page #}

                            {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

                            {% if show_product_fulfillment %}

                                {# Shipping calculator and branch link #}

                                <div id="product-shipping-container" class="row-fluid m-bottom" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">


                                    {# Shipping Calculator #}

                                    {% if store.has_shipping %}
                                        {% include "snipplets/shipping/shipping_cost_calculator.tpl" with { 'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                                    {% endif %}

                                    {# Store branches #}

                                    {% if store.branches %}
                                        {# Link for branches modal #}
                                        {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': true} %}
                                    {% endif %}
                                </div>

                            {% endif %}
                        </form>
                        {% include "snipplets/social-widgets.tpl" %}

                        <div class="description user-content display-when-content-ready" data-store="product-description-{{ product.id }}">
                            {{ product.description }}
                        </div>
                        {% if settings.show_product_fb_comment_box %}
                            <div class="fb-comments display-when-content-ready" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="related-products" data-store="related-products">
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
        <div class="row-fluid m-top">
            <div class="container m-bottom">
                <h6 class="subtitle">{{"Productos Relacionados" | translate}}</h6>
                <div class="grid-row m-top-xs">
                    {% for related in related_products %}
                        {% include 'snipplets/single_product.tpl' with {product : related} %}
                    {% endfor %}
                </div>
            </div>
        </div>
    {% endif %}
</div>

{# Payments details #}

{% include 'snipplets/payments/payments.tpl' %}

<div class="js-mobile-zoom-panel mobile-zoom-panel">
    {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "js-mobile-zoom-spinner svg-inline--fa fa-2x fa-spin mobile-zoom-spinner svg-text-fill"} %}
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn-floating m-right m-top">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
    </a>
</div>

{# Product video modal on mobile #}

{% include 'snipplets/product-video.tpl' with {product_video_modal: true} %}
