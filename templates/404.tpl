{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<div class="row-fluid" id="404">
    <div class="container">
        <div class="frame-title span6 offset3 visible-when-content-ready" data-store="page-title">
            <h1>- {{ "Error" | translate }} -</h1>
            <h2 class="h1">{{ "404" | translate }}</h2>
            <p>{{ "La página que estás buscando no existe." | translate }}</p>
        </div>

        {% if sections.primary.products %}
            <div class="row-fluid m-top">
                <div class="container p-relative clear-both m-bottom">
                    <h6 class="subtitle m-none">{{"Quizás te interesen los siguientes productos." | translate}}</h6>
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
    </div>
</div>
{# Here we will add an example as a help, you can delete this after you upload your products #}
{% if show_help %}
<div class="row-fluid" id="product-example">
    {% snipplet 'defaults/show_help_product.tpl' %}
</div>
{% endif %}
