{% set theme_version = settings.version_theme %}
<div class="js-home-slider-container row-fluid p-relative slider-wrapper{% if theme_version == 'full' %}-full{% else %} m-bottom m-bottom-half-xs{% endif %} {% if not settings.slider or settings.slider is empty %} hidden {% endif %}" data-store="slider-main">
    <div class="js-home-slider home-slider swiper-container slider">
        <div class="swiper-wrapper">            
            {% for slide in settings.slider %}
                <div class="swiper-slide">
                    {% if not slide.link is empty %}
                    <a href="{{ slide.link | setting_url }}" aria-label="{{ 'Imagen del carrusel {1}' | translate(loop.index) }}">
                    {% endif %}
                        <img class="swiper-lazy blur-up-huge slide-img" src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-sizes="auto" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" alt="{{ 'Imagen del carrusel {1}' | translate(loop.index) }}"/>
                    {% if not slide.link is empty %}
                    </a>
                    {% endif %}
                </div>
            {% endfor %}
        </div>
        <div class="js-swiper-home-pagination swiper-pagination visible-phone m-bottom-quarter"></div>
        <div class="js-swiper-home-prev swiper-button-prev btn btn-primary btn-inverse btn-small hidden-phone">{% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}</div>
        <div class="js-swiper-home-next swiper-button-next btn btn-primary btn-inverse btn-small hidden-phone">{% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}</div>
    </div>
</div>