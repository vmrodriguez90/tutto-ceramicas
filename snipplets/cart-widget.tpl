<div class="cart-summary {% if settings.tab_menu  %}hidden-phone{% endif %} {% if not settings.search_header %}cart-box{% else %}text-right{% endif %}">
    {% if cart.items_count > 0 %}
    <a href="{{ store.cart_url }}" class="cart-summary-link pull-left full-width">
    {% endif %}
      <span class="cart-summary-info {% if settings.search_header %}m-right m-none-right-xs{% endif %}">
        <span class="js-cart-widget-amount cart-summary-ammount m-right-quarter">
          {{ "{1}" | translate(cart.items_count ) }} {{ "Items" | translate }} 
          <span class="m-left-quarter">|</span> 
        </span>
        <span class="js-cart-widget-total cart-summary-total weight-strong">{{ cart.total | money }}</span>
      </span>
        <span class="cart-summary-icon">
        {% include 'snipplets/svg/shopping-cart.tpl' %}       
      </span>
    {% if cart.items_count > 0 %}
    </a>
    {% endif %}
</div>

