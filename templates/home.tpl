{% set show_help = not (settings.slider | length) and not ("banner-home.jpg" | has_custom_image) and not has_products %}
<div class="sections">
    {% if show_help %}
    <div class="title-container text-center m-top">
        <h2>{{"¡Bienvenido a tu tienda!" | translate}}</h2>
    </div>  
    {% endif %}
</div>

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# This will show default products in the home page before you upload some products #}
{% if show_help %}
    {% snipplet 'defaults/show_help.tpl' %}
{% endif %}
{# END of show default products in the home page #}

{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

<section data-store="slider-main">
    {% include 'snipplets/home-slider.tpl' %}
    {% if has_mobile_slider %}
        {% include 'snipplets/home-slider.tpl' with {mobile: true} %}
    {% endif %}
</section>

{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %} 

{#  **** Categories and promotional banners ****  #}
<div class="container-wide banner-wrapper m-top m-bottom m-bottom-half-xs p-relative">
    {% include 'snipplets/home-banners.tpl' %}
    {% include 'snipplets/home-promotional-banners.tpl' %}
</div>

{% if settings.welcome_message %}
	{% if settings.version_theme == 'wide' or settings.version_theme == 'full' %}
        <div class="row-fluid container-wide m-top-half-xs m-bottom-half-xs {% if settings.welcome_text %}m-section-top{% else %}m-section{% endif %}">
            <div class="span12">
                <div class="subtitle-container m-bottom m-none-xs">
                    <h2 class="h5-xs">{{ settings.welcome_message }}</h2>
                </div>
            </div>
        </div>
        {% if settings.welcome_text %}
        <div class="row-fluid m-bottom-half-xs m-section-bottom">
            <div class="span8 offset2">
                <div class="subtitle-paragraph m-bottom">
                    <p>{{ settings.welcome_text }}</p>
                </div>
            </div>
        </div>
        {% endif %}
    {% else %}
        <div class="row-fluid m-top-half-xs m-bottom">
            <div class="span12">
                <div class="subtitle-container">
                    <h2 class="h5-xs">{{ settings.welcome_message }}</h2>
                </div>
            </div>
        </div>
        {% if settings.welcome_text %}
        <div class="row-fluid m-bottom-half-xs">
            <div class="span8 offset2">
                <div class="subtitle-paragraph m-bottom">
                    <p>{{ settings.welcome_text }}</p>
                </div>
            </div>
        </div>
        {% endif %}
    {% endif %}
{% endif %}

{% if categories %}
    {% include 'snipplets/home-categories.tpl' %}
{% endif %}
{% if sections.primary.products %}
    <div class="row-fluid container-wide home-prods m-section m-top m-none-xs" data-store="products-home-featured">
        {% if categories and settings.home_main_categories %}
            <div class="span2 left-col hidden-phone visible-when-content-ready">
                {% snipplet 'sidebar-home.tpl' %}
            </div>
        {% endif %}
        <div class="{% if categories and settings.home_main_categories %}span10 {% else %} span12 {% endif %}home-grid right-col">
            <div class="js-product-table product-table">
            {% for product in sections.primary.products %}
                {% if loop.index % 4 == 1 %}
                <div class="grid-row">
                {% endif %}

                {% include 'snipplets/single_product.tpl' %}

                {% if loop.index % 4 == 0 or loop.last %}
                </div>
                {% endif %}
            {% else %}
                {% if show_help %}
                    {% for i in 1..4 %}
                        {% if loop.index % 4 == 1 %}
                            <div class="grid-row">
                        {% endif %}

                        <div class="span3">
                            <div class="item">
                                <div class="item-image-container">
                                    <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                                </div>
                                <div class="item-info-container">
                                    <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                                    <div class="price">{{"$0.00" | translate}}</div>
                                </div>
                            </div>
                        </div>

                        {% if loop.index % 4 == 0 or loop.last %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% endif %}
            {% endfor %}
            </div>
            <div class="row-fluid container-xs container-see-all-prods text-center clear-both visible-when-content-ready">
                <a href="{{ store.products_url }}" class="btn-see-all-prods btn btn-primary btn-small d-inline-block m-top m-bottom p-left p-right span4 offset4" aria-label="{{ "Ver todos los productos" | translate }}">{{ "Ver todos los productos" | translate }}</a>
            </div>
        </div>
    </div>
{% endif %}

{% if sections.sale.products %}
    <div class="row-fluid container-wide home-prods m-section m-top m-none-xs">
        <div class="span12 home-grid right-col">
            {% if settings.sale_products_title %}
                <h2 class="h5-xs text-center text-uppercase m-top-xs m-bottom">{{ settings.sale_products_title }}</h2>
            {% endif %}

            <div class="products-slider">
                <div class="js-swiper-sale-products swiper-container">
                    <div class="swiper-wrapper">
                        {% for product in sections.sale.products %}
                            {% include 'snipplets/single_product.tpl' with {'slide_item': true} %}
                        {% endfor %}
                    </div>
                    <div class="js-swiper-sale-products-pagination swiper-pagination d-block "></div>
                    <div class="js-swiper-sale-products-prev swiper-button-prev display-none display-md-block svg-circle svg-circle-big svg-icon-text">{% include "snipplets/svg/angle-left-regular.tpl" %}</div>
                    <div class="js-swiper-sale-products-next swiper-button-next display-none display-md-block svg-circle svg-circle-big svg-icon-text">{% include "snipplets/svg/angle-right-regular.tpl" %}</div>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}

{% if "banner-home.jpg" | has_custom_image %}
    <div class="row-fluid m-section">
        <div class="banner">
            {% if settings.banner_home_url != '' %}
            <a href="{{ settings.banner_home_url }}" aria-label="{{ "Link del banner" | translate }}">
            {% endif %}
                <img class="lazyautosizes lazyload blur-up-big" src="{{ "banner-home.jpg" | static_url | settings_image_url('thumb')}}" data-srcset='{{ "banner-home.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-home.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-home.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-home.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" alt="{{ "Banner" | translate }} {{ store.name }}"/>
            {% if settings.banner_home_url != '' %}
            </a>
            {% endif %}
        </div>
    </div>
{% endif %}

{#  **** Modules with images and text ****  #}

{% include 'snipplets/home-modules.tpl' %}

{% if settings.video_embed %}
<div class="row-fluid container-wide video-wrapper p-relative m-bottom-xs p-bottom-xs m-section" data-store="video-home">
    <div class="span-12">
        {% include 'snipplets/video-item.tpl' %}
    </div>
</div>
{% endif %}

{% if settings.show_instafeed and store.instagram %}
    {% set instuser = store.instagram|split('/')|last %}

    {# Instagram fallback info in case feed fails to load #}
    <div class="js-ig-fallback instafeed-fallback m-top">
        <div class="container-xs text-center">
            <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa d-inline-block fa-4x svg-icon-text"} %}
                <span class="align-top d-inline-block m-left-quarter text-uppercase text-left">
                    <div class="m-top-quarter text-uppercase font-small">{{ 'Seguinos en Instagram' | translate }}</div>
                    <h2 class="h4-xs">@{{ instuser }}</h2>
                </span>
            </a>
        </div>
    </div>

    {# Instagram feed #}
    {% if store.hasInstagramToken() %}
        <div class="js-ig-success" style="display: none;">
            <div class="title-container row-fluid m-top m-bottom text-uppercase">
                <div class="container-xs text-center">
                    <h3 class="h5-xs">
                        <a target="_blank" href="{{ store.instagram }}" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                            {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-text"} %} @{{ instuser }}
                        </a>
                    </h3>
                </div>
            </div>
            <div class="instafeed-module m-bottom text-center" data-store="instagram-feed">
                <div class="container">
                    <div class="row-fluid">
                        <div id="instagram-feed" class="overide-container-width m-none-xs" 
                            data-ig-feed
                            data-ig-items-count="8"
                            data-ig-item-class="instafeed-item col-md-3-custom col-xs-6-custom m-bottom-half"
                            data-ig-link-class="instafeed-link"
                            data-ig-image-class="instafeed-img fade-in"
                            data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}">  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
{% endif %}

<div class="row-fluid m-bottom-half facebook-widget-row visible-when-content-ready text-center-xs">

    {% if settings.show_footer_fb_like_box and store.facebook %}
        <div class="home-social-widget overflow-none visible-when-content-ready span{% if settings.twitter_widget %}6{% else %}12{% endif %}">
            <div class="social-title text-center divider-dotted">
                <h4 class="h4 weight-normal text-uppercase m-bottom-half">{{"Síguenos en Facebook" | translate}}</h4>
            </div>
            <div class="m-top-half m-bottom-half">
                <div class="fb-page">
                    <div class="fb-page-head p-all-half">
                        <div class="d-flex">
                            <div class="fb-page-img-container m-right-half text-center">
                                {% if has_logo %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" class="fb-page-img lazyload" data-src="{{ store.logo('thumb')}}"/>
                                {% else %}
                                    {% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-3x m-top-half fb-page-icon"} %}
                                {% endif %}
                            </div>
                            <div>
                                <div class="h6">{{ store.name }}</div>
                                <div class="m-top-half">
                                    <a href="{{ store.facebook }}" target="_blank" class="fb-like weight-strong" aria-label="{{ "Facebook de" | translate }} {{ store.name }}">
                                        {% include "snipplets/svg/thumbs-up.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter"} %}
                                        {{ 'Me gusta' | translate }}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fb-page-footer p-all-half">
                        <div class="fb-page-box">
                            <a href="{{ store.facebook }}" target="_blank" class="fb-page-link" aria-label="{{ "Facebook de" | translate }} {{ store.name }}">
                                <span class="weight-strong opacity-80">{{ 'Visitá nuestra página' | translate }}</span>
                                {% include "snipplets/svg/facebook-square.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-left-quarter"} %}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
    {% if settings.twitter_widget and store.twitter %}
        <div class="home-social-widget visible-when-content-ready span{% if settings.show_footer_fb_like_box and store.facebook %}6{% else %}12{% endif %}">
            <div class="social-title text-center divider-dotted">
                <h4 class="h4 weight-normal text-uppercase m-bottom-half">{{"Síguenos en Twitter" | translate}}</h4>
            </div>
            <div class="row-fluid tw">
                {% set twuser = store.twitter|split('/')|last %}
                <div class="twitter-time">
                    <div class="twitter-head">
                        <h3 class="tw-title">Tweets <span class="tw-title-byline">by <a href="{{ store.twitter }}" target="_blank" aria-label="{{ "Twitter de" | translate }} {{ store.name }}">@{{ twuser }}</a></span></h3>
                    </div>
                    <div id="twitterfeed"></div>
                </div>
            </div>
        </div>
    {% endif %}
</div>