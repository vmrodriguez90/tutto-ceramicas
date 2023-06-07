<div class="modal-with-fixed-footer">
    <div class="modal-scrollable-area">
        <span class="js-modal-close btn-hamburger-close">
            {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa btn-hamburger-close-icon pull-right p-all-half"} %}
        </span>
        <ul class="list-items" data-store="navigation">
            {% snipplet "navigation/navigation-hamburger-list.tpl" %}
        </ul>
        {% if languages | length > 1 %}
            <div class="languages span12 clear pull-left p-left-quarter p-top-half p-right-double">
                {% for language in languages %}
                    {% set class = language.active ? "" : "opacity-50" %}
                    <a href="{{ language.url }}" class="{{ class }} pull-left p-all-half border-top-none-xs border-bottom-none-xs"><img class="lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ language.country | flag_url }}" alt="{{ language.name }}" /></a>
                {% endfor %}
            </div>
        {% endif %}
    </div>
    <div class="hamburger-panel-first-row">
        <div class="nav-accounts text-primary">
            <div class="nav-accounts-icon">
                {% include "snipplets/svg/user.tpl" with {fa_custom_class: "svg-search-icon nav-svg"} %}
            </div>
            <ul class="nav-accounts-list" data-store="account-links">
                {% if not customer %}
                    {% if 'mandatory' not in store.customer_accounts %}
                        <li class="nav-accounts-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'nav-accounts-link text-primary') }}</li>
                    {% endif %}
                    <li class="nav-accounts-item {% if store.customer_accounts == 'mandatory' %}m-top-quarter{% endif %}">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'nav-accounts-link text-primary') }}</li>
                {% else %}
                    <li class="nav-accounts-item nav-accounts-message text-foreground">
                        {{ "¡Hola, <span class='text-primary'>{1}</span>!" | t(customer.name) }}</strong>
                    </li>

                    <li class="nav-accounts-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'nav-accounts-link text-primary') }}</li>
                    <li class="nav-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'nav-accounts-link text-primary') }}</li>
                {% endif %}
            </ul>
        </div>

    </div>
</div>