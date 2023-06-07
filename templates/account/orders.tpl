<div class="row-fluid">
    <div class="container">
        <div class="title-container" data-store="page-title">
            <div class="span8">
                <h1>{{ "Mi cuenta" | translate }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="visible-when-content-ready">
            <div class="row-fluid">
                <div class="span4">
                    <div class="full-width-container m-bottom-double p-bottom">
                        <div class="full-width-container">
                            <h6 class="m-bottom text-uppercase weight-normal pull-left"><i>{{ 'Mis datos' | translate }}</i></h6>
                            {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link btn-link-primary pull-right') }}
                        </div>
                        <div class="m-bottom">
                            {% include "snipplets/svg/user.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                            <span class="d-table">{{customer.name}}</span>
                        </div>
                        <div class="m-bottom">
                            {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                            <span class="d-table">{{customer.email}}</span>
                        </div>
                        {% if customer.cpf_cnpj %}
                            <div class="m-bottom">
                                {% include "snipplets/svg/address-card.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %} {{ 'DNI' | translate }}: {{ customer.cpf_cnpj | format_cpf_cnpj }}
                            </div>
                        {% endif %}
                        {% if customer.phone %}
                            <div class="m-bottom">
                                {% include "snipplets/svg/phone.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %} 
                                <span class="d-table">{{ customer.phone }}</span>
                            </div>
                        {% endif %}
                    </div>
                    {% if customer.default_address %}
                        <div class="full-width-container m-bottom-double p-bottom">
                            <div class="full-width-container">
                                <h6 class="m-bottom text-uppercase weight-normal pull-left"><i>{{ 'Mis direcciones' | translate }}</i></h6>
                                {{ 'Editar' | translate | a_tag(store.customer_addresses_url, '', 'btn-link btn-link-primary pull-right') }}
                            </div>
                            <div>
                                {% include "snipplets/svg/location-arrow.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-right-half d-table pull-left"} %}
                                <span class="d-table"> <strong>{{ 'Principal' | translate }}</strong> {{ customer.default_address.name }} - {{ customer.default_address | format_address_short }}</span>
                            </div>
                        </div>
                    {% endif %}
                </div>
                <div class="span8">
                    <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Mis compras' | translate }}</i></h6>
                    <div data-store="account-orders">
                        {% if customer.orders %}
                            {% for order in customer.orders %}
                                {% if loop.index % 2 == 1 %}
                                    <div class="row m-none">
                                {% endif %}
                                    {% set add_checkout_link = order.pending %}
                                    {% set card_active = add_checkout_link ? true : false  %}
                                    <div class="span6">
                                        <div class="js-card-collapse box-container box-container-primary" data-store="account-order-item-{{ order.id }}">
                                            <div class="full-width-container">
                                                <div class="span6 col-xs-custom col-xs-6-custom">
                                                    <h6 class="text-uppercase {% if card_active %}text-primary{% endif %}">
                                                        <strong>{{'Orden' | translate}}:  <a {% if card_active %}class="text-primary"{% endif %} href="{{ store.customer_order_url(order) }}">#{{order.number}} </a></strong>
                                                    </h6>
                                                    <p>{{ order.date | i18n_date('%d/%m/%Y') }}</p>
                                                </div>
                                                <div class="span6 col-xs-custom col-xs-6-custom text-right p-relative">
                                                    <h6 class="text-uppercase weight-normal m-top-half m-right-double p-right-half">{{ order.total | money }}</h6>
                                                    <span class="js-card-collapse-toggle card-collapse-toggle {% if card_active %}active{% endif %}">
                                                        {% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
                                                    </span>
                                                </div> 
                                            </div>
                                            <div class="js-card-body full-width-container" {% if not card_active %}style="display: none;"{% endif %}>
                                                <div class="full-width-container m-top">
                                                    <div class="span8 col-xs-custom col-xs-8-custom p-right">
                                                        <p>
                                                            {{'Pago' | translate}}: <strong class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong>
                                                        </p>
                                                        <div class="divider m-top-quarter m-bottom-quarter"></div>
                                                        <p>
                                                            {{'Envío' | translate}}: <strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }} </strong>
                                                        </p>
                                                        <div class="divider m-top-quarter"></div>
                                                        <p class="m-bottom">
                                                            {{'Total' | translate}} <strong>{{ order.total | money }}</strong>
                                                        </p>
                                                        <a class="btn-link-primary text-primary text-uppercase" href="{{ store.customer_order_url(order) }}"> {{'Ver detalle' | translate}} </a>
                                                    </div>
                                                    <div class="span4 col-xs-custom col-xs-4-custom">
                                                        <div class="card-img-square-container">
                                                            {% for item in order.items %}
                                                            {% if loop.first %} 
                                                                {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                            {% endif %}
                                                            {% endfor %}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="box-container-footer">
                                                    {% if add_checkout_link %}
                                                        <a class="btn btn-primary btn-inverse btn-small btn-block" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                                    {% elseif order.order_status_url != null %}
                                                        <a class="btn btn-primary btn-inverse btn-small btn-block" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                                    {% endif %}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {% if loop.index % 2 == 0 or loop.last %}
                                    </div>
                                {% endif %}  
                            {% endfor %}
                        {% else %}
                            <div class="text-center text-left-xs m-bottom-double">
                                <div class="m-bottom-half-xs">
                                    {% include "snipplets/svg/cart.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-primary-fill"} %}
                                    <h6 class="weight-normal d-inline-block m-left-quarter">{{'¡Hacé tu primera compra!' | translate}}</h6>
                                </div>
                                {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn-link btn-link-primary') }}
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>