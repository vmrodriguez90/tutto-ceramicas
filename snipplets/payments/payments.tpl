{% if installments_info %}
{% set gateways = installments_info | length %}
{% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
{# Get the array that contains the display settings for each payment method #}
{% set payment_methods_config = product.payment_methods_config %}

    <div id="installments-modal" class="js-fullscreen-modal js-mobile-installments-panel modal modal-xs modal-xs-right hide fade {% if gateways <= '3' %} two-gates {% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-xs-dialog">
            <div class="modal-header with-tabs">
                <a class="js-mobile-toggle-installments js-fullscreen-modal-close modal-xs-header visible-phone" href="#" data-dismiss="modal">
                    {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x modal-xs-header-icon modal-xs-right-header-icon"} %}
                    <span class="modal-xs-header-text modal-xs-right-header-text">
                        {% if store_set_for_new_installments_view %}
                            {{ 'Medios de pago' | translate }}
                        {% else %}
                            {{ 'Detalles de las cuotas' | translate }}
                        {% endif %}
                    </span>
                </a>

                {# Modal header and gateways tab links #}

                <div class="nav-tabs-container horizontal-container">
                    <ul class="nav nav-tabs m-right-double">
                        {% for method, installments in installments_info %}
                            {% set method_clean = method | replace(" ", "_") | lower %}

                            <li id="method_{{ method_clean }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none {% if loop.first %} active {% endif %}" data-code="{{ method }}">
                                <a href="#installment_{{ method_clean }}_{{ installment }}" class="tab-link" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method == 'boleto_paghiper'? 'BOLETO PAGHIPER' : method | upper) }}</a>
                            </li>

                            {# Custom payment method #}

                            {% if loop.last and custom_payment is not null %}
                                <li id="method_{{ custom_payment.code }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none" data-code="{{ custom_payment.code }}">
                                    <a href="#installment_{{ custom_payment.code }}" class="tab-link" data-toggle="tab">
                                        {{ custom_payment.name | upper }}
                                        {% if custom_payment.discount > 0 %}
                                            <span class="label label-primary label-inline m-left-quarter"><strong>{{ custom_payment.discount }}% {{'OFF' | translate }}</strong></span>
                                        {% endif %}
                                    </a>
                                </li>
                            {% endif %}
                        {% endfor %}
                    </ul>
                    <button type="button" class="btn-floating m-right-half m-top-quarter hidden-phone" data-dismiss="modal" aria-hidden="true">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}</button>
                </div>
            </div>
            <div class="modal-content">
                <div class="modal-body modal-xs-body">

                    {# Gateways tab content #}

                    <div class="tab-content">
                        {% for method, installments in installments_info %}
                            {% set method_clean = method | replace(" ", "_") | lower %}
                            {% set discount = product.get_gateway_discount(method) %}
                            <div class="tab-pane{% if loop.first %} active {% endif %} js-gw-tab-pane" id="installment_{{ method_clean }}_">
                                <div class="full-width pull-left">

                                    {% if store_set_for_new_installments_view %}

                                        {# Payments info with readonly #}

                                        {# Evaluate whether the payment method should show complete installments data #}
                                    
                                        {% if payment_methods_config[method].show_full_installments %}

                                            {# Payments Gateways with banks: at the moment only MP AR #}

                                            {% include 'snipplets/payments/payments-info-banks.tpl' %}
                                        {% else %}

                                            {# Payments Gateways with cards only #}

                                            {% include 'snipplets/payments/payments-info.tpl' %}
                                        {% endif %}

                                    {% else %}

                                        {# Installments list for ROLA stores #}

                                        {% for installment, data_installment in installments %}
                                            <div class="m-bottom-quarter p-left-quarter" id="installment_{{ method }}_{{ installment }}">
                                                {% set rounded_installment_value = data_installment.installment_value | round(2) %}
                                                {% set total_value = (data_installment.without_interests ? data_installment.total_value : installment * data_installment.installment_value) %}
                                                {% set total_value_in_cents = total_value  | round(2) * 100 %}
                                                <strong class="js-installment-amount installment-amount">{{ installment }}</strong> {% if store.country != 'BR' %}cuota{% if installment > 1 %}s{% endif %} de{% else %}x{% endif %} <strong class="js-installment-price">{{ (rounded_installment_value * 100) | money }}</strong>
                                                {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                            </div>
                                        {% endfor %}
                                    {% endif %}
                                </div>
                            </div>

                            {# Custom payment method #}

                            {% if loop.last and custom_payment is not null %}
                                <div class="tab-pane js-gw-tab-pane" id="installment_{{ custom_payment.code }}">
                                    <div class="box-container">

                                        {# Custom method instructions #}

                                        <p class="weight-strong m-bottom">{{ 'Cuando termines la compra vas a ver la información de pago en relación a esta opción.' | translate }}</p>

                                        {% if custom_payment.discount > 0 %}
                                            <div class="m-top-half">
                                                <span><strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ custom_payment.name }}</span>
                                            </div>
                                        {% endif %}

                                        {# Price total #}

                                        <h4 class="m-top-quarter weight-normal">
                                            <span class="m-right-quarter">{{ 'Total:' | translate }}</span>
                                            {% if custom_payment.discount > 0 %}
                                                {% set price_with_discount = product.price - ((product.price * custom_payment.discount) / 100) %}
                                                <span class="js-installments-one-payment price-compare m-right-half m-bottom-quarter">{{ product.price | money }}</span><strong class="js-price-with-discount h3 text-primary" data-payment-discount="{{ custom_payment.discount }}">{{ price_with_discount | money }}</strong> 
                                            {% else %} 
                                                <span class="js-installments-one-payment weight-strong text-primary">{{ product.price | money }}</span>
                                            {% endif %}    
                                        </h4>

                                        {% if custom_payment.discount > 0 %}
                                            <div class="m-top"> {{'El descuento será aplicado sobre el costo total de la compra (sin envío) al finalizar la misma.' | translate }}</div>
                                        {% endif %}

                                    </div>
                                </div>
                            {% endif %}
                        {% endfor %}
                    </div>

                </div>

                {# Modal footer and close button #}

                <div class="modal-footer hidden-phone">
                    <a href="#" class="btn-link pull-right p-none" data-dismiss="modal">{{ 'Volver al producto' | translate }}</a>
                </div>
            </div>
        </div>
    </div>
{% endif %}
