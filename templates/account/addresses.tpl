<div class="row-fluid">
    <div class="container">
        <div class="title-container" data-store="page-title">
            <div class="span8">
                <h1>{{ "Mis direcciones" | translate }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>
        <div class="row-fluid visible-when-content-ready m-top">
            {% for address in customer.addresses %}
                {% if loop.first %}
                    {# User addresses listed - Main Address #}
                    <div class="span4 m-bottom">
                        <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Principal' | translate }}</i></h6>
                        <div class="row-fluid">
                {% elseif loop.index == 2 %}
                    {# User addresses listed - Other Addresses #}
                    <div class="span8">
                        <h6 class="m-bottom text-uppercase weight-normal"><i>{{ 'Otras direcciones' | translate }}</i></h6>
                        <div class="row-fluid">
                {% endif %}
                            <div class="span{% if loop.first %}12{% else %}4{% endif %} m-bottom">
                                <p class="m-bottom">{{ address | format_address }}</p>
                                {{ 'Editar' | translate | a_tag(store.customer_address_url(address), {class: 'btn-link btn-link-primary'}) }}
                                {% if loop.first %} 
                                    <a class="btn btn-primary btn-inverse m-top m-bottom full-width" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                                {% endif %}
                            </div>
                {% if loop.first or loop.last %}
                        </div>
                    </div>
                {% endif %}
            {% endfor %}
        </div>
    </div>
</div>
