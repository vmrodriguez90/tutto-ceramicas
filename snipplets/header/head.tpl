<div class="js-head head mobile-nav" data-store="head">
    <div class="container">
        <div class="row-fluid">
            <div  class="js-modal-open btn-hamburger-container text-center visible-phone m-bottom-quarter-xs" data-toggle="#nav-hamburger" aria-label="{{ "Menú" | translate }}">
                <div class="mobile-nav-first-row-icon btn-hamburger svg-primary-fill">
                    {% include "snipplets/svg/hamburger.tpl" %}
                </div>
            </div>
            <div class="logo-container{% if not settings.search_header %}-wide{% endif %} m-left-none">
                {% if template == 'home' %}
                    <h1 class="mobile-logo-home">
                {% endif %}
                    <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
                        {% set logo_dimensions = store.logo_dimensions() %}
                        {% set width = logo_dimensions ? logo_dimensions.width : null %}
                        {% set height = logo_dimensions ? logo_dimensions.height : null %}
                        {{ store.logo('large') | img_tag(store.name, {class: 'logo-img transition-soft ', width: width, height: height}) | a_tag(store.url) }}
                    </div>
                    <a id="no-logo" class="logo-text{% if has_logo %} hidden{% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                {% if template == 'home' %}
                    </h1>
                {% endif %}
            </div>
            {% if settings.search_header %}
            <div class="desktop-search d-inline-block p-relative text-center-xs hidden-phone">
                <div class="js-search-container searchbox ">
                    <form action="{{ store.search_url }}" method="get" class="js-search-form">
                        <input class="js-search-input desktop-search-input" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}" aria-label="{{ '¿Qué estás buscando?' | translate }}"/>
                        <span class="desktop-search-icon">
                            {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-search-icon nav-svg"} %}
                        </span>
                        <input class="desktop-search-submit" type="submit" value="{{ "Buscar" | translate }}" aria-label="{{ "Buscar" | translate }}"/>
                    </form>
                </div>
                <div class="js-search-suggest search-suggest">
                    {# AJAX container for search suggestions #}
                </div>
            </div>
            {% endif %}
            <div class="header-icons {% if not settings.search_header %}m-none p-top-half{% endif %} p-top-quarter-xs m-bottom-quarter-xs">
                {% if store.email and not settings.search_header %}
                    <div class="hidden-phone font-small font-italic m-bottom-quarter m-top-quarter">
                        {{ store.email | mailto }}
                    </div>
                {% endif %}
                <div class="js-toggle-mobile-search js-toggle-mobile-search-open header-icons-container mobile-search-btn hidden-desktop text-center">
                    <div class="mobile-nav-first-row-icon svg-primary-fill pull-right">
                        {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-search-icon nav-svg"} %}
                    </div>
                </div> 
                <div class="header-icons-container">            
                    {% if not store.is_catalog and template != 'cart' %}
                        {% if settings.ajax_cart %}
                            {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                        {% else %}
                            {% snipplet "cart-widget.tpl" as "cart" %}
                        {% endif %}
                    {% endif %}
                </div>
            </div>
        </div>

        <div class="row-fluid hidden-phone">
            <ul class="js-desktop-nav desktop-nav" data-store="navigation">
                {% snipplet "navigation/navigation.tpl" %}
            </ul>
        </div>
    </div>
</div>


{% if settings.tab_menu  %}
    <div class="visible-phone">
        {% snipplet "navigation/navigation-mobile.tpl" %}
    </div>
{% endif %}