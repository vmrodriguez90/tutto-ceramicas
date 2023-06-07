{% if options %}

    {% if store.show_shipping_emergency_message %}
        <div class="alert alert-warning">{{ store.shipping_emergency_message }}</div> 
    {% endif %}

    <div class="{% if cart.items_count > 0 %}js-product-shipping-label{% endif %} font-small m-bottom p-bottom-quarter" style="display: none;">
        {{ 'Opciones para tu compra <strong>si sumás este producto</strong>.' | translate }}
    </div>

    {# Check for only delivery featured options #}

    {% set has_featured_shipping = false %}

    {% for option in options_to_show if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
        {% if option |length >= 1 %}
            {% set has_featured_shipping = true %}
        {% endif %}
    {% endfor %}

    {# Check for only non featured delivery options #}

    {% set has_non_featured_shipping = false %}

    {% for option in options_to_hide if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
        {% if option |length >= 1 %}
            {% set has_non_featured_shipping = true %}
        {% endif %}
    {% endfor %}

    {# Pickup featured options #}

    {% set has_non_featured_pickup = false %}
    {% set has_featured_pickup = false %}

    {# Check for only pickup featured options #}

    {% for option in options_to_show if option.shipping_type == 'pickup' and option.method != 'branch' %}
        {% if option |length >= 1 %}
            {% set has_featured_pickup = true %}
        {% endif %}
    {% endfor %}

    {# Check for only non featured pickup options #}

    {% for option in options_to_hide if option.shipping_type == 'pickup' and option.method != 'branch' %}
        {% if option |length >= 1 %}
            {% set has_non_featured_pickup = true %}
        {% endif %}
    {% endfor %}

    {# Shipping options #}

    {% if has_featured_shipping %}

        <div class="full-width-container {% if has_featured_pickup %}m-bottom{% endif %}">
            <div class="m-bottom-half full-width-container">
                {% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}
                {{ "Envío a domicilio" | translate }}
            </div>

            <ul class="list-unstyled shipping-list list-unstyled radio-button-container box-shadow p-none m-bottom-half">

                {# List only delivery featured options #}

                {% for option in options_to_show if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
                    {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'featured_option': true} %}
                {% endfor %}

                {% if has_non_featured_shipping %}

                    <div class="js-other-shipping-options full-width-container shipping-extra-options" style="display: none;">

                        {# List only delivery non featured options #}

                        {% for option in options_to_hide if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
                            {% include "snipplets/shipping/shipping-calculator-item.tpl" %}
                        {% endfor %}
                    </div>

                    <a href="#" class="js-toggle-more-shipping-options js-show-more-shipping-options btn-link btn-link-centered border-box">
                        <span class="js-shipping-see-more">
                        {{ 'Ver más opciones de envío' | translate }}
                            </span>
                        <span class="js-shipping-see-less" style="display: none;">
                            {{ 'Ver menos opciones de envío' | translate }}
                        </span>
                    </a>
                {% endif %}
            </ul>
        </div>

    {% endif %}

    {# Pickup featured options #}

    {% if has_featured_pickup %}

        <div class="full-width-container">
            <div class="m-bottom-half full-width-container">
                {% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa fa-md m-right-quarter svg-text-fill align-text-top"} %}
                {{ "Retirar por" | translate }}
            </div>

            <ul class="list-unstyled shipping-list list-unstyled radio-button-container box-shadow p-none m-bottom-half">

                {# List only pickup featured options #}

                {% for option in options_to_show if option.shipping_type == 'pickup' and option.method != 'branch' %}
                    {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'featured_option': true, 'pickup' : true} %}
                {% endfor %}

                {% if has_non_featured_pickup %}

                    <div class="js-other-pickup-options full-width-container shipping-extra-options" style="display: none;">

                        {# List only pickup non featured options #}

                        {% for option in options_to_hide if option.shipping_type == 'pickup' and option.method != 'branch' %}
                            {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'pickup' : true}  %}
                        {% endfor %}
                    </div>

                    <a href="#" class="js-toggle-more-shipping-options js-show-other-pickup-options btn-link btn-link-centered border-box">
                        <span class="js-shipping-see-more">
                            {{ 'Ver más opciones de retiro' | translate }}
                        </span>
                        <span class="js-shipping-see-less" style="display: none;">
                            {{ 'Ver menos opciones de retiro' | translate }}
                        </span>
                    </a>
                {% endif %}
            </ul>
        </div>
    {% endif %}

	{% if store.has_smart_dates and show_time %}
        <div class="font-small m-bottom-half">{{"El tiempo de entrega <strong>no considera feriados</strong>." | translate}}</div>
    {% endif %}

<div style="clear: both;"></div>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>
