<div class="container clear-both" {% if template == 'home' %}data-store="banner-home-categories"{% endif %}>
        {% set num_banners = 0 %}
        {% if settings.banner_place == "top_a" %}
            {% set first_banner = true %}
        {% endif %}
        {% for banner in ['banner_home_01', 'banner_home_02', 'banner_home_03', 'banner_home_04'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
            {% set has_banner =  banner_show and (banner_title or banner_description or banner_button_text or "#{banner}_image.jpg" | has_custom_image) %}
            {% if has_banner %}
                {% set num_banners = num_banners + 1 %}
            {% endif %}
        {% endfor %}

   {% if num_banners != 4 %}
        <div class="row-fluid">
   {% endif %}
        {% for banner in ['banner_home_01', 'banner_home_02', 'banner_home_03', 'banner_home_04'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_url = attribute(settings,"#{banner}_url") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
            {% set banner_blank = attribute(settings,"#{banner}_blank")%}
            {% set has_banner =  banner_show and (banner_title or banner_description or (banner_url and banner_button_text) or "#{banner}_image.jpg" | has_custom_image) %}
            {% set has_banner_text =  banner_title or banner_description or (banner_url and banner_button_text) %}
            {% if has_banner %}
                {% if num_banners == 4 and loop.index % 2 == 1 %}
                    <div class="row-fluid">
                {% endif %}
                <div class="span{% if num_banners == 1 %}6 offset3{% elseif num_banners == 2 %}6{% elseif num_banners == 3 %}4{% elseif num_banners == 4 %}6{% endif %}{% if not has_banner_text %} without-text-container{% endif %}">
                    {% if "#{banner}_image.jpg" | has_custom_image %}
                        {% if banner_url %}
                            <a href="{{ banner_url | setting_url }}" {% if banner_blank %}target="_blank"{% endif %}{% if banner_title %}title="{{ banner_title }}" aria-label="{{ banner_title }}"{% else %} title="{{ "Banner de" | translate }} {{ store.name }}" aria-label="{{ "Banner de" | translate }} {{ store.name }}"{% endif %}>
                        {% endif %}
                        <div class="text-banner">
                            <div class="text-banner-image">
                                <img class="text-banner-image-background lazyautosizes lazyload blur-up-huge" src='{{ "#{banner}_image.jpg" | static_url | settings_image_url('tiny') }}' data-srcset='{{ "#{banner}_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" data-expand="-10" {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                            </div>
                        </div>
                        {% if banner_url %}
                            </a>
                        {% endif %}
                    {% endif %}
                    <div class="text-banner-info p-relative">
                        {% if banner_title %}
                            <h4 class="text-banner-title">{{ banner_title }}</h4>
                        {% endif %}
                        {% if banner_description %}
                            <p class="text-banner-paragraph">{{ banner_description }}</p>
                        {% endif %}
                        {% if banner_url and banner_button_text %}
                            <a href="{{ banner_url | setting_url }}" class="btn btn-primary text-banner-link" {% if banner_blank %}target="_blank"{% endif %} title="{{ banner_button_text }}" aria-label="{{ banner_button_text }}">{{ banner_button_text }}</a>
                        {% endif %}
                    </div>
                </div>
                {% if num_banners == 4 and loop.index % 2 == 0 %}
                    </div>
                {% endif %}
                {% if settings.banner_place == "top_a" %}
                    {% set first_banner = false %}
                {% endif %}
            {% endif %}
        {% endfor %}
    {% if num_banners != 4 %}
 	    </div>
    {% endif %}
</div>
