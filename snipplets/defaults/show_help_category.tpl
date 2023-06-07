{# Products that work as examples #}
<div class="image-banner m-bottom-none m-top">
    {% include "snipplets/svg/banner-category.tpl" %}
</div>
<div class="row-fluid m-bottom">
    <div class="row-fluid" id="products-example">
        <div class="container">
            <div class="title-container">
                <div class="span12">
                    <h1 class="p-top-half">{{"Productos de ejemplo" | translate}}</h1>
                </div>
            </div>
            <div class="grid-row">
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            <div class="labels-floating">
                                <div class="pull-right">
                                    <div class="label-circle label-primary clear-both m-bottom-quarter">
                                        <span class="label-text">
                                            <div>33%</div>
                                            <div>OFF</div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            {% include "snipplets/svg/help-product-2.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"100000" | money }}</span>
                                <span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
                                    <span id="compare_price_display" >{{"150000" | money }}</span>
                                </span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            <div class="labels-floating">
                                <div class="pull-right">
                                    <div class="label-circle label-primary clear-both">
                                        <span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
                                    </div>
                                </div>
                            </div>
                            {% include "snipplets/svg/help-product-1.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"44200" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            <div class="labels-floating">
                                <div class="pull-right">
                                    <div class="label-circle label-primary clear-both m-bottom-quarter">
                                        <span class="label-text">
                                            <div>23%</div>
                                            <div>OFF</div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            {% include "snipplets/svg/help-product-9.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"10200" | money }}</span>
                                <span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
                                    <span id="compare_price_display" >{{"13200" | money }}</span>
                                </span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            <div class="labels-floating">
                                <div class="label-circle label-secondary label-circle-big">
                                    <span class="label-text">{{ "Sin stock" | translate }}</span>
                                </div>
                            </div>
                            {% include "snipplets/svg/help-product-3.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"44200" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
            </div>
            <div class="grid-row">
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            {% include "snipplets/svg/help-product-4.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"11200" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            {% include "snipplets/svg/help-product-6.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"13200" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            {% include "snipplets/svg/help-product-8.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"143000" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
                <div class="item span3">
                    <a href="/product/example" title="{{ product.name }}" class="item-link">
                        <div class="item-image-container">
                            {% include "snipplets/svg/help-product-7.tpl" %}
                        </div>
                        <div class="item-info-container m-top-half m-bottom-half">
                            <h6 class="item-name weight-normal font-body m-bottom-quarter">
                                {{ "Producto de ejemplo" | translate }}
                            </h6>
                            <div class="item-price-container">
                                <span class="item-price weight-strong text-primary" id="price_display">{{"110000" | money }}</span>
                            </div>
                        </div>
                    </a>
                    <div class="text-uppercase font-small-extra m-top-quarter">
                        <a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
