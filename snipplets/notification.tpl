{# Cookie validation #}

{% if show_cookie_banner and not params.preview %}
    <div class="js-notification js-notification-cookie-banner notification notification-fixed-bottom notification-primary notification-above" style="display: none;">
        <div class="m-bottom-half p-bottom-quarter">{{ 'Al navegar por este sitio <strong>aceptás el uso de cookies</strong> para agilizar tu experiencia de compra.' | translate }}</div>
        <a href="#" class="js-notification-close js-acknowledge-cookies btn btn-default btn-small m-bottom-quarter">{{ "Entendido" | translate }}</a>
    </div>
{% endif %}

{# Order notification #}

{% if show_order_cancellation %}
    <div class="js-notification js-notification-order-cancellation notification notification-fixed-bottom notification-secondary" style="display:none;" data-url="{{ status_page_url }}">
        <div class="container">            
            <a href="{{ store.contact_url }}?order_cancellation=true"><strong class="text-primary">{{ "Botón de arrepentimiento" | translate }}</strong></a>
            <a class="js-notification-close js-notification-order-cancellation-close notification-close" href="#">
                {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-nav fa-lg"} %}
            </a>
        </div>
    </div>
{% endif %}

{% if order_notification and status_page_url %}
    <div data-url="{{ status_page_url }}" class="js-notification js-notification-status-page notification notification-secondary" style="display:none;">
        <div class="container">
            <a href="{{ status_page_url }}"><strong>{{ "Seguí acá" | translate }}</strong> {{ "tu última compra" | translate }}</a>
            <a class="js-notification-close js-notification-status-page-close notification-close" href="#">
            	{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill fa-lg"} %}
            </a>
        </div>
    </div>
{% endif %}
