{% set selected_option = loop.first or cart.shipping_option == option.name %}
<div class="js-shipping-suboption shipping-suboption font-body {{suboptions.name}}">
    {% if suboptions.options %}

        {# Read only suboptions inside popup #}

        {% set modal_id_val = (suboptions.name | sanitize) ~ '-pickup-modal-' ~ random() %}

        <a href="#{{ modal_id_val }}" data-toggle="modal" class="js-trigger-modal-zindex-top btn-link btn-block">
            {% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter"} %}
            <span>{{ 'Ver direcciones' | translate }}</span>
        </a>

        <div id="{{ modal_id_val }}" class="js-modal-shipping-suboptions js-modal-xs-centered modal modal-centered-small modal-xs modal-xs-centered hide fade modal-zindex-top" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="js-close-modal-zindex-top modal-header" data-dismiss="modal" aria-hidden="true">
                <button type="button" class="btn-floating m-right-half m-top-quarter" >
                    {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                </button>
                <h3>{{ 'Puntos de retiro' | translate }}</h3>
            </div>
            <div class="modal-body">
                <ul class="list-unstyled">
                    {% for option in suboptions.options %}
                        <li class="text-capitalize m-bottom-half">{% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-text d-flex pull-left m-right-quarter"} %} <span class="d-flex">{{ option.name | lower }}</span></li>
                    {% endfor %}
                </ul>
                <div class="m-top"><span>{{ 'Cercanos al CP:'}}</span> <span class="text-primary font-weight-bold">{{cart.shipping_zipcode}}</span></div>
                <div class="m-top-quarter font-small">
                    {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "d-table pull-left svg-inline--fa svg-icon-text"} %}
                    <i class="align-middle d-table p-left-quarter">{{ "Vas a poder elegir estas opciones antes de finalizar tu compra" | translate }}</i>
                </div>
            </div>
        </div>

    {% else %}
        <input type="hidden" name="{{suboptions.name}}"/>
        <div>{{ suboptions.no_options_message | translate }}</div>
    {% endif %}
</div>