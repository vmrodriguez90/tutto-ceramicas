<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
<head>
    <link rel="preconnect" href="{{ store_resource_hints }}" />
    <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}

    {# Preload of first image of Slider and first Category Banners to improve LCP #}
    {% if template == 'home'%}
        {% snipplet 'preload-images.tpl' %}
    {% endif %}

    {# OG tags to control how the page appears when shared on social networks. See http://ogp.me/ #}
    {% snipplet "metas/general-og.tpl" %}

    {# Twitter tags to control how the page appears when shared on Twitter. See https://dev.twitter.com/cards/markup #}
    {% if template == 'product' %}
        {# Twitter #}
        {% snipplet "metas/twitter-product.tpl" %}
        {# Facebook #}
        {% snipplet "metas/facebook-product-og.tpl" %}
    {% elseif template == 'category' %}
        {# Facebook #}
        {% snipplet "metas/facebook-category-og.tpl" %}
    {% endif %}

    {# Critical CSS to improve the percieved performance on first load #}

    <style>
        {# Font families #}

        {% if params.preview %}

            {# If page is loaded from customization page on the admin, load all fonts #}

            @import url('https://fonts.googleapis.com/css?family=Lato:700,400italic,700italic|Poppins:400,400i,600,600i|Open+Sans:400,300,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Montserrat:400,700|Source+Sans+Pro:400,300,700|Droid+Sans:400,700|Roboto+Condensed:400italic,700italic,300,400,700|Istok+Web:400,700,400italic,700italic|Arvo:400,700,400italic,700italic|Paytone+One|Raleway:700|Lato:700|Ubuntu:700|Roboto+Slab:700&display=swap');

        {% else %}

            {# If page is NOT loaded from customization only load saved fonts #}

            {# Get only the saved fonts on settings #}

            @import url('{{ [settings.font_logo, settings.font_rest, settings.font_navigation, settings.font_headings, settings.font_headingsprods, settings.font_buttons] | google_fonts_url('300, 400, 700') | raw }}');

        {% endif %}

        {% snipplet 'css/critical-css.tpl' %}
    </style>

    {# Aynsc CSS for the non-critical stylesheets and Font Awesome CSS #}

    {% snipplet 'js/load-css-async.tpl' %}

    {# Colors and fonts used from settings.txt and defined on theme customization #}

    {{ 'css/main-color.scss.tpl' | static_url | static_inline }}

    {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

    <style>
        {{ settings.css_code | raw }}
    </style>

    {# Defines if async JS will be used by using script_tag(true) #}

    {% set async_js = true %}

    {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

    {% set nojquery = true %}

    {# Jquery async by adding script_tag(true) #}

    {% if load_jquery %}

        {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag(true) }}

    {% endif %}

    {# Loads private Tienda Nube JS #}

    {% head_content %}

    {# Structured data to provide information for Google about the page content #}

    {% include 'snipplets/structured_data/webpage-structured-data.tpl' %}

    {# Pagination metatags #}
    {% if pages.previous %}
        <link rel="prev" href="{{ pages.previous }}" />
    {% endif %}
    {% if pages.next %}
        <link rel="next" href="{{ pages.next }}" />
    {% endif %}

</head>

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

{# Social JS for Facebook comments on product page #}

{% if template == 'product' %}

    {# Facebook comment box JS #}

    {% if settings.show_product_fb_comment_box %}
        {{ fb_js }}
    {% endif %}

    {# Pinterest share button JS #}

    {{ pin_js }}
{% endif %}

{% if template == 'account.login' or template == 'account.register' %}

{{ fb_js }}

<script>

    {# Facbook login #}

    function loginFacebook() {
        LS.ready.then(function(){
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        jQueryNuvem('#login-form').prepend(
                                "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                    }
                } else {
                    jQueryNuvem('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
                }
            });
        });
    }
</script>
{% endif %}
{{back_to_admin}}

{% set theme_version = settings.version_theme %}

    {# Hamburger panel #}
    <nav id="nav-hamburger" class="js-modal new-modal modal-left hamburger-panel" style="display: none;">
        {% snipplet "navigation/navigation-hamburger-panel.tpl" %}
    </nav>
    <div class="js-modal-overlay site-overlay visible-phone"></div>

    {% snipplet "header/search-mobile.tpl" %}

    {% snipplet "header/head-top.tpl" %}

    {% if settings.slim_menu %}
        {% snipplet "header/head-slim.tpl" %}
    {% endif %}

    <div class="js-main-content js-body-position main-content {% if theme_version == 'full' %}content-full{% endif %}">
        {# Shortcut to the Status Page #}
        <div class="visible-phone">
            {% include 'snipplets/notification.tpl' with {order_notification: true} %}
        </div>

        {# Show cookie validation message #}

        {% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

        {# Add notification for order cancellation #}
        {% if store.country == 'AR' and template == 'home' and status_page_url %}
            {% include "snipplets/notification.tpl" with {show_order_cancellation: true} %}
        {% endif %}

        {% snipplet "header/head.tpl" %}

        {% if settings.ad_bar and settings.ad_text %}
            {% snipplet "header/advertising.tpl" %}
        {% endif %}

        {% template_content %}

        <div class="js-hide-footer-while-scrolling banner-services-footer">
            {% if settings.banner_services %}
                {% include 'snipplets/banner-services/banner-services.tpl' with {'footer': true} %}
            {% endif %}
        </div>
        {% if store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
            <div class="js-hide-footer-while-scrolling visible-when-content-ready footer-social text-center p-top p-bottom">
                <div class="row-fluid m-top-half m-bottom-half">
                    <div class="container">
                        {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
                            {% set sn_url = attribute(store,sn) %}
                            {% if sn_url %}
                                <a class="social-link {{ sn }}" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
                                    {% if sn == "facebook" %}
                                        {% set social_network = sn ~ '-f' %}
                                    {% else %}
                                        {% set social_network = sn %}
                                    {% endif %}

                                    {% include "snipplets/svg/" ~ social_network ~ ".tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                </a>
                            {% endif %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        {% elseif show_help  %}
            {% snipplet "defaults/show_help_social.tpl" %}
        {% endif %}
        <div data-store="footer">
            <div class="js-hide-footer-while-scrolling footer text-center-xs">
                <div class="row-fluid visible-when-content-ready">
                    <div class="container">
                        {% set newsletter_span = store.phone or store.address ? 6 : 9 %}
                        <div class="span{{ newsletter_span }} m-bottom">
                            <h6 class="footer-title">{{ "Newsletter" | translate }}</h6>
                            {% if settings.news_txt %}
                                <p>{{ settings.news_txt }}</p>
                            {% endif %}
                            {% snipplet "newsletter.tpl" %}
                        </div>
                        <div class="span3 m-bottom">
                            <h6 class="footer-title">{{ "Más información" | translate }}</h6>
                            <ul class="footer-nav">
                                {% snipplet "navigation/navigation-foot.tpl" %}
                            </ul>
                        </div>
                        {% if store.phone or store.address or store.blog %}
                            <div class="span3 m-bottom">
                                <h6 class="footer-title">{{ "Datos de contacto" | translate }}</h6>
                                <ul class="footer-nav">
                                    {% if store.phone %}
                                        <li class="footer-nav-item"><a class="footer-nav-item-link" href="tel:{{ store.phone }}">{{ store.phone }}</a></li>
                                    {% endif %}
                                    {% if store.address %}
                                        <li class="footer-nav-item"><span class="footer-nav-item-link">{{ store.address }}</span></li>
                                    {% endif %}
                                    {% if store.blog %}
                                         <li class="footer-nav-item"><a class="footer-nav-item-link" target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                                    {% endif %}
                                    {% if store.email %}
                                        <li class="footer-nav-item"><a class="footer-nav-item-link" href="mailto:{{ store.email }}">{{ store.email }}</a></li>
                                    {% endif %}
                                </ul>
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>
            {% set has_shipping_payment_logos = settings.payments or settings.shipping %}
            {% if has_shipping_payment_logos %}
                <div class="js-hide-footer-while-scrolling footer-ship-pay p-top p-bottom">
                    <div class="row-fluid visible-when-content-ready">
                        <div class="container">
                            <div class="span8 footer-payments text-left text-center-xs">
                                {% for payment in settings.payments %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="footer-payship-img card-img lazyload js-lazy-loading" alt="{{ payment }}" width="48" height="30"/>
                                {% endfor %}
                            </div>
                            <div class="span4 footer-shipping m-top-xs text-right text-center-xs">
                                {% for shipping in settings.shipping %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ shipping | shipping_logo }}" class="footer-payship-img card-img lazyload js-lazy-loading" alt="{{ shipping }}" width="48" height="30"/>
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            {% elseif not (has_shipping_payment_logos or has_products) %}
                {# This is a snipplet to show the user the payment and send methods the first time they visit the store #}
                {% snipplet "defaults/show_help_footer.tpl" %}
            {% endif %}
            <div class="js-hide-footer-while-scrolling footer-legal">
                <div class="row-fluid visible-when-content-ready">
                    <div class="container">
                        <div class="span6 text-left text-center-xs">
                            <div class="powered-by">
                                {#
                                La leyenda que aparece debajo de esta linea de código debe mantenerse
                                con las mismas palabras y con su apropiado link a Tienda Nube;
                                como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                                Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                                tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                                Os créditos que aparecem debaixo da linha de código deverá ser mantida com as mesmas
                                palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                                http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                                e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                                manter visivél e com um link funcionando.
                                #}
                                {{ new_powered_by_link }}
                            </div>
                        </div>
                        <div class="span6 text-right text-center-xs">
                            <div class="copyright">
                                <span>{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</span>
                                {% if store.country == 'AR' %} 
                                    <div class="claim-link">
                                        {{ "Defensa de las y los consumidores. Para reclamos" | translate }}
                                        <a class="weight-strong" href="https://www.argentina.gob.ar/produccion/defensadelconsumidor/formulario" target="_blank"> {{ "ingrese aquí" | translate}}</a> 
                                    </div>
                                {% endif %} 
                                {% if not show_help %}
                                    {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                                        <div class="seals row">
                                            {% if store.afip %}
                                                <div class="afip">
                                                    {{ store.afip | raw }}
                                                </div>
                                            {% endif %}
                                            {% if ebit %}
                                                <div class="ebit">
                                                    {{ ebit }}
                                                </div>
                                            {% endif %}
                                            {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
                                                <div class="custom-seals-container">
                                                    {% if "seal_img.jpg" | has_custom_image %}
                                                        <div class="custom-seal custom-seal-img">
                                                            {% if settings.seal_url != '' %}
                                                                <a href="{{ settings.seal_url | setting_url }}" target="_blank">
                                                            {% endif %}
                                                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="lazyload js-lazy-loading" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
                                                            {% if settings.seal_url != '' %}
                                                                </a>
                                                            {% endif %}
                                                        </div>
                                                    {% endif %}
                                                    {% if settings.custom_seal_code %}
                                                        <div class="custom-seal custom-seal-code">
                                                            {{ settings.custom_seal_code | raw }}
                                                        </div>
                                                    {% endif %}
                                                </div>
                                            {% endif %}
                                        </div>
                                    {% endif %}
                                {% else %}
                                    <div class="seals row" {% if store.country == 'BR' and not (store.afip or ebit) %}data-tooltip="Esses são selos de exemplo"{% endif %}>
                                        {% if store.country == 'AR' %}
                                            <div class="afip">
                                                <img src="https://www.afip.gob.ar/images/f960/DATAWEB.jpg" border="0">
                                            </div>
                                        {% elseif store.country == 'BR' %}
                                            <div class="ebit">
                                                {{ "images/ebit-exemplo.png" | static_url | img_tag }}
                                            </div>
                                        {% endif %}
                                    </div>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                    <div class="container text-center hidden-phone">
                        <div class="js-go-to-top btn btn-secondary btn-inverse btn-small m-top m-bottom-half">
                            {{ "Subir" | translate }} ^
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# AJAX Cart Panel #}
    {% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
        {% snipplet "cart-panel-ajax.tpl" %}
    {% endif %}

    {# Whatsapp chat button #}
    {% if store.whatsapp %}
        <a href="{{ store.whatsapp }}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp btn-floating fixed-bottom visible-when-content-ready" aria-label="{{ "Comunicate por WhatsApp" | translate }} {{ store.name }}">
            {% include "snipplets/svg/whatsapp.tpl" %}
        </a>
    {% endif %}


{# Javascript used in the store #}

<script>
    LS.ready.then(function(){

        {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

        {% include "static/js/external-no-dependencies.js.tpl" %}

        {# Libraries that requires Jquery to work #}

        {% snipplet "js/external.js.tpl"  %}

        {# Specific store JS functions: product variants, cart, shipping, etc #}

        {% if store.useStoreJsV2() %}
            {% include "static/js/store-v2.js.tpl" %}
        {% else %}
            {% include "static/js/store.js.tpl" %}
        {% endif %}
    });
</script>

{# Google reCAPTCHA on register page #}
{% if template == 'account.register' %}
    {% if not store.hasContactFormsRecaptcha() %}
        {{ '//www.google.com/recaptcha/api.js' | script_tag(true) }}
    {% endif %}
    <script type="text/javascript">
        var recaptchaCallback = function() {
            jQueryNuvem('.js-recaptcha-button').prop('disabled', false);
        };
    </script>
{% endif %}

{# Google survey JS for Tiendanube/Nuvemshop Survey #}

{% include "static/js/google-survey.js.tpl" %}

{# Store external codes added from admin #}

{% if store.assorted_js %}
<script>
    LS.ready.then(function() {
        var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
        jQueryNuvem('body').append(trackingCode);
    });
</script>
{% endif %}

</body>
</html>
