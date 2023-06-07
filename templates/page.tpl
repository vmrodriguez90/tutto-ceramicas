<div class="row-fluid" data-store="page-title">
	<div class="container">
        <div class="title-container">
            <div class="span8">
                <h1>{{ page.name }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
	</div>
</div>
<div class="row-fluid">
	<div class="container">
        {% if "foto-nosotros.jpg" | has_custom_image %}
            <div class="span6 image-banner m-none">
                {% if settings.foto_nosotros_url != '' %}
                <a href="{{ settings.foto_nosotros_url | setting_url }}">
                {% endif %}
                    <img class="lazyautosizes lazyload blur-up-big" src="{{ "foto-nosotros.jpg" | static_url | settings_image_url('small')}}" data-srcset='{{ "foto-nosotros.jpg" | static_url | settings_image_url('large') }} 480w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
                {% if settings.foto_nosotros_url != '' %}
                </a>
                {% endif %}
            </div>
        {% endif %}
        <div class="user-content {% if "foto-nosotros.jpg" | has_custom_image %} span6 {% else %} span8 offset2 {% endif %}">
            {{ page.content }}
        </div>
    </div>
</div>