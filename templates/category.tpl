{% set show_filters = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by settings.category_quantity_products %}

<div class="banner-services-category hidden-phone">
    {% if settings.banner_services_category %} 
        {% include 'snipplets/banner-services/banner-services.tpl' %}
    {% endif %} 
</div>

{% if (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
    {% include 'snipplets/category-banner.tpl' %}
{% endif %}

{% if category.description %}
    <div class="container-xs m-bottom text-center">
        <div class="row-fluid">
            <div class="span8 offset2">
                <h1 class="m-bottom m-top">{{category.name}}</h1>
                <p class="m-bottom font-small-xs">{{category.description}}</p>
            </div>
        </div>
    </div>
{% endif %}

<div class="js-category-breadcrumbs row-fluid container-wide categoria container-xs m-bottom m-none-xs m-bottom-quarter-xs"> 
    <div class="span8 left"> 
        {% snipplet "breadcrumbs.tpl" %}
    </div>
    <div class="hidden-phone text-right sort-by-container">
        {% snipplet 'sort_by.tpl' %}
    </div>
</div>
<div class="js-category-controls-prev category-controls-sticky-detector"></div>
<div class="js-category-controls category-controls container-xs visible-phone visible-when-content-ready">
    <div class="text-left sort-by-container m-top-quarter">
        {% snipplet 'sort_by.tpl' %}
    </div>
    {% if show_filters %}
        <a href="#" class="js-toggle-mobile-filters js-fullscreen-modal-open btn btn-secondary btn-smallest mobile-filters-btn pull-right visible-phone p-relative" data-modal-url="modal-fullscreen-filters">
            <span>{{ 'Filtrar' | translate }}</span>
            {% include "snipplets/svg/angle-right-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-icon-text m-left-half"} %}
        </a>
    {% endif %}
</div>
<div class="visible-phone">
    {% include "snipplets/filters.tpl" with {'applied_filters': true, 'filters_mobile': true} %}
</div>  
{% if not show_help %}
<div class="row-fluid container-wide container-xs container-product-grid">
    {% if show_filters %} 
        {% snipplet 'sidebar.tpl' %}
    {% endif %} 
    <div class="{% if show_filters %}span10{% else %}span12{% endif %}" data-store="category-grid-{{ category.id }}">
    {% if show_filter_error %}
        <div class="container-xs text-center m-top m-bottom">
            <h5 class="text-uppercase m-bottom-half">{{ "No tenemos productos para mostrarte :(" | translate }}</h5>
            <h5 class="weight-normal">{{ "Quizás encuentres lo que buscabas en los productos debajo." | translate }}</h5>
        </div>
    {% endif %}
    {% if products %}
        <div class="js-product-table pull-left row-fluid m-bottom m-top-xs">
            {% snipplet "product_grid.tpl" %}
        </div>

        {% set show_infinite_scroll = settings.infinite_scrolling and not pages.is_last and products and pages.current == 1 %}

        {% if show_infinite_scroll %}
             <div class="clear-both m-bottom visible-when-content-ready text-center">
                <a class="js-load-more-btn btn btn-primary btn-small full-width-xs">
                    <div class="js-load-more-spinner m-left-half pull-right" style="display:none;">
                        {% include "snipplets/svg/sync-alt-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-icon-back"} %}
                    </div>
                    {{ 'Mostrar más productos' | t }}
                </a>
            </div>
        {% endif %}
        <div id="js-infinite-scroll-spinner" class="p-bottom-double text-center m-top" style="display:none">
            {% include "snipplets/svg/sync-alt-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-2x fa-spin svg-icon-text"} %}
        </div>
         <div class="js-pagination-container clear-both p-top p-bottom text-center" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
            <div class='pagination'>
                {% snipplet "pagination.tpl" %}
            </div>
        </div>
    {% else %}

        <h3 class="text-center m-top m-bottom">
            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
        </h3>
    {% endif %}
    </div>
</div>
{% elseif show_help %}
    {% snipplet 'defaults/show_help_category.tpl' %}
{% endif %}
{% if show_filters %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}
