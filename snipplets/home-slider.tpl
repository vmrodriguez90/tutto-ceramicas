{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

{% if not mobile %}
    <div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
        <div class="{% if mobile %}js-home-mobile-slider-visibility{% else %}js-home-main-slider-visibility{% endif %}  {% if has_main_slider and has_mobile_slider %}{% if mobile %}visible-phone{% else %}hidden-phone{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}">
            <div class="js-home-slider{% if mobile %}-mobile{% endif %} home-slider swiper-container swiper-container-horizontal">
                <div class="swiper-wrapper">
                    {% if mobile %}
                        {% set slider = settings.slider_mobile %}
                    {% else %}
                        {% set slider = settings.slider %}
                    {% endif %}
                    {% for slide in slider %}
                        <div class="swiper-slide slide-container">
                            {% if not slide.link is empty %}
                            <a href="{{ slide.link | setting_url }}">
                            {% endif %}
                                <img
                                    {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
                                    data-sizes="auto"
                                    src="{{ slide.image | static_url | settings_image_url('tiny') }}"
                                    data-srcset='{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w'
                                    class="swiper-lazy blur-up-huge slide-img"
                                    alt="{{ "Carrusel" | translate }} {{ store.name }}"
                                />
                            {% if not slide.link is empty %}
                            </a>
                            {% endif %}
                        </div>
                    {% endfor %}
                </div>
                <div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination swiper-pagination-bullets d-block">
                    {% if settings.slider > 1 and not params.preview %}
                        {% for slide in settings.slider %}
                            <span class="swiper-pagination-bullet"></span>
                        {% endfor %}
                    {% endif %}
                </div>
                <div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev display-none display-md-block svg-icon-text">{% include "snipplets/svg/angle-left-regular.tpl" %}</div>
                <div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next display-none display-md-block svg-icon-text">{% include "snipplets/svg/angle-right-regular.tpl" %}</div>
            </div>
        </div>
{% if not mobile %}
    </div>
{% endif %}
