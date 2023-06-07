<div class="service-item-container swiper-slide span{{ 12 / num_banners_services }} {% if banner_services_icon != 'none' %}{% if num_banners_services > 1 and not loop.last %} border-right border-none-xs {% endif %}{% endif %} {% if num_banners_services > 1 %} p-bottom-xs {% endif %}">
    <div class="js-service-item service-item">
        {% if banner_services_url %}
            <a href="{{ banner_services_url | setting_url }}" title="{{ banner_services_title }}" aria-label="{{ banner_services_title }}">
        {% endif %}
        {% if banner_services_icon != 'none' %}
        <div class="span3">
            {% if banner_services_icon == 'shipping' %}
                {% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'card' %}
                {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'security' %}
                {% include "snipplets/svg/lock-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-w-14 fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'returns' %}
                {% include "snipplets/svg/sync-alt-solid.tpl" %}
            {% elseif banner_services_icon == 'whatsapp' %}
                {% include "snipplets/svg/whatsapp-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon service-icon-big"} %}
            {% elseif banner_services_icon == 'promotions' %}
                {% include "snipplets/svg/tag-solid.tpl" %}
            {% elseif banner_services_icon == 'hand' %}
                {% include "snipplets/svg/clean-hands.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'home' %}
                {% include "snipplets/svg/stay-home.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'office' %}
                {% include "snipplets/svg/home-office.tpl" with {fa_custom_class: "svg-inline--fa fa-2x service-icon"} %}
            {% elseif banner_services_icon == 'cash' %}
                {% include "snipplets/svg/dollar-sign-solid.tpl" %}
            {% endif %}
        </div>
        {% endif %}
        <div class="{% if banner_services_icon == 'none' %}span12 text-center{% else %}span9{% endif %} service-text">
            <h6 class="service-title font-body-xs">{{ banner_services_title }}</h6>
            <p>{{ banner_services_description }}</p>
        </div>
        {% if banner_services_url %}
            </a>
        {% endif %}
    </div>
</div>
