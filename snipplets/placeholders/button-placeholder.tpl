<div class="js-addtocart js-addtocart-placeholder btn btn-primary full-width btn-transition m-bottom-half disabled {{ custom_class }}" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text">
            {% if quickshop_direct_add %}
                {{ 'comprar' | translate }}
            {% else %}
                {{ 'Agregar al carrito' | translate }}
            {% endif %}
        </span>
        <span class="js-addtocart-success transition-container btn-transition-success">
            <span class="m-left p-left">{{ '¡Listo!' | translate }}</span>
            <span class="pull-right m-right">
                {% include "snipplets/svg/check-square.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
            </span>
        </span>
        <div class="js-addtocart-adding transition-container btn-transition-progress">
            <span class="m-left {% if not quickshop %}p-left{% endif %}">{{ 'Agregando' | translate }}</span>
            <span class="pull-right m-right">
                {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-lg fa-spin m-left-half pull-right"} %}
            </span>
        </div>
    </div>
</div>