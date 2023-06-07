<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
{% set theme_version = settings.version_theme %}

{% if settings.slider and settings.slider is not empty %} 
    {% include 'snipplets/home-slider.tpl' %}
{% endif %} 

{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %} 
{% if settings.banner_place == "top_a" %}
    {% include 'snipplets/banner.tpl' %}
{% endif %}

{% if categories %}
    {% include 'snipplets/home-categories.tpl' %}
{% endif %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    {% snipplet 'defaults/show_help.tpl' %}
{% endif %}
{# END of show default products in the home page #}

{% if not show_help %}
    {% if sections.primary.products %}
        <div class="row-fluid m-top" data-store="products-home-featured">
            <div class="container p-relative clear-both m-bottom">
                <h6 class="subtitle m-none">{{"Productos destacados" | translate}}</h6>
                <div class="js-swiper-primary-products overflow-none overflow-visible-xs m-top-half-xs">
                    <div class="swiper-wrapper swiper-wrapper-md grid-row">
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

{% if settings.banner_place == "middle" %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %} 

{% if settings.welcome_message or show_help %}
    <div class="welcome-container p-relative container-primary text-center {% if theme_version == 'full' %} full-container{% endif %}">
        {% if "welcome_message_img.jpg" | has_custom_image %}
            <div class="welcome-background">
                <img class="welcome-background-image lazyload fade-in" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "welcome_message_img.jpg" | static_url | settings_image_url('large') }} 480w, {{ "welcome_message_img.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "welcome_message_img.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "welcome_message_img.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" data-expand="-10" alt="{{ "Banner de" | translate }} {{ store.name }}" />
            </div>
        {% endif %}
        <div class="container p-relative">
            <div class="row-fluid">
                <div class="welcome-message">
                    {% if show_help and not settings.welcome_message  %}
                        <h4 class="h5-xs welcome-message-text weight-bold d-inline-block m-bottom-xs text-center">{{ "Este es un banner de ejemplo, luego podrás elegir tu propio banner" | t }}</h4>
                    {% else %}
                        <h4 class="h5-xs welcome-message-text text-center weight-bold d-inline-block m-bottom-xs">{{ settings.welcome_message }}</h4>
                    {% endif %}
                    {% if settings.welcome_message_link and settings.welcome_message_link_url %}
                        <a href="{{ settings.welcome_message_link_url | setting_url }}" class="banner-link m-left m-none-xs transition-soft">{{ settings.welcome_message_link }}</a>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% set has_home_products = sections.recent.products or sections.offer.products or sections.coming.products%}
{% if not show_help %}
    {% if has_home_products %}
        <div class="row-fluid">
            <div class="container m-top">
                {% if sections.recent.products %}
                    <div class="span4">
                        <div class="p-relative border-bottom m-bottom border-none-xs">
                            <h6 class="subtitle">{{"Productos recientes" | translate}}</h6>
                            <div class="js-swiper-recent-products overflow-none swiper-vertical-md">
                                <div class="swiper-wrapper swiper-wrapper-md">
                                    {% for product in sections.recent.products %}
                                        <div class="swiper-slide">
                                            {% include 'snipplets/single_product_second.tpl' %}
                                        </div>
                                    {% endfor %}
                                </div>
                                {% if sections.primary.products | length > 3 %}
                                    <div class="js-swiper-recent-products-prev swiper-button-bottom-right swiper-button-prev hidden-phone">{% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                    <div class="js-swiper-recent-products-next swiper-button-bottom-right swiper-button-next hidden-phone">{% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                {% endif %}
                {% if sections.offer.products %}
                    <div class="span4">
                        <div class="p-relative border-bottom m-bottom border-none-xs">
                            <h6 class="subtitle">{{"Productos en oferta" | translate}}</h6>
                            <div class="js-swiper-offer-products overflow-none swiper-vertical-md">
                                <div class="swiper-wrapper swiper-wrapper-md">
                                    {% for product in sections.offer.products %}
                                        <div class="swiper-slide">
                                            {% include 'snipplets/single_product_second.tpl' %}
                                        </div>
                                    {% endfor %}
                                </div>
                                {% if sections.primary.products | length > 3 %}
                                    <div class="js-swiper-offer-products-prev swiper-button-bottom-right swiper-button-prev hidden-phone">{% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                    <div class="js-swiper-offer-products-next swiper-button-bottom-right swiper-button-next hidden-phone">{% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                {% endif %}
                {% if sections.coming.products %}
                    <div class="span4">
                        <div class="p-relative border-bottom m-bottom border-none-xs">
                            <h6 class="subtitle">{{"Próximamente" | translate}}</h6>
                            <div class="js-swiper-coming-products overflow-none swiper-vertical-md">
                                <div class="swiper-wrapper swiper-wrapper-md">
                                    {% for product in sections.coming.products %}
                                        <div class="swiper-slide">
                                            {% include 'snipplets/single_product_second.tpl' %}
                                        </div>
                                    {% endfor %}
                                </div>
                                {% if sections.primary.products | length > 3 %}
                                    <div class="js-swiper-coming-products-prev swiper-button-bottom-right swiper-button-prev hidden-phone">{% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                    <div class="js-swiper-coming-products-next swiper-button-bottom-right swiper-button-next hidden-phone">{% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                {% endif %}
            </div>
        </div>
    {% endif %}
{% else %}
    {% snipplet 'defaults/show_help_sliders.tpl' %}
{% endif %}
{% if has_home_products %}
    <div class="container container-see-all-prods text-center clear m-bottom">
        <a href="{{ store.products_url }}" class="btn btn-primary d-inline-block m-top m-bottom p-left p-right col-centered full-width-xs">{{ "Ver todos los productos" | translate }}</a>
    </div>
{% endif %}
{% if settings.banner_place == "bottom" %} 
    {% include 'snipplets/banner.tpl' %}
{% endif %}

{% include 'snipplets/banner-promotional.tpl' %}

{% if settings.video_embed or (settings.show_instafeed and store.instagram) %}
    <div class="container video-wrapper visible-when-content-ready m-bottom-double m-top-double m-top-none-xs">
        <div class="row-fluid m-bottom-double m-bottom-none-xs m-top-double text-center">
            {% if settings.show_instafeed and store.instagram %}
                {% set instuser = store.instagram|split('/')|last %}
                <div class="{% if not settings.video_embed %}span12{% else %}span4 offset1{% endif %} col-xs-custom m-bottom-xs" data-store="instagram-feed">
                    {% if store.hasInstagramToken() %}
                        <div class="js-ig-success" style="display: none;">
                            <h5 class="h6-xs weight-bold text-uppercase">
                                <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                                    {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %} @{{ instuser }}
                                </a>
                            </h5>
                            <div class="instafeed-module m-top m-bottom text-center">
                                <div id="instagram-feed" class="overide-container-width" 
                                    data-ig-feed
                                    data-ig-items-count="6"
                                    data-ig-item-class="instafeed-item {% if not settings.video_embed %}col-md-2-custom{% else %}col-md-4-custom{% endif %} col-xs-4-custom"
                                    data-ig-link-class="instafeed-link"
                                    data-ig-image-class="instafeed-img fade-in"
                                    data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}">
                                </div>
                            </div>
                        </div>
                    {% endif %}

                    {# Instagram fallback in case conection to show feed fails #}
                    <div class="js-ig-fallback text-center {% if settings.video_embed %}p-top-double p-none-xs{% endif %} m-bottom-xs">
                        <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                            {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa fa-5x svg-primary-fill m-bottom-half m-top"} %} 
                            <h3 class="h4-xs weight-bold text-uppercase m-bottom-half">@{{ instuser }}</h3>
                            <span class="btn btn-primary btn-small">{{ 'Seguinos' | translate }}</span>
                        </a>
                    </div>
                </div>
            {% endif %}
            {% if settings.video_embed %}
                <div class="{% if not settings.show_instafeed %}span8 offset2{% else %}span6 offset1{% endif %} col-xs-custom m-top-xs overide-container-xs-width" data-store="video-home">
                    {% include 'snipplets/video-item.tpl' %}
                </div>
            {% endif %}
        </div>
    </div>
{% endif %}

{#  **** Modules with images and text ****  #}
{% include 'snipplets/home-modules.tpl' %}


{% if settings.show_footer_fb_like_box and store.facebook %}
    <div class="container m-bottom">
        <div class="border-bottom p-bottom-half m-bottom-half text-center">
            <h5 class="text-uppercase weight-normal">{{"Síguenos en Facebook" | translate}}</h5>
        </div>
        <div class="fb-page">
            <div class="fb-page-head p-all-half">
                <div class="d-flex">
                    <div class="fb-page-img-container m-right-half text-center">
                        {% if has_logo %}
                            <img class="fb-page-img lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ store.logo('thumb')}}" />
                        {% else %}
                            {% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill m-top-quarter fb-page-icon"} %}
                        {% endif %}
                    </div>
                    <div>
                        <div class="h6 fb-page-title">{{ store.name }}</div>
                        <div class="m-top-half">
                            <a href="{{ store.facebook }}" target="_blank" class="fb-like weight-strong">
                                {% include "snipplets/svg/thumbs-up.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}
                                {{ 'Me gusta' | translate }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fb-page-footer p-all-half">
                <div class="fb-page-box">
                    <a href="{{ store.facebook }}" target="_blank" class="fb-page-link">
                        <span class="weight-strong opacity-80">{{ 'Visitá nuestra página' | translate }}</span>
                        {% include "snipplets/svg/facebook-square.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-left-quarter"} %}
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}
