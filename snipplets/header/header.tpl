{% if settings.ad_bar and settings.ad_text %}
    <div class="js-addbar ad-container {% if theme_head_background == 'dark' %}ad-white{% endif %} p-bottom-quarter  p-top-quarter">
        {% snipplet "header/advertising.tpl" %}
    </div>
{% endif %}
<div class="js-desktop-head-container head-box {% if settings.head_fix %}js-head-fixed{% endif %} head-container transition-soft" data-store="head-desktop">
    <div class="container">
        <header>
            <div class="row-fluid search-logo-cart-container">
                <div class="span3 hidden-phone">
                    <div class="searchbox p-relative">
                        <form class="js-search-container js-search-form" action="{{ store.search_url }}" method="get">
                            <input class="js-search-input form-control form-control-xs" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label='{{ "Buscador" | translate }}' />
                            <button type="submit" class="btn btn-desktop-search" value='{{ "Buscar" | translate }}' aria-label='{{ "Buscar" | translate }}'>
                                <div class="svg-icon-text">
                                    {% include "snipplets/svg/search.tpl" %}
                                </div>
                            </button>
                        </form>
                        <div class="js-search-suggest search-suggest">
                            {# AJAX container for search suggestions #}
                        </div>
                    </div>
                </div>
                <div class="span6 logo-container">
                    {% if template == 'home' %}
                        <h1 class="mobile-logo-home text-center-xs">
                    {% endif %}
                        <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo('large') | img_tag(store.name, {class: 'logo-img transition-soft-slow'}) | a_tag(store.url) }}
                        </div>
                        <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
                            <a class="logo-text h1" href="{{ store.url }}">{{ store.name }}</a>
                        </div>
                    {% if template == 'home' %}
                        </h1>
                    {% endif %}
                </div>
                <div class="span3 hidden-phone">
                    {% if languages | length > 1 %}
                        {% snipplet "header/languages.tpl" %}
                    {% endif %}
                    {% if not store.is_catalog and template != 'cart' %}
                        {% if settings.ajax_cart %}
                            <div class="p-relative">
                                {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                            </div>
                        {% else %}
                            {% snipplet "cart.tpl" as "cart" %}
                        {% endif %}
                    {% endif %}
                    <div data-store="account-links">
                        {% if store.has_accounts %}
                            <div id="auth" class="font-small{% if customer %}-extra{% endif %} text-center text-uppercase p-relative">
                                {% if not customer %}
                                    {% if 'mandatory' not in store.customer_accounts %}
                                    {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, {class: 'border-right p-right-quarter'}) }}
                                    {% endif %}
                                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, {class: 'p-left-quarter'}) }}

                                    {% include "snipplets/tooltip-login.tpl" with {desktop: "true"} %}
                                {% else %}
                                    {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
                                    <a href="{{ store.customer_home_url }}" class="text-primary border-right p-right-quarter m-left-half">
                                        {{ "¡Hola, {1}!" | t(customer_short_name) }}
                                    </a>
                                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, {class: 'p-left-quarter'}) }}
                                {% endif %}
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>
            <ul class="js-desktop-nav desktop-nav hidden-phone m-top-half m-bottom-half" data-store="navigation" data-component="menu">
                {% snipplet "navigation/navigation.tpl" %}
            </ul>
        </header>
    </div>
</div>