<form action="{{ store.cart_url }}" method="post" id="ajax-cart-details" class="js-ajax-cart-panel js-fullscreen-modal js-custom-modal js-close-on-swipe ajax-cart-container modal-right modal-xs modal-xs-right modal-xs-right-out" style="display: none;" data-store="cart-form">
  <div class="modal-xs-dialog">
    <div id="store-curr" class="hidden">{{ cart.currency }}</div>
    {# IMPORTANT Do not remove this hidden subtotal, it is used by JS to calculate cart total #}
    <div class="subtotal-price hidden" data-priceraw="{{ cart.total }}"></div>

    {# Define contitions to show shipping calculator and store branches on cart #}

    {% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
    {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

    {# Cart panel header #}
    <div class="modal-right-header hidden-phone row-fluid">
      <div class="span8">
        <h4>{{ "Carrito de compras" | translate }}</h4>
      </div>
      <div class="span4">
        <a href="#" class="js-toggle-cart js-fullscreen-modal-close btn-floating pull-right m-top-quarter m-right-half">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}</a>
      </div>
    </div>
    <a class="js-toggle-cart js-fullscreen-modal-close visible-phone modal-xs-header" href="#">
      <span class="modal-xs-header-icon modal-xs-right-header-icon">
        {% include "snipplets/svg/arrow-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
      </span>
      <span class="modal-xs-header-text modal-xs-right-header-text h5">
        {{ "Carrito de compras" | translate }}
      </span>
    </a>

    <div class="modal-content">

      {# Cart panel body #}
      <div class="ajax-cart-body modal-right-body modal-xs-body">
        <div class="ajax-cart-table-header font-small hidden-phone m-top">
          <div class="pull-left">
            <p>{{ "Producto" | translate }}</p>
          </div>
          <div class="text-right pull-right cart-subtotal-header">
            <p>{{ "Subtotal" | translate }}</p>
          </div>
        </div>

        {# Cart panel items #}
        <div class="js-ajax-cart-list ajax-cart-table pull-left">
          {% if cart.items %}
            {% for item in cart.items %}
              {% include "snipplets/cart-item-ajax.tpl" %}
            {% endfor %}
          {% endif %}
        </div>

        {# Cart panel empty #}
        <div class="emptyCart js-empty-ajax-cart text-center alert clear-both" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
          {{ "El carrito de compras está vacío." | translate }}
        </div>

        {# Cart panel subtotal #}
        <div class="h5 ajax-cart-subtotal cart-subtotal js-visible-on-cart-filled m-top row-fluid pull-left" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-subtotal">
          <span class="pull-left text-left">
            {{ "Subtotal" | translate }}
            <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
            :
          </span>
          <span class="js-ajax-cart-total js-cart-subtotal pull-right text-right" data-priceraw="{{ cart.subtotal }}">{{ cart.subtotal | money }}</span>
        </div>

        {# Cart panel promos #}
        <div class="js-total-promotions overflow-none js-mobile-search-input text-right total-promotions clear-both ajax-cart-promotions">
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
            <span class="js-total-promotions-detail-row total-promotions-row pull-left text-left row-fluid m-bottom-half" id="{{ id }}">
            <span class="pull-left cart-promotion-detail">
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
            </span>
            <span class="cart-promotion-number text-primary pull-right text-right">-{{ promotion.total_discount_amount_short }}</span></span>
         {% endfor %}
        </div>

        {% if show_cart_fulfillment %}
          <div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>
          
            <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container">

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
                  {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'product_detail': false, 'ajax_cart': true} %}
                {% endif %}

                {# Store branches #}

                {% if store.branches %}
                  {# Link for branches modal #}
                  {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': false} %}
                {% endif %}
              </div>
            </div>
          </div>
        {% endif %}

        {# Cart panel total #}
        <div class="js-visible-on-cart-filled ajax-cart-total-container cart-total h2 pull-left row-fluid m-top-half m-bottom p-bottom" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-total">
          <span class="pull-left text-left">{{ "Total" | translate }}:</span>
          <span class="js-cart-total {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %} pull-right text-right">{{ cart.total | money }}</span>
          {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
          <div class='total-price hidden'>
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
          <div {% if installment < 2 or ( store.country == 'AR' and interest == true ) %} style="display: none;" {% endif %} data-interest="{{ interest_value }}" data-cart-installment="{{ installment }}" class="js-installments-cart-total font-body clear-both text-right p-top-quarter">    
              {{ 'O hasta' | translate }}
              {% if interest == true %}
                  {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
              {% else %}
                  {{ "<span class='js-cart-installments-amount'>{1}</span> cuotas sin interés de <span class='js-cart-installments installment-price'>{2}</span>" | t(installment, (total_installment / installment) | money) }}
              {% endif %}
          </div>

        </div>
        <div class="js-visible-on-cart-filled full-width pull-left ajax-cart-bottom" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

          {# Cart panel alerts #}
          <div id="error-ajax-stock" class='alert alert-warning' style="display: none;">
              {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
              <a href="{{ store.products_url }}" class="btn-link">{{ "ver otros acá" | translate }}</a>
          </div>
        </div>
      </div>
    </div>
    
    {# Cart panel footer #}

    {# Cart panel CTA #}

    <div class="js-ajax-cart-fixed-bottom js-ios-fixed-bottom js-visible-on-cart-filled fixed-move-up pull-left row-fluid modal-xs-footer-fixed fixed-btn-container {% if settings.continue_buying %}big{% endif %}" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

      {% set cart_total = (settings.cart_minimum_value * 100) %}

      {# Cart CTA #}

      <div class="js-ajax-cart-submit m-bottom" {{ not cart.checkout_enabled ? 'style="display:none"' }} id="ajax-cart-submit-div">
        <input class="btn btn-primary btn-inverse full-width" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}"/>
      </div>

      {# Cart minimum alert #}

      <div class="js-ajax-cart-minimum clear-both" {{ cart.checkout_enabled ? 'style="display:none"' }} id="ajax-cart-minumum-div">
        <div class="alert alert-warning m-none" role="alert">
          <p class="text-center">{{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}</p>
        </div>
      </div>
      <input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>

      {# Cart panel continue buying link desktop #}

      {% if settings.continue_buying %}
        <div class="row-fluid text-center m-bottom">
          <a href="#" class="js-toggle-cart js-fullscreen-modal-close span12 btn-link">{{ 'Ver más productos' | translate }}</a>
        </div>
      {% endif %}
    </div>
  </div>
</form>

<div id="ajax-cart-backdrop" class="js-toggle-cart js-ajax-backdrop backdrop" style="display: none;"></div>
