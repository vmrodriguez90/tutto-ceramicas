<div class="cart-summary {% if settings.tab_menu  %}hidden-phone{% endif %} {% if not settings.search_header %}cart-box{% else %}text-right{% endif %}">
    <a href="#" class="js-toggle-cart js-fullscreen-modal-open cart-summary-link pull-left full-width" data-modal-url="modal-fullscreen-cart">
      <span class="cart-summary-info {% if settings.search_header %}m-right m-none-right-xs{% endif %}">
        <span class="cart-summary-ammount m-right-quarter m-none-xs">
          <span class="js-cart-widget-amount">
            {{ "{1}" | translate(cart.items_count ) }}
          </span>
          <span class="hidden-phone">{{ "Items" | translate }}</span>
          <span class="m-left-quarter hidden-phone">|</span> 
        </span>
        <span class="js-cart-widget-total cart-summary-total weight-strong hidden-phone">{{ cart.total | money }}</span>
      </span>
    	<span class="cart-summary-icon">
        {% include 'snipplets/svg/shopping-cart.tpl' %}	      
  	  </span>
    </a>
</div>
