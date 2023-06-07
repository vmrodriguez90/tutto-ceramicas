<div id="header-slim" class="head-top-fixed container hidden-phone visible-when-content-ready">
    <div class="row-fluid display-when-content-ready">
        <div class="container">
            <div class="span4">
                <div class="logo">
                    {% if "slim-logo.jpg" | has_custom_image %}
                        {{ "slim-logo.jpg" | static_url | img_tag(store.name, {class: 'logo-img logo-fixed'}) | a_tag(store.url) }}
                    {% elseif has_logo %}
                        {% set logo_dimensions = store.logo_dimensions() %}
                        {% set width = logo_dimensions ? logo_dimensions.width : null %}
                        {% set height = logo_dimensions ? logo_dimensions.height : null %}
                        {{ store.logo('large') | img_tag(store.name, {class: 'logo-img logo-fixed', width: width, height: height}) | a_tag(store.url) }}
                    {% else %}
                        <a class="logo-text h4"  href="{{ store.url }}">{{ store.name }}</a>
                    {% endif %}
                </div>
            </div>
            <div class="span8">
                <ul class="js-desktop-nav desktop-nav text-right">
                    {% snipplet "navigation/navigation.tpl" %}
                </ul>
            </div>
        </div>
    </div>
</div>