{% paginate by settings.category_quantity_products %}
<div class="row-fluid" id="category-page">
	<div class="container">
        {% if products %}
            <div class="title-container" data-store="page-title">
                <div class="span8">
                    <h1>{{ "Resultados de búsqueda" | translate }}</h1>
                </div>
                <div class="span4">
                    {% snipplet "breadcrumbs.tpl" %}
                </div>
            </div>
        
             <div class="js-product-table product-table">
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
            <div class="crumbPaginationContainer bottom visible-when-content-ready" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
                <div class='pagination'>
                    {% snipplet "pagination.tpl" %}
                </div>
            </div>
        {% else %}
            <div class="frame-title span6 offset3 m-top">
                <h1 class="h3-xs">{{ "No hubo resultados para tu búsqueda" | translate }}</h1>
            </div>

            {% if sections.primary.products %}
                <div class="row-fluid m-top">
                    <div class="container p-relative clear-both m-bottom">
                        <h6 class="subtitle m-none">{{"Productos destacados" | translate}}</h6>
                        <div class="js-swiper-primary-products grid-row overflow-none overflow-visible-xs m-top-half-xs">
                            <div class="swiper-wrapper swiper-wrapper-md">
                                {% for product in sections.primary.products %}
                                    {% include 'snipplets/single_product.tpl' with {'slide_item': true} %}
                                {% endfor %}
                            </div>
                            {% if sections.primary.products | length > 4 %}
                                <div class="js-swiper-primary-products-prev swiper-button-top-right swiper-button-prev hidden-phone">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                <div class="js-swiper-primary-products-next swiper-button-top-right swiper-button-next hidden-phone">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                            {% endif %}
                        </div>
                    </div>
                </div>
            {% endif %}
        {% endif %}
    </div>
</div>
