{% if product_detail %}
    {% set cart_zipcode = false %}
{% else %}
    {% set cart_zipcode = cart.shipping_zipcode %}
{% endif %}

<div class="shipping-calculator row-fluid {% if product_detail %} product-shipping-calculator m-top-half{% else %} cart-shipping-calculator m-top{% endif %}" data-store="shipping-calculator">
 
    {# Check if store has free shipping without regions or categories #}

    {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

    <div class="js-shipping-calculator-head shipping-calculator-head p-relative transition-soft {% if cart_zipcode %}with-zip{% else %}with-form{% endif %} {% if has_free_shipping %}with-free-shipping{% endif %} {% if has_free_shipping and ajax_cart %}m-top-half{% endif %}">
        <div class="js-shipping-calculator-with-zipcode {% if cart_zipcode %}js-cart-saved-zipcode transition-up-active{% endif %} transition-up row-fluid p-absolute">
            {% if has_free_shipping %}

                {# Free shipping labels when calcualtor is hidden #}

                <div class="free-shipping-title {% if product_detail or not ajax_cart %}text-left{% else %}text-center{% endif %} transition-soft">

                    {# Free shipping achieved label #}

                    <div class="js-free-shipping-title p-absolute transition-up full-width h5 {% if cart.free_shipping.cart_has_free_shipping %}transition-up-active{% endif %}">
                        <span class="weight-strong">{{ "¡Genial! <strong class='text-primary'>Tenés envío gratis</strong>" | translate }}</span>
                    </div>

                    {# Free shipping with min price label #}

                    <div class="js-free-shipping-title-min-cost p-absolute transition-up full-width h5 {% if not cart.free_shipping.cart_has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price %}transition-up-active{% endif %}">
                        <span class="weight-strong">{{ "<strong class='text-primary'>Envío gratis</strong> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span></span>
                    </div>
                </div>

            {% endif %}

            <div class="container-fluid  p-left-half m-left-quarter p-right-half m-right-quarter">
                <div class="row-flex align-items-center">
                    <span class="col p-right-none">
                        <span class="d-table align-icon-with-text">
                            <span>{{ "Entregas para el CP:" | translate }}</span>
                            <strong class="js-shipping-calculator-current-zip m-left-quarter">{{ cart_zipcode }}</strong>
                        </span>
                    </span>
                    <div class="col-auto p-left-none">
                        <a class="js-shipping-calculator-change-zipcode btn btn-default btn-smallest pull-right" href="#">{{ "Cambiar CP" | translate }}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="js-shipping-calculator-form shipping-calculator-form row-fluid transition-up p-absolute" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
            <p class="p-bottom-quarter">
                {% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter  svg-text-fill"} %}
                <span class="font-medium">
                    
                    {# Free shipping achieved label #}

                    <span class="js-free-shipping-message" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                        {{ "¡Genial! <strong class='text-primary'>Tenés envío gratis</strong>" | translate }}
                    </span>

                    {# Free shipping with min price label #}

                    <span class="js-shipping-calculator-label" {% if cart.free_shipping.cart_has_free_shipping or not cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %}>
                        {{ "<strong class='text-primary'>Envío gratis</strong> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
                    </span>

                    {# Shipping default label #}

                    <span class="js-shipping-calculator-label-default" {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %}>

                        {# Regular shipping calculator label #}
                        
                        {{ 'Medios de envío' | translate }}
                    </span>
                </span>
            </p>
            <div class="span12 m-none">
                <input type="tel" name="zipcode" class="js-shipping-input shipping-zipcode form-control form-control-secondary form-control-small border-thin input-shipping" placeholder="{{ 'Tu código postal' | translate }}" aria-label="{{ 'Tu código postal' | translate }}" value="{{ cart_zipcode }}">
                {% if shipping_calculator_variant %}
                <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
                {% endif %}
                <button class="js-calculate-shipping btn btn-default btn-shipping btn-small m-left-quarter border-thin" aria-label="{{ 'Calcular envío' | translate }}">  
                    <span class="js-calculate-shipping-wording">{{ "Calcular" | translate }}</span>
                    <span class="js-calculating-shipping-wording" style="display: none;">{{ "Calculando" | translate }}</span>
                </button>
                {% if store.country == 'BR' or 'AR' or 'MX' %}
                    {% set zipcode_help_ar = 'https://www.correoargentino.com.ar/formularios/cpa' %}
                    {% set zipcode_help_br = 'http://www.buscacep.correios.com.br/sistemas/buscacep/' %}
                    {% set zipcode_help_mx = 'https://www.correosdemexico.gob.mx/datosabiertos/gobmx/gobmx_Descarga.html' %}
                        <div class="m-top-quarter">
                            <a class="btn-link btn-link-smallest text-foreground" href="{% if store.country == 'AR' %}{{ zipcode_help_ar }}{% elseif  store.country == 'BR' %}{{ zipcode_help_br }}{% elseif store.country == 'MX' %}{{ zipcode_help_mx }}{% endif %}" target="_blank">{{ "No sé mi código postal" | translate }}</a>
                        </div>
                {% endif %}
                <div class="js-ship-calculator-error invalid-zipcode alert alert-danger m-top" style="display: none;">
                    {# Specific error message considering if store has multiple languages #}

                    {% for language in languages %}
                        {% if language.active %}
                            {% if languages | length > 1 %}
                                {% set wrong_zipcode_wording = ' para ' | translate ~ language.country_name ~ '. Podés intentar con otro o' | translate %}
                            {% else %}
                                {% set wrong_zipcode_wording = '. ¿Está bien escrito?' | translate %}
                            {% endif %}
                            {{ "No encontramos este código postal{1}" | translate(wrong_zipcode_wording) }}

                            {% if languages | length > 1 %}
                                <a href="#shipping-country" data-toggle="modal" class="js-trigger-modal-zindex-top btn-link">
                                    {{ 'cambiar tu país de entrega' | translate }}
                                </a>
                            {% endif %}
                        {% endif %}
                    {% endfor %}
                </div>
                <div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger m-top" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
                <div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger m-top" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
            </div>
        </div>
    </div>
    <div class="js-shipping-calculator-spinner pull-left full-width transition-soft text-center" style="display: none;">
        <div class="spinner-ellipsis">
            <div class="point"></div>
            <div class="point"></div>
            <div class="point"></div>
            <div class="point"></div>
        </div>
    </div>
    <div class="js-shipping-calculator-response shipping-calculator-response clear-both {% if product_detail %}list-readonly{% endif %} p-top-half" style="display: none;"></div>
</div>

{# Shipping country modal #}

{% if languages | length > 1 %}

    <div id="shipping-country" class="js-modal-shipping-country js-modal-xs-centered modal modal-centered-small modal-xs modal-xs-centered hide fade modal-zindex-top modal-small" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="js-close-modal-zindex-top modal-header" data-dismiss="modal" aria-hidden="true">
            <button type="button" class="btn-floating m-right-half m-top-quarter" >
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}
            </button>
            <h3>{{ 'País de entrega' | translate }}</h3>
        </div>
        <div class="modal-content">
            <div class="modal-body">
                <div class="form-group">
                    <label for="store-country">{{ 'País donde entregaremos tu compra' | t }}</label>
                    <div class="select-container">
                        <select id="store-country" class="js-shipping-country-select form-control full-width-xs">
                            {% for language in languages %}
                                <option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
                            {% endfor %}
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#" class="js-save-shipping-country btn btn-primary pull-right">{{ 'Aplicar' | translate }}</a>
            </div>
        </div>
    </div>
{% endif %}
