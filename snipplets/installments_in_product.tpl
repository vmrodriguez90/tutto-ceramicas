{% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
{% if product_can_show_installments %}
<div class="js-max-installments-container row-fluid">
    {% set has_payment_logos = settings.payments %}
    <div class="installments text-uppercase text-left-xs">

        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
            <div class="js-max-installments label-line label-featured d-inline-block">
                {% if not has_payment_logos %}
                    {% include "snipplets/svg/credit-card-regular.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa payment-credit-icon pull-left opacity-80 m-right-quarter svg-icon-primary"} %}
                {% endif %}
                {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}
            </div>
        {% else %}
            {% set max_installments_with_interests = product.get_max_installments %}
            {% if max_installments_with_interests %}
                <div class="js-max-installments d-inline">
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card-regular.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa payment-credit-icon pull-left opacity-80 m-right-quarter svg-icon-primary"} %}
                    {% endif %}
                    {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}
                </div>
            {% else %}
                <div class="js-max-installments d-inline" style="display: none;">
                {% if product.max_installments_without_interests %}
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card-regular.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa payment-credit-icon pull-left opacity-80 m-right-quarter svg-icon-primary"} %}
                    {% endif %}
                    {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(null, null) }}
                {% else %}
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card-regular.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa payment-credit-icon pull-left opacity-80 m-right-quarter svg-icon-primary"} %}
                    {% endif %}
                    {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(null, null) }}
                {% endif %}
                </div>
            {% endif %}
        {% endif %}
    </div>
</div>
{% endif %}