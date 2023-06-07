<div class="row-fluid">
    <div class="container">
        <div class="title-container" data-store="page-title">
            <div class="span8">
                <h1>{{ "Carrito de compras" | translate }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        
        {# Page preloader #}
        <div class="page-loading-icon-container full-width hidden-when-content-ready">
            <div class="page-loading-icon page-loading-icon opacity-80 rotate">
                {% include "snipplets/svg/spinner.tpl" %}
            </div>
        </div>

        <span class="js-has-new-shipping" data-priceraw="{{ cart.subtotal }}"></span>
        <div id="shoppingCartPage" data-minimum="{{ settings.cart_minimum_value }}">

            {# Define contitions to show shipping calculator and store branches on cart #}

            {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
            {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

            {# Cart alerts #}

            {% if error.add %}
                {{ component('alert', {
                    'type': 'warning',
                    'message': 'our_components.cart.error_messages.' ~ error.add,
                    'class': 'fade in',
                }) }}
            {% endif %}

            {% if cart.items %}
                {% for error in error.update %}
                    <div class="alert alert-warning fade in">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
                {% endfor %}
                <div class="visible-when-content-ready">
                    <form id="cart-form" action="" method="post" data-store="cart-form">
                        <div class="cart-contents cart-table js-cart-contents">
                            <ul class="row-fluid cart-table-header pull-left hidden-phone">
                                <li class="col-product span5">{{ "Producto" | translate }}</li>
                                <li class="col-quantity span2">{{ "Cantidad" | translate }}</li>
                                <li class="col-price span2">{{ "Precio" | translate }}</li>
                                <li class="col-subtotal span2 last">{{ "Subtotal" | translate }}</li>
                            </ul>

                            {# Cart items #}

                            {% for item in cart.items %}

                                {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

                                <ul class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} cart-table-row h5 font-body-xs row-fluid m-top-half-xs" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

                                    {# Cart item name mobile #}
                                    <li class="visible-phone cart-item-name full-width h6-xs">
                                        <a href="{{ item.url }}">{{ item.short_name }}</a>
                                        <small>{{ item.short_variant_name }}</small>
                                        {% if show_free_shipping_label %}
                                            <i class="label label-primary text-uppercase weight-normal font-small-extra">{{ "Envío gratis" | translate }}</i>
                                        {% endif %}
                                    </li>
                                    <li class="col-product cart-table-product span5 m-left-none">
                                        <div class="row-fluid">

                                            {# Cart item image #}
                                            <div class="span2">
                                                <a href="{{ item.url }}">{{ item.featured_image | product_image_url("medium") | img_tag(item.featured_image.alt, {class: 'cart-table-img'}) }}</a>
                                            </div>

                                            {# Cart item name #}
                                            <div class="span10 m-top hidden-phone p-left">
                                                <a class="text-wrap h6" href="{{ item.url }}">
                                                    {{ item.short_name }}
                                                </a>
                                                <small>{{ item.short_variant_name }}</small>
                                                {% if show_free_shipping_label %}
                                                    <div class="m-bottom">
                                                        <i class="label label-primary text-uppercase weight-normal font-small-extra">{{ "Envío gratis" | translate }}</i>
                                                    </div>
                                                {% endif %}
                                            </div>
                                        </div>
                                    </li>

                                    {# Cart item quantity controls #}
                                    <li class="col-quantity cart-quantity span2 m-top m-none-xs">
                                        <button type="button" class="js-cart-quantity-btn cart-quantity-btn visible-phone" onclick="LS.minusQuantity({{ item.id }})">
                                            <div class="cart-quantity-svg-icon svg-text-fill">
                                                {% include "snipplets/svg/minus.tpl" %}
                                            </div>
                                        </button>
                                        <div class="cart-quantity-input-container d-inline-block pull-left">
                                            {# Always place this spinner before the quantity input #}
                                            <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
                                              {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-text-fill"} %}
                                            </span>
                                            <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" data-item-id="{{ item.id }}" pattern="\d*" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input form-control form-control-secondary" />
                                        </div>
                                        <div class="d-inline-block m-left-quarter m-none-xs">
                                            <button type="button" class="js-cart-quantity-btn cart-quantity-btn" onclick="LS.plusQuantity({{ item.id }})">
                                                <div class="cart-quantity-svg-icon svg-text-fill">
                                                    {% include "snipplets/svg/plus.tpl" %}
                                                </div>
                                            </button>
                                            <button type="button" class="js-cart-quantity-btn cart-quantity-btn hidden-phone" onclick="LS.minusQuantity({{ item.id }})">
                                                <div class="cart-quantity-svg-icon svg-text-fill">
                                                    {% include "snipplets/svg/minus.tpl" %}
                                                </div>
                                            </button>
                                        </div>

                                        {# Cart item mobile subtotal #}
                                        <div class="visible-phone cart-item-subtotal pull-right h6">
                                            <span class="js-cart-item-subtotal text-primary" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                                        </div>
                                    </li>

                                    {# Cart item unit price #}
                                    <li class="col-price cart-item-subtotal span2 m-top p-top-quarter hidden-phone">
                                        <span class="pull-right-xs m-top-quarter-xs">{{ item.unit_price | money }}</span>
                                    </li>

                                    {# Cart item subtotal #}
                                    <li class="cart-item-subtotal span2 hidden-phone m-top p-top-quarter">
                                        <span class="js-cart-item-subtotal text-primary" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
                                    </li>

                                    {# Cart item delete #}
                                    <li class="col-delete last span1 m-top m-top-none-xs cart-delete-container">
                                        <button type="button" class="item-delete cart-btn-delete p-top-none pull-right-xs opacity-50" onclick="LS.removeItem({{ item.id }})">
                                            <div class="cart-delete-svg-icon svg-text-fill">
                                                {% include "snipplets/svg/trash.tpl" %}
                                            </div>
                                        </button>
                                    </li>
                                </ul>
                            {% endfor %}
                            <div id="store-curr" class="hidden">{{ store.currency }}</div>

                            {# Cart alerts #}
                            <div id="error-ajax-stock" class="alert alert-warning" style="display:none;">
                                {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
                                <a href="{{ store.products_url }}" class="btn-link">{{ "ver otros acá" | translate }}</a>
                            </div>
                            <div class="totals-container cart-totals-container row-fluid m-top">

                                {# Cart shipping #}
                                <div class="span4 js-shipping-calculator-container">
                                    {% if show_cart_fulfillment %}

                                        <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

                                            {# Saved shipping not available #}

                                            <div class="js-shipping-method-unavailable alert alert-warning" style="display: none;">
                                                <div>
                                                    <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible para este carrito. ' | translate }}</strong>
                                                </div>
                                                <div>
                                                    {{ '¡No te preocupes! Podés elegir otro.' | translate}}
                                                </div>
                                            </div>

                                            {# Shipping calculator and branch link #}

                                            <div id="cart-shipping-container" class="shipping-calcuator-container row-fluid m-bottom-half" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

                                                {# Used to save shipping #}

                                                <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hide">{{ cart.shipping_data.name }}</span>

                                                {# Shipping Calculator #}

                                                {% if store.has_shipping %}
                                                    {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'product_detail': false} %}
                                                {% endif %}

                                                {# Store branches #}
                                                
                                                {% if store.branches %}
                                                    {# Link for branches modal #}
                                                    {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                                                {% endif %}
                                            </div>
                                        </div>
                                    {% endif %}
                                </div>

                                <div class="span5 pull-right text-center">
                                    <div class="border-bottom d-inline-block full-width">

                                        {# Cart subtotal #}
                                        <div class='h5 cart-subtotal subtotal-information pull-right row-fluid' data-store="cart-subtotal">
                                            <span>
                                                {{ "Subtotal" | translate }} 
                                                <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
                                                :
                                            </span>
                                            <span class="js-cart-subtotal weight-normal m-left-quarter" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
                                        </div>

                                        {# Cart promos #}
                                        <div class="js-total-promotions total-promotions clear-both pull-left row-fluid">
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
                                                    {% if promotion.discount_script_type != "custom" %}
                                                        {% if promotion.discount_script_type == "NAtX%off" %}
                                                            {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                                                        {% else %}
                                                            {{ promotion.discount_script_type }}
                                                        {% endif %}

                                                        {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}

                                                        {% if promotion.discount_script_type == "NAtX%off" %}
                                                            <span class="text-lowercase">{{ "Comprando {1} o más." | translate(promotion.selected_threshold.quantity) }}</span>
                                                        {% endif %}
                                                    {% else %}
                                                        {{ promotion.scope_value_name }}
                                                    {% endif %}
                                                    :  
                                                    <span class="cart-promotion-number weight-strong text-primary m-left-quarter">-{{ promotion.total_discount_amount_short }}</span>
                                                </span>
                                            {% endfor %}
                                        </div>

                                        {# Cart total #}
                                        <div class='cart-total h2 m-top-half-xs m-bottom-xs row-fluid p-bottom' data-store="cart-total">
                                            <span>{{ "Total" | translate }}:</span>
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
                                            <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body p-top-quarter">    
                                                {{ 'O hasta' | translate }}
                                                {% if interest == true %}
                                                    {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                                                {% else %}
                                                    {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
                                                {% endif %}
                                            </div>

                                        </div>
                                    </div>

                                    {# Cart CTA #}
                                    <div class="go-to-checkout clear-both hidden-phone">
                                        {% set cart_total = (settings.cart_minimum_value * 100) %}
                                        {% if cart.checkout_enabled %}
                                            <input class="js-go-checkout-btn btn btn-primary btn-inverse full-width m-top m-bottom-half" type="submit" autocomplete="off" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
                                        {% else %}
                                            <div class="alert alert-warning m-top-half">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</div>
                                        {% endif %}                    
                                    </div>
                                    {% if cart.items and settings.continue_buying %}
                                    {% set last_item_added = (cart.items | first) %}
                                    <div class="text-center hidden-phone">
                                        <a href="{{ last_item_added.product.category.url }}" class="btn btn-link m-bottom">{{ 'Ver más productos' | translate }}</a>
                                    </div>
                                    {% endif %}
                                </div>
                            </div>
                            {# Cart CTA mobile #}
                            <div class="js-ios-fixed-bottom sticky-cta visible-phone {% if settings.continue_buying %}big{% endif %}">
                                <div class="go-to-checkout clear-both">
                                    {% set cart_total = (settings.cart_minimum_value * 100) %}
                                    {% if cart.checkout_enabled %}
                                        <input class="js-go-checkout-btn btn btn-primary btn-inverse full-width" type="submit" form="cart-form" autocomplete="off" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
                                    {% else %}
                                        <div class="alert alert-warning text-center m-none">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</div>
                                    {% endif %}                    
                                </div>
                                {% if cart.items and settings.continue_buying %}
                                {% set last_item_added = (cart.items | first) %}
                                <div class="text-center m-top-half">
                                    <a href="{{ last_item_added.product.category.url }}" class="btn btn-link p-bottom-none p-top-half">{{ 'Ver más productos' | translate }}</a>
                                </div>
                                {% endif %}
                            </div>
                        </div>
                    </form>
                </div>
            {% else %}

                {#  Empty cart  #}

                {% if not error %}
                    {{ component('alert', {'type': 'warning', 'message': ('El carrito de compras está vacío.' | translate) }) }}
                {% endif %}
            {% endif %}
        </div>

    </div>
</div>
