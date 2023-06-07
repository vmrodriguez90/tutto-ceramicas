<div class="row-fluid">
    <div class="container">
        <div class="title-container" data-store="page-title">
            <div class="span8">
                <h1>{{ 'Orden {1}' | translate(order.number) }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="row-fluid visible-when-content-ready m-bottom m-top" data-store="account-order-detail-{{ order.id }}">
            <div class="span4 m-bottom-double">
                {% if log_entry %}
                    <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Estado actual del envío' | translate }}:</i></h6><span>{{ log_entry }}</span>
                {% endif %}
                <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Detalles' | translate }}</i></h6>
                <div class="m-bottom">
                    {% include "snipplets/svg/calendar-day.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                    {{'Fecha' | translate}}: <strong>{{ order.date | i18n_date('%d/%m/%Y') }}</strong>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                    {{'Estado' | translate}}: <strong>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</strong>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                    {{'Pago' | translate}}: <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong>
                </div>
                <div class="m-bottom">
                    {% include "snipplets/svg/usd-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                    {{'Medio de pago' | translate}}: <strong>{{ order.payment_name }}</strong>
                </div>
                {% if order.address %}
                    <div class="m-bottom">
                        {% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                        {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong>
                    </div>
                    <div class="m-bottom">
                        {% include "snipplets/svg/location-arrow.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                        <span class="d-table">
                            <strong class="d-block">{{ 'Dirección de envío' | translate }}:</strong>
                            {{ order.address | format_address }}
                        </span>
                    </div>
                {% endif %}
            </div>
            <div class="span8">
                <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Productos' | translate }}</i></h6>
                <div class="row-fluid hidden-phone">
                    <div class="span7">
                        <strong>{{ 'Producto' | translate }}</strong>
                    </div>
                    <div class="span5">
                        <div class="row-fluid text-center">
                            <div class="span4">
                                <strong>{{ 'Precio' | translate }}</strong>
                            </div>
                            <div class="span4">
                                <strong>{{ 'Cantidad' | translate }}</strong>
                            </div>
                            <div class="span4">
                                <strong>{{ 'Total' | translate }}</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="order-detail m-top">
                    {% for item in order.items %}
                        <div class="row-fluid m-bottom">
                            <div class="col-xs-4-custom span2 pull-left-xs">
                                <div class="card-img-square-container">
                                    {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                </div>
                            </div>
                            <div class="col-xs-8-custom span10 pull-left-xs p-left-xs">
                                <div class="row-fluid">
                                    <div class="span6 p-top-double p-top-half-xs">
                                        <strong>{{ item.name }}</strong>
                                    </div>
                                    <div class="span2 p-top-double p-none-xs text-center text-left-xs hidden-phone">
                                        {{ item.unit_price | money }}
                                    </div>
                                    <div class="span2 p-top-double p-none-xs text-center text-left-xs">
                                        x{{ item.quantity }}
                                    </div>
                                    <div class="span2 p-top-double p-none-xs text-center text-left-xs">
                                        {{ item.subtotal | money }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                    <div class="row-fluid">
                        <div class="span12 m-bottom">
                            <hr class="divider m-top-none">
                            {% if order.shipping or order.discount %}
                                <div class="h5 m-bottom-half row-fluid pull-left">
                                    <span class="pull-left">
                                        {{ 'Subtotal' | translate }}:
                                    </span>
                                    <span class="pull-right">
                                        {{ order.subtotal | money }}
                                    </span>
                                </div>
                            {% endif %}
                            {% if order.show_shipping_price %}
                                <div class="m-bottom-half row-fluid pull-left">
                                    <span class="pull-left">
                                        {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                                    </span>
                                    <span class="pull-right">
                                        {% if order.shipping == 0  %}
                                            {{ 'Gratis' | translate }}
                                        {% else %}
                                            {{ order.shipping | money }}
                                        {% endif %}
                                    </span>
                                </div>
                            {% else %}
                                <div class="m-bottom-half row-fluid pull-left">
                                    <span class="pull-left">
                                        {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                                    </span>
                                    <span class="pull-right">
                                        {{ 'A convenir' | translate }}
                                    </span>
                                </div>
                            {% endif %}
                            {% if order.discount %}
                                <div class="m-bottom-half row-fluid pull-left">
                                    <span class="pull-left">
                                        {{ 'Descuento ({1})' | translate(order.coupon) }}:
                                    </span>
                                    <span class="pull-right">
                                        - {{ order.discount | money }}
                                    </span>
                                </div>
                            {% endif %}
                            <h3 class="h2 m-bottom-half text-primary row-fluid pull-left">
                                <span class="pull-left">
                                    {{ 'Total' | translate }}:
                                </span>
                                <span class="pull-right">
                                    {{ order.total | money }}
                                </span>
                            </h3>
                            {% if order.pending %}
                                <a class="checkout-link btn btn-primary btn-inverse m-top-half full-width-xs pull-right" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                            {% endif %}
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
</div>
