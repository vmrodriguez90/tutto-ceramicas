<div id="shoppingCartPage" class="page-carrito container-wide container-xs" data-minimum="{{ settings.cart_minimum_value }}">

    {# Define contitions to show shipping calculator and store branches on cart #}

    {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
    {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

    {% snipplet "breadcrumbs.tpl" %}    
    {# Page preloader #}
    <div class="page-loading-icon-container full-width hidden-when-content-ready">
        <div class="page-loading-icon page-loading-icon opacity-80 rotate">
            {% include "snipplets/svg/spinner.tpl" %}
        </div>
    </div>
    <span class="js-has-new-shipping" data-priceraw="{{ cart.subtotal }}"></span>
    {% if cart.items %}
        {% if error.add %}
            <div class="alert alert-warning fade in">
                {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
                <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
            </div>
        {% endif %}
        {% for error in error.update %}
            <div class="text-center alert alert-warning fade in">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
        {% endfor %}
        <div class="visible-when-content-ready">
            <form action="" method="post" data-store="cart-form">

                <div class="cart-contents cart-table js-cart-contents">             
                    <ul class="firstrow row-fluid cart-table-header">
                        <li class="col-product span5">{{ "Producto" | translate }}</li>
                        <li class="col-quantity span2">{{ "Cantidad" | translate }}</li>
                        <li class="col-price span2">{{ "Precio" | translate }}</li>
                        <li class="col-subtotal span2 last">{{ "Subtotal" | translate }}</li>
                    </ul>

                    {# Cart items #}

                    {% for item in cart.items %}

                    {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

                    <ul class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row h5 font-body-xs row-fluid m-top-half-xs" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">
                        <li class="col-product cart-table-product span5 m-left-none">
                            <div class="row-fluid">

                                {# Cart item image #}
                                <div class="span2">
                                    <a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'cart-table-img'}) }}</a>
                                </div>

                                {# Cart item name #}
                                <div class="span10 m-top hidden-phone p-left">
                                    <a class="name text-wrap" href="{{ item.url }}">
                                        {{ item.short_name }}
                                        <small>{{ item.short_variant_name }}</small>
                                    </a>
                                    {% if show_free_shipping_label %}
                                        <div class="m-top-none m-bottom-quarter">
                                            <span class="item-label product-label label-light label-small">{{ "Envío gratis" | translate }}</span>
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                        </li>
                        <li class="col-quantity cart-quantity span2 m-top m-none-xs">

                            {# Cart item mobile name #}
                            <div class="name cart-item-name visible-phone">
                                <a class="h6-xs" href="{{ item.url }}">
                                    {{ item.short_name }}
                                    <small>{{ item.short_variant_name }}</small>
                                </a>
                                {% if show_free_shipping_label %}
                                    <div class="m-top-none m-bottom-quarter">
                                        <span class="item-label product-label label-light label-small">{{ "Envío gratis" | translate }}</span>
                                    </div>
                                {% endif %}
                            </div>

                            {# Cart item quantity controls #}
                            <button type="button" class="js-cart-quantity-btn cart-quantity-btn" onclick="LS.minusQuantity({{ item.id }})">
                                <div class="cart-quantity-svg-icon svg-icon-text">
                                    {% include "snipplets/svg/minus.tpl" %}
                                </div>
                            </button>
                            <div class="cart-quantity-input-container d-inline-block pull-left">
                                {# Always place this spinner before the quantity input #}
                                <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                                    {% include "snipplets/svg/sync-alt-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-icon-text"} %}
                                </span>
                                <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input" />
                            </div>
                            <button type="button" class="js-cart-quantity-btn cart-quantity-btn" onclick="LS.plusQuantity({{ item.id }})">
                                <div class="cart-quantity-svg-icon svg-icon-text">
                                    {% include "snipplets/svg/plus.tpl" %}
                                </div>
                            </button>

                            {# Cart item mobile subtotal #}
                            <div class="visible-phone cart-item-subtotal pull-right h6">
                                <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                            </div>
                        </li>

                        {# Cart item unit price #}
                        <li class="col-price cart-item-subtotal span2 m-top p-top-quarter hidden-phone">
                            <span class="pull-right-xs m-top-quarter-xs">{{ item.unit_price | money }}</span>
                        </li>

                        {# Cart item subtotal #}
                        <li class="cart-item-subtotal span2 hidden-phone m-top p-top-quarter">
                            <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                        </li>

                        {# Cart item delete #}
                        <li class="col-delete last span1 m-top m-top-none-xs cart-delete-container">
                            <button type="button" class="item-delete cart-btn-delete p-top-none pull-right-xs" onclick="LS.removeItem({{ item.id }})">
                                <div class="cart-delete-svg-icon svg-icon-text">
                                    {% include "snipplets/svg/trash-o.tpl" %}
                                </div>
                            </button>
                        </li>
                    </ul>
                    {% endfor %}
                    
                    {# Cart totals #}
                    <div class="totals-container cart-totals-container">
                        <div class="row-fluid">
                            <div class="span12 visible-phone">

                                {# Cart subtotal #}

                                <div class='cart-subtotal h4 subtotal-information row-fluid' data-store="cart-subtotal">
                                    <span class="pull-left text-left">
                                        {{ "Subtotal" | translate }} 
                                        <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                                        :
                                    </span>
                                    <span class="js-cart-subtotal pull-right text-right weight-strong m-left-quarter" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                                </div>

                                {# Cart promos #}
                                <div class="js-total-promotions total-promotions h6 clear-both">
                                    {% for promotion in cart.promotional_discount.promotions_applied %}
                                        {% if(promotion.scope_value_id) %}
                                            {% set id = promotion.scope_value_id %}
                                        {% else %}
                                            {% set id = 'all' %}
                                        {% endif %}
                                        <span class="js-total-promotions-detail-row total-promotions-row pull-left" id="{{ id }}">
                                            <span class="pull-left cart-promotion-detail">
                                                {% if promotion.discount_script_type == "NAtX%off" %}
                                                    {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                                                {% else %}
                                                    {{ "Promo" | translate }} {{ promotion.discount_script_type }} 
                                                {% endif %}

                                                {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}
                                                
                                                {% if promotion.discount_script_type == "NAtX%off" %}
                                                    <span class="text-lowercase">{{ "Comprando {1} o más." | translate(promotion.selected_threshold.quantity) }}</span>
                                                {% endif %}
                                                :  
                                            </span>
                                            <span class="cart-promotion-number weight-strong text-primary pull-right">-{{ promotion.total_discount_amount_short }}</span>
                                        </span>
                                    {% endfor %}
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid">

                            {# Cart shipping #}

                            {% if show_cart_fulfillment %}
                                
                                <div class="span5 m-height-auto-xs m-top-xs">
                                    <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>
                                        <div class="js-shipping-calculator-container row-fluid">

                                            {# Shipping method is no longer available alert #}

                                            <div class="js-shipping-method-unavailable alert alert-warning clear-both m-top-half pull-right text-left" style="display: none;">
                                                <div>
                                                    <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong>
                                                </div>
                                                <div>
                                                    {{ '¡No te preocupes! Podés elegir otro.' | translate}}
                                                </div>
                                            </div>

                                            {% set store_has_pickup_and_shipping = store.has_shipping and store.branches %}

                                            <div id="cart-shipping-container" class="shipping-calcuator-container row-fluid m-bottom-half" data-shipping-url="{{ store.shipping_calculator_url }}">
                                                {# Used to save shipping #}

                                                <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hide">{{ cart.shipping_data.name }}</span>

                                                {# Shipping Calculator #}

                                                {% if store.has_shipping %}
                                                    <div class="row-fluid {% if store_has_pickup_and_shipping %}m-bottom-half p-bottom-quarter{% endif %}">
                                                        {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'product_detail': false} %}
                                                    </div>
                                                {% endif %}

                                                {# Store branches #}

                                                {% if store.branches %}
                                                    {# Link for branches modal #}
                                                    {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                                                {% endif %}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            {% endif %}
                 
                            <div class="{% if show_cart_fulfillment %} span7 {% else %} span12 {% endif %} cart-totals text-right">
                                <div class="hidden-phone">
                                    <div class='h4 cart-subtotal subtotal-information m-top-none' data-store="cart-subtotal">
                                        <span class="pull-left text-left">
                                            {{ "Subtotal" | translate }} 
                                            <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                                            :
                                        </span>
                                        <span class="js-cart-subtotal pull-right text-right weight-strong m-left-quarter" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                                    </div>
                                    <div class="js-total-promotions total-promotions h6 clear-both pull-right">
                                        <span class="js-promo-title" style="display:none;">{{ "Promo" | translate }}</span>
                                        <span class="js-promo-in" style="display:none;">{{ "en" | translate }}</span>
                                        <span class="js-promo-all" style="display:none;">{{ "todos los productos" | translate }}</span>
                                        <span class="js-promo-buying" style="display:none;"> {{ "comprando" | translate }}</span>
                                        <span class="js-promo-units-or-more" style="display:none;"> {{ "o más." | translate }}</span>
                                        {% for promotion in cart.promotional_discount.promotions_applied %}
                                            {% if(promotion.scope_value_id) %}
                                                {% set id = promotion.scope_value_id %}
                                            {% else %}
                                                {% set id = 'all' %}
                                            {% endif %}
                                            <span class="js-total-promotions-detail-row total-promotions-row p-bottom-quarter" id="{{ id }}">
                                                {% if promotion.discount_script_type == "NAtX%off" %}
                                                    {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                                                {% else %}
                                                    {{ "Promo" | translate }} {{ promotion.discount_script_type }} 
                                                {% endif %}

                                                {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}
                                                
                                                {% if promotion.discount_script_type == "NAtX%off" %}
                                                    <span class="text-lowercase">{{ "Comprando {1} o más." | translate(promotion.selected_threshold.quantity) }}</span>
                                                {% endif %}
                                                :  
                                                <span class="cart-promotion-number weight-strong text-primary m-left-quarter">-{{ promotion.total_discount_amount_short }}</span>
                                            </span>
                                        {% endfor %}
                                    </div>
                                </div>

                                {# Cart total #}

                                <div class='cart-total h2 row-fluid' data-store="cart-total">
                                    <span class="font-normal pull-left-xs">{{ "Total" | translate }}:</span>
                                    <span class="js-cart-total {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %}" data-priceraw="{{ cart.total }}">{{ cart.total | money }}</span>
                                    
                                    {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
                                    <div class='total-price hidden' data-priceraw="{{ cart.total }}">
                                        {{ "Total" | translate }}: {{ cart.total | money }}
                                    </div>

                                    {# Cart installments #}
  
                                    {% if cart.installments.max_installments_without_interest > 1 %}
                                        {% set installment =  cart.installments.max_installments_without_interest  %}
                                        {% set total_installment = cart.total %}
                                        {% set interest = false %}
                                        {% set interest_value = 0 %}
                                    {% else %}
                                        {% set installment = cart.installments.max_installments_with_interest  %}
                                        {% set total_installment = (cart.total * (1 + cart.installments.interest)) %}
                                        {% set interest = true %}
                                        {% set interest_value = cart.installments.interest %}
                                    {% endif %}
                                    <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body m-top-quarter">    
                                        {{ 'O hasta' | translate }}
                                        {% if interest == true %}
                                          {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                                        {% else %}
                                          {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                                        {% endif %}
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                {# Cart alert #}
                <div id="error-ajax-stock" class='alert alert-warning' style="display: none">
                    {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
                    <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
                </div>

                {% if cart.items and settings.continue_buying %}
                    {% set last_item_added = (cart.items | first) %}
                        <a href="{{ last_item_added.product.category.url }}" class="hidden-phone btn btn-link m-top continue-buying full-width-xs">{{ 'Ver más productos' | translate }}</a>    
                {% endif %}

                {# Cart CTA #}

                <div class="go-to-checkout m-top m-top-half-xs m-bottom pull-right full-width-xs">
                {% set cart_total = (settings.cart_minimum_value * 100) %}
                {% if cart.checkout_enabled %}
                   <input id="go-to-checkout" class="js-go-checkout-btn button full-width-xs btn btn-primary text-center-xs" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" autocomplete="off"/>
                {% else %}
                    <h3 class="pull-right">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</h3>
                {% endif %}                 
                </div>

                {% if cart.items and settings.continue_buying %}
                    {% set last_item_added = (cart.items | first) %}
                        <a href="{{ last_item_added.product.category.url }}" class="visible-phone btn btn-link m-top continue-buying full-width-xs clear-both m-bottom">{{ 'Ver más productos' | translate }}</a>    
                {% endif %}
            </form>
        </div>
    {% else %}

        {# Cart alerts #}
        <div class="alert alert-warning">
            {% if error %}
                {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
                <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
            {% else %}
                {{ "El carrito de compras está vacío." | translate }}
            {% endif %}
            {{ ("Ver más productos" | translate ~ " »") | a_tag(store.products_url) }}
        </div>
    {% endif %}
    <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>