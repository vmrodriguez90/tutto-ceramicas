{% if settings.quick_view or settings.product_color_variants %}

    {% set quickshop_available = settings.quick_view and product.available and product.display_price %}

    {% if product.variations %}

        {# Form with variants used for item colors or quickshop #}

        {% if quickshop_available %}
            <a class="js-item-buy-open btn btn-primary btn-inverse btn-smallest item-buy-btn full-width" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" >{{ 'Comprar' | translate }}</a>
        {% endif %}

        <div class="js-item-variants item-buy-variants {% if loop.index is even %}item-buy-variants-even{% endif %}" style="display: none;">
            <div class="item-buy-arrow"></div>
            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                <a href="#" class="js-item-buy-close item-buy-close">
                    {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa h3 svg-text-fill opacity-50"} %}
                </a>

                <input type="hidden" name="add_to_cart" value="{{product.id}}" />

                <h6 class="item-name font-body h6-xs m-bottom-quarter m-top-half m-right" data-store="product-item-name-{{ product.id }}">{{ product.name }}</h6>
                <div class="item-price-container h6-xs m-bottom-half m-bottom-xs">
                    <div data-store="product-item-price-{{ product.id }}">
                        <span class="js-price-display item-price weight-strong text-primary" {% if not product.display_price %}class="hidden"{% endif %}>
                            {% if product.display_price %}
                                {{ product.price | money }}
                            {% endif %}
                        </span>
                        <span class="js-compare-price-display item-price-compare price-compare h6-xs">
                            <span {% if not product.compare_at_price %}class="hidden"{% endif %}>
                                {% if product.compare_at_price %}
                                    {{ product.compare_at_price | money }}
                                {% endif %}
                            </span>
                        </span>
                    </div>
                </div>

                {% if product.variations | length == 1 %}
                    {% set variants_col = '12' %}
                {% else %}
                    {% set variants_col = '6' %}
                {% endif %}

                <div class="js-product-variants js-product-quickshop-variants full-width-container {% if product.variations | length == 3 %}m-bottom{% else %}m-bottom-half{% endif %}">
                    {% for variation in product.variations %}
                        {% if product.variations | length == 3 and loop.first %}
                            <div class="row-fluid m-bottom">
                        {% endif %}
                                <div class="js-product-variants-group {% if variation.name in ['Color', 'Cor'] %}js-color-variants-container{% endif %} span{{ variants_col }} col-xs-custom col-xs-{{ variants_col }}-custom variant-container {% if product.variations | length > 1 and loop.first %}p-right-quarter-xs{% elseif loop.index == '2' %}p-left-quarter-xs{% elseif loop.index == '3' %}p-right-quarter-xs{% endif %}">
                                    <label class="variant-label variant-label-small" for="variation_{{loop.index}}">{{variation.name}}: </label>
                                    <select class="js-variation-option js-refresh-installment-data variant-select variant-select-small" data-variant-id="variation_{{loop.index}}" name="variation[{{ variation.id }}]">
                                    {% for option in variation.options %}
                                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                    {% endfor %}
                                    </select>
                                </div>
                        {% if product.variations | length == 3 and loop.index == '2' %}
                            </div>
                            <div class="row-fluid">
                        {% endif %}
                        {% if product.variations | length == 3 and loop.last %}
                                {% include "snipplets/product-quantity.tpl" with {quickshop: true, inside_variants: true} %}
                            </div>
                        {% endif %}
                    {% endfor %}
                </div>
                <div class="full-width-container">
                    {% if product.variations | length < 3 %}
                        {% include "snipplets/product-quantity.tpl" with {quickshop: true} %}
                    {% endif %}
                    <div class="js-product-cta-container product-buy-container full-width">
                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                        {# Add to cart CTA #}

                        <input type="submit" class="js-prod-submit-form js-addtocart btn btn-primary btn-smallest btn-inverse full-width {{state}} m-bottom-half" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>

                        {# Fake add to cart CTA visible during add to cart event #}
                            
                        {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-inverse btn-smallest", quickshop: true} %}
                    </div>
                </div>
            </form>
        </div>
    {% elseif quickshop_available %}

        {# For without variants for quickshop direct add #}

        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
            <input type="hidden" name="add_to_cart" value="{{product.id}}" />

            <div class="js-product-cta-container product-buy-container full-width">
                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                {# Add to cart CTA #}

                <input type="submit" class="js-prod-submit-form js-addtocart js-cart-direct-add btn btn-primary btn-inverse btn-smallest item-buy-btn full-width {{state}} m-bottom-half" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>

                {# Fake add to cart CTA visible during add to cart event #}
                    
                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-inverse btn-smallest item-buy-btn", quickshop: true, quickshop_direct_add: true} %}
            </div>
        </form>
    {% endif %}
{% endif %}