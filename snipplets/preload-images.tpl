{% set break = false %}
{% for banner in ['banner_home_01', 'banner_home_02', 'banner_home_03', 'banner_home_04'] if not break %}
    {% set has_banner_preload =  settings.banner_place == "top_a" and attribute(settings,"#{banner}_show") and "#{banner}_image.jpg" | has_custom_image %}
    {% if has_banner_preload %}
        <link rel="preload" as="image" href='{{ "#{banner}_image.jpg" | static_url | settings_image_url('large') }}' imagesrcset='{{ "#{banner}_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('huge') }} 640w'>  
        {% set break = true %}
    {% endif %}
{% endfor %}

{% if settings.slider or settings.slider is not empty %}
    {% for slide in settings.slider %}
        {% if loop.first %}
            <link rel="preload" as="image" href="{{ slide.image | static_url | settings_image_url('tiny') }}">
        {% endif %}
    {% endfor %}
{% endif %}