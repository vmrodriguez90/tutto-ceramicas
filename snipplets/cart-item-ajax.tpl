<div class="js-cart-item {% if item.product.is_non_shippable %}js-cart-item-non-shippable{% else %}js-cart-item-shippable{% endif %} ajax-cart-item" data-item-id="{{ item.id }}" data-store="cart-item-{{ item.product.id }}">

  {% set show_free_shipping_label = item.product.free_shipping and not (cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price) %}

  {# Cart item image #}
  <div class="ajax-cart-item-image-col ajax-cart-item-col">
    <img src="{{ item.featured_image | product_image_url('medium') }}" />
  </div>
  <div class="ajax-cart-item-desc-col border-box ajax-cart-item-col">

    {# Cart item name #}
    <a class="ajax-cart-item-link cart-item-name text-primary {% if show_free_shipping_label %}p-bottom-none m-none{% endif %}" href="{{ item.url }}">
      {{ item.short_name }}
      <small>{{ item.short_variant_name }}</small>
    </a>
    {% if show_free_shipping_label %}
      <div class="m-bottom">
        <i class="label label-primary text-uppercase weight-normal font-small-extra">{{ "Envío gratis" | translate }}</i>
      </div>
    {% endif %}

    {# Cart item unit price #}
    <div class="ajax-cart-item-unit-price hidden-phone">
      {{ item.unit_price | money }}
    </div>

    {# Cart item quantity controls #}
    <div class="js-ajax-cart-qty-container pull-left m-top-half m-none-xs">
      <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-small visible-phone" onclick="LS.minusQuantity({{ item.id }})">
        <div class="cart-quantity-svg-icon svg-text-fill">
          {% include "snipplets/svg/minus.tpl" %}
        </div>
      </button>
      <div class="cart-quantity-input-container d-inline-block pull-left">
        <span class="js-cart-input-spinner cart-item-spinner" style="display: none;">
          {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-text-fill"} %}
        </span>
        <input type="number" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" pattern="\d*" data-item-id="{{ item.id }}" onKeyUp="LS.resetItems();" class="js-cart-quantity-input cart-quantity-input cart-quantity-input-small form-control form-control-secondary" />
      </div>
      <div class="d-inline-block m-left-quarter m-none-xs">
        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-small" onclick="LS.plusQuantity({{ item.id }})">
          <div class="cart-quantity-svg-icon svg-text-fill">
            {% include "snipplets/svg/plus.tpl" %}
          </div>
        </button>
        <button type="button" class="js-cart-quantity-btn cart-quantity-btn cart-quantity-btn-small hidden-phone" onclick="LS.minusQuantity({{ item.id }})">
          <div class="cart-quantity-svg-icon svg-text-fill">
            {% include "snipplets/svg/minus.tpl" %}
          </div>
        </button>
      </div>
    </div>

    {# Cart item mobile subtotal #}
    <div class="visible-phone cart-item-subtotal h6-xs pull-right">
      <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
    </div>
  </div>
  <div class="ajax-cart-item-subtotal ajax-cart-item-col cart-item-subtotal h6-xs weight-strong text-right hidden-phone">
    {# Cart item subtotal #}
    <span class="js-cart-item-subtotal" data-line-item-id="{{ item.id }}">{{ item.subtotal | money }}</span>
  </div>

  {# Cart item delete #}
  <div class="ajax-cart-item-delete-col cart-delete-container ajax-cart-item-col text-right">
    <button type="button" class="cart-btn-delete ajax-cart-btn-delete pull-right p-top-none opacity-50" onclick="LS.removeItem({{ item.id }}, true)">
      <div class="cart-delete-svg-icon svg-text-fill">
        {% include "snipplets/svg/trash.tpl" %}
      </div>
    </button>
  </div>
</div>