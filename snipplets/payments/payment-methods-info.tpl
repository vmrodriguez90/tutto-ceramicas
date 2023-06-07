{% macro paymentMethodsInfo(paymentProvider, product) %}
    {% for paymentMethod in paymentProvider.supported_payment_methods %}
        {% set hasDiscount = paymentMethod.discount > 0 %}
        {% set hasInstallments = paymentMethod.installmentGroups is not empty %}

        {# Payment Method Title #}
        <div class="box-title">{{ paymentMethod.name }}</div>

        <div id="info-payment-method-{{ paymentMethod.id }}" class="box-container">
            {# Payment Method Discount #}
            {% if hasDiscount %}
                <div class="m-top-half m-bottom">
                    <span><strong>{{ paymentMethod.discount }}% {{'de descuento' | translate }}</strong> {{'pagando con' | translate }} {{ paymentMethod.name }}</span>
                </div>
            {% endif %}

            {# Payment Method Logos #}
            {% if paymentMethod.logos is not empty %}
                <div>
                    {% for logo in paymentMethod.logos %}
                        <span>
                            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-medium" alt="">
                        </span>
                    {% endfor %}
            </div>
            {% endif %}

            {# Payment Method Total #}
            <div>
                <h6 class="m-top-quarter d-inline">
                    {% if hasInstallments %}
                        <span class="m-right-quarter">{{ 'Total en 1 pago:' | translate }}</span>
                    {% else %}
                        <span class="m-right-quarter">{{ 'Total:' | translate }}</span>
                    {% endif %}
                    {% if hasDiscount %}
                        <span class="price-compare m-right-half">{{ product.price | money }}</span>
                        <strong class="js-installments-one-payment h3 weight-strong text-primary">{{ paymentMethod.priceWithDiscount | money }}</strong>
                    {% else %}
                        <strong class="js-installments-one-payment">{{ product.price | money }}</strong>
                    {% endif %}
                </h6>
                {% if hasInstallments and paymentMethod.isCardType %}
                    <div class="mt-1 d-inline">{{'con todas las tarjetas.' | translate }}</div>
                {% endif %}
            </div>
            {% if hasDiscount %}
                <div class="font-small m-top-quarter">{{'El descuento será aplicado sobre el costo total de la compra (sin envío) al finalizar la misma.' | translate }}</div>
            {% endif %}

            {# Installments List #}
            {% if hasInstallments %}
                <div class="m-top-half">
                    <strong class="text-primary">{{ 'O pagá en' | translate }}</strong>
                </div>

                {% for installmentGroup in paymentMethod.installmentGroups %}
                    {# Installment Specification #}
                    <table class="table m-top-half m-bottom-quarter">
                        <tbody>
                            {% for installment in installmentGroup.installments %}
                                <tr>
                                    {# Installment Info #}
                                    <td>
                                        <strong class="text-primary"><span class="js-installment-amount">{{ installment.quantity }}</span></strong>
                                        <span class="text-primary">{% if installment.quantity > 1 %}{{ 'cuotas' | translate }}{% else %}{{ 'cuota' | translate }}{% endif %}</span>
                                        <span>{{ 'de ' | translate }}</span>
                                        <strong class="text-primary"><span class="js-installment-price">{{ installment.amountInCents | money }}</span></strong>
                                        {% if installment.withoutInterest %}
                                            {{ 'sin interés' | t }}
                                        {% endif %}
                                    </td>

                                    {# Total Price #}
                                    <td>
                                        <strong class="text-primary"><span class="m-right-quarter">{{ 'Total:' | translate }}</span></strong>
                                        <span>{{ installment.totalAmountInCents | money }}</span>
                                    </td>

                                    {# Description #}
                                    <td>
                                        <small>{{ installment.description }}</small>
                                    </td>
                                </tr>
                            {% endfor %}
                        </tbody>
                    </table>

                    {# Payment Method Logos #}
                    {% if installmentGroup.logos is not empty %}
                        <div class="mt-2 {% if loop.last %}{{ 'mb-0' }}{% else %}{{ 'mb-3' }}{% endif %}">
                            {% for logo in installmentGroup.logos %}
                                <span>
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-medium" alt="">
                                </span>
                            {% endfor %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endif %}
        </div>
    {% endfor %}
{% endmacro %}
