<div class="row-fluid">
    <div class="container">
        <div class="title-container" data-store="page-title">
            <div class="span8">
                <h1>{{ "Iniciar sesión" | translate }}</h1>
            </div>
            <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>

        {# Account validation #}
        
        <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
            <div class="span6 offset3">
                {% if account_validation == 'success' %}
                    <div class="js-account-validation-success alert alert-success">
                        <p>{{ "¡Tu cuenta fue creada con éxito!" | translate }}</p>
                    </div>
                {% elseif account_validation == 'expired' %}
                    <div class="js-account-validation-expired alert alert-danger m-bottom-half">
                        <p>{{ "Tu link de validación expiró." | translate }}</p>
                    </div>
                    <div class="text-center m-bottom-half">
                        <span class="js-resend-validation-link btn-link text-primary">{{ "Enviar link de nuevo" | translate }}</span>
                    </div>
                {% elseif account_validation == 'pending' %}
                    <div class="js-account-validation-pending alert alert-danger m-bottom-half m-top-quarter">
                        <p>{{ "Validá tu email usando el link que te enviamos a <strong>{1}</strong> cuando creaste tu cuenta." | t(customer_email) }}</p>
                    </div>
                    <div class="text-center m-bottom-half">
                        <p>{{ "¿No lo encontraste?" | translate }} <span class="js-resend-validation-link btn-link text-primary">{{ "Enviar link de nuevo" | translate }}</span></p>
                    </div>
                {% endif %}
                <div class="js-resend-validation-success alert alert-success m-bottom-quarter" style="display:none">
                    <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
                </div>
                <div class="js-resend-validation-error alert alert-danger m-bottom-quarter" style="display:none">
                    <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
                </div>
                <div class="js-too-many-attempts alert alert-danger m-bottom-quarter" style="display:none">
                    <p>
                        {{ "Superaste la cantidad de intentos permitidos. <br> Volvé a probar en"| translate }}
                        <span class="js-too-many-attempts-countdown"></span>
                    </p>
                </div>
            </div>
        </div>

        {# Page preloader #}

        <div class="pull-left full-width hidden-when-content-ready">
            <div class="page-loading-icon page-loading-icon opacity-80 rotate">
                {% include "snipplets/svg/spinner.tpl" %}
            </div>
        </div>
        <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
            <form id="login-form" action="" method="post" class="span6 offset3 contact_form" data-store="account-login">
                {% if not result.facebook and result.invalid %}
                    <div class="alert alert-danger">{{ 'Estos datos no son correctos. ¿Chequeaste que estén bien escritos?' | translate }}</div>
                {% elseif result.facebook and result.invalid %}
                    <div class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                {% endif %}

                {# FB login #}

                {% if store_fb_app_id %}
                    <div class="row-fluid m-bottom">
                        <a class="btn btn-primary full-width facebook p-relative" onclick="loginFacebook();" >
                            {% include "snipplets/svg/facebook.tpl" %}
                            {{ 'Facebook login' | translate }}
                        </a>
                    </div>
                    <div class="row-fluid text-center">
                        <span class="badge">{{ 'o' | translate }}</span>
                        <hr class="divider-with-circle"></hr>
                    </div>
                {% endif %}

            {# Email input #}

                <div class="form-group">
                    <label class="form-label" for="email">{{ 'Email' | translate }}</label>
                    <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" class="form-control {% if result.invalid %} input-error {% endif %}" required />
                </div>

            {# Password input #}

                <div class="form-group p-relative">
                    <label class="form-label" for="password">{{ 'Contraseña' | translate }}</label>
                    <input type="password" name="password" autocomplete="off" class="js-password-input form-control {% if result.invalid %} input-error{% endif %}" required />
                    <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-lock">
                        <span class="js-lock-open" style="display: none;">
                            {% include "snipplets/svg/lock-open.tpl" with {fa_custom_class: "svg-inline--fa svg-icon-primary"} %}
                        </span>
                        <span class="js-lock-closed">
                            {% include "snipplets/svg/lock-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                        </span>
                    </a>
                    <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
                </div>

                <div class="row-fluid">
                    <input class="btn btn-primary btn-inverse full-width" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                    {% if 'mandatory' not in store.customer_accounts %}
                        <p class="text-center m-top"> {{ "¿No tenés cuenta aún?" | translate }} {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'text-primary') }}</p>
                    {% endif %}
                </div>
            </form>
        </div>
    </div>
</div>
