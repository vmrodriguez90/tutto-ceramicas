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

    <div class="js-product-quantity-container {% if quickshop and inside_variants %}span6 col-xs-custom col-xs-6-custom p-left-quarter-xs{% endif %}{% if not quickshop %}span3{% endif %} {% if not inside_variants %}m-bottom{% endif %}">
        <div class="js-quantity form-group form-group-{% if quickshop %}small{% else %}big m-bottom-xs{% endif %} quantity {% if product.show_installments and not product.variations and not quickshop %} border-top-none-xs {% endif %} {% if quickshop and inside_variants %}m-none p-none-xs{% endif %}">
            <label class="quantity-label {% if quickshop %}font-small-extra font-small-xs m-top-none-xs{% endif %}">
                {{ "Cantidad" | translate }}
            </label>
            <div class="quantity-input-container {% if quickshop %}full-width-xs{% endif %}">
               <div class="quantity-nav quantity-nav-left {% if not quickshop %}visible-phone{% endif %}">
                    <div class="js-quantity-down quantity-btn">
                        {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                    </div>
                </div>
                <input id="quantity" class="js-product-quantity js-quantity-input form-control form-control-secondary form-control-{% if quickshop %}smallest{% else %}big{% endif %} quantity-input" value="1" min="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" pattern="\d*" />
                <div class="quantity-nav quantity-nav-right">
                    <div class="js-quantity-up quantity-btn">
                        {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                    </div>
                    {% if not quickshop %}
                        <div class="js-quantity-down quantity-btn hidden-phone">
                            {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endif %}