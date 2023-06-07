<div class="{% if store.branches|length > 1 %}js-toggle-branches{% endif %} link-module no-border" data-store="branches">
    <span class="link-module-icon d-inline-block">
        {% include "snipplets/svg/store.tpl" %}
    </span>
    <span class="link-module-content align-bottom">
        <div class="font-body">
            {% if store.branches|length > 1 %}
                {{ 'Nuestros locales' | translate }}
            {% else %}
                {{ 'Nuestro local' | translate }}
            {% endif %}
        </div>
        {% if store.branches|length > 1 %}
            <div class="btn-link">
                <span class="js-see-branches">
                    {{ 'Ver opciones' | translate }}
                    {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa m-left-quarter"} %}
                </span>
                <span class="js-hide-branches" style="display: none;">
                    {{ 'Ocultar opciones' | translate }}
                    {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "svg-inline--fa m-left-quarter"} %}
                </span>
            </div>
        {% endif %}
    </span>
</div>

{# Store branches #}

{% if not product_detail %}
    
    <ul class="js-store-branches-container list-unstyled {% if product_detail %}list-readonly{% else %}radio-button-container{% endif %} box-shadow p-none m-bottom" {% if store.branches|length > 1 %}style="display: none;"{% endif %}>

        {% for branch in store.branches %}
            <li class="{% if product_detail %}list-item{% else %}radio-button-item{% endif %}" data-store="branch-item-{{ branch.code }}">

                {# If cart use radiobutton #}
            
                {% if not product_detail %}
                    <label class="js-shipping-radio js-branch-radio radio-button {% if store.branches|length == 1 or loop.last %}m-bottom-none{% endif %}" data-loop="branch-radio-{{loop.index}}">
                        <input 
                        class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                        data-price="0" 
                        {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                        value="{{branch.code}}" 
                        data-name="{{ branch.name }} - {{ branch.extra }}"
                        data-code="{{branch.code}}" 
                        data-cost="{{ 'Gratis' | translate }}"
                        name="option" 
                        style="display:none">
                        <span class="row-fluid radio-button-content">
                            <div class="radio-bg-selected"></div>
                            <div class="radio-button-icons-container">
                                <span class="radio-button-icons">
                                    <span class="radio-button-icon unchecked"></span>
                                    <span class="radio-button-icon checked"></span>
                                </span>
                            </div>
                            <span class="radio-button-label">
                {% endif %}
                                <div class="row-fluid {% if product_detail %}list-item-content{% else %}radio-button-text{% endif %}">
                                    <div class="span9 col-xs-9-custom pull-left-xs p-right-half">
                                        <div class="shipping-method-name">
                                             {{ branch.name }} <span class="m-left-quarter">{{ branch.extra }}</span>
                                        </div>
                                    </div>
                                    <div class="span3 col-xs-3-custom pull-right-xs h6 text-right">
                                        <strong class="shipping-method-price text-primary">
                                            {{ 'Gratis' | translate }}
                                        </strong>
                                    </div>
                                </div>
                {% if not product_detail %}
                            </span>
                        </span>
                    </label>
                {% endif %}
            </li>
        {% endfor %}
    </ul>
{% else %}
    <ul class="js-store-branches-container list-readonly list-unstyled box-shadow p-none m-bottom" {% if store.branches|length > 1 %}style="display: none;"{% endif %}>
        {% for branch in store.branches %}
            <li class="list-item" data-store="branch-item-{{ branch.code }}">
                <div class="list-item-content row-fluid">
                    <div class="span9 col-xs-9-custom pull-left-xs p-right-half">
                        <div class="shipping-method-name">
                            {{ branch.name }} <span class="m-left-quarter">{{ branch.extra }}</span>
                        </div>
                    </div>
                    <div class="span3 col-xs-3-custom pull-right-xs h6 text-right">
                        <strong class="shipping-method-price text-primary">
                            {{ 'Gratis' | translate }}
                        </strong>
                    </div>
                </div>
            </li>
        {% endfor %}
    </ul>
{% endif %}