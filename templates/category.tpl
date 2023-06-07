{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{% paginate by settings.category_quantity_products %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% if settings.category_banner_top %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
<div class="row-fluid" id="category-page">
	<div class="container">        
        {% if products %}
            <div class="title-container" data-store="page-title">
                <div class="span8">
                    <h1>{{ category.name }}</h1>
                    {% if category.description %}
                            <p class="m-bottom p-left-xs p-right-xs font-small-xs">{{ category.description }}</p>
                    {% endif %}
                </div>
                <div class="span4">
                    {% snipplet "breadcrumbs.tpl" %}
                </div>
            </div>
        {% endif %}

        {% if (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
            {% include 'snipplets/category-banner.tpl' %}
        {% endif %}
       
        {% if settings.banner_services_category %} 
            {% include 'snipplets/banner-services/banner-services.tpl' %}
        {% endif %}
        {% if not show_help %}

        <div class="row-fluid">
            {% if has_filters_available %}
                {% snipplet 'sidebar.tpl' %}
            {% endif %}
            <div class="{% if has_filters_available %}span10{% else %}span12{% endif %}">
                {% if products %}
                    <div class="category-controls">
                        <div class="sort-by-container">
                            {% snipplet 'sort_by.tpl' %}
                        </div>
                        {% if has_filters_available %}
                            <a class="js-toggle-mobile-filters js-fullscreen-modal-open mobile-filters-btn btn-default btn-small pull-right weight-strong-xs visible-phone" data-modal-url="modal-fullscreen-filters">
                                {{ 'Filtrar' | translate }}
                                {% include "snipplets/svg/filter.tpl" with {fa_custom_class: "svg-inline--fa pull-right m-top-quarter"} %}
                            </a>
                        {% endif %}
                    </div>
                    <div class="visible-phone visible-when-content-ready full-width-container">
                        {% include "snipplets/filters.tpl" with {applied_filters: true} %}
                    </div>
                    <div data-store="category-grid-{{ category.id }}">
                        <div class="js-product-table full-width-container product-table p-top-xs">
                            {% snipplet "product_grid.tpl" %}
                        </div>
                        {% if settings.infinite_scrolling and pages.current == 1 and not pages.is_last %}
                            <div class="clear-both text-center m-top m-bottom p-bottom-half visible-when-content-ready visible-when-content-ready">
                                <a class="js-load-more-btn btn btn-primary clear-both full-width-xs col-centered">
                                    <span class="js-load-more-spinner" style="display:none;">
                                        {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin m-left-half pull-right svg-primary-fill"} %}
                                    </span>
                                    {{ 'Mostrar más productos' | t }}
                                </a>
                            </div>
                            <div id="js-infinite-scroll-spinner" class="m-bottom-double text-center m-top pull-left full-width" style="display:none">
                                {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-2x fa-spin svg-text-fill"} %}
                            </div>
                        {% endif %}
                        <div class="js-pagination-container clear-both p-top p-bottom text-center container-xs" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
                            <div class='pagination'>
                                {% snipplet "pagination.tpl" %}
                            </div>
                        </div>
                    </div>
                {% else %}
                    <h4 class="text-center text-uppercase m-top m-bottom row-fluid pull-left h6-xs">
                        {{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
                    </h4>
                {% endif %}
            </div>
        </div>
        {% elseif show_help %}
            {% snipplet 'defaults/show_help_category.tpl' %}
        {% endif %}

    </div>
</div>
{% if settings.category_banner_bottom %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 
{% if has_filters_available %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}