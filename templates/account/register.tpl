<div class="row-fluid">
    <div class="container">
        <div class="title-container p-bottom" data-store="page-title">
            <div class="span8">
                <h1>{{ "Crear cuenta" | translate }}</h1>
                <p class="m-bottom p-left-xs p-right-xs"> {{ 'Comprá más rápido y llevá el control de tus pedidos, ¡en un solo lugar!'| translate }} </p>
            </div>
        <div class="span4">
                {% snipplet "breadcrumbs.tpl" %}
            </div>
        </div>

        {# Page preloader #}
        <div class="page-loading-icon-container full-width hidden-when-content-ready">
            <div class="page-loading-icon page-loading-icon opacity-80 rotate">
                {% include "snipplets/svg/spinner.tpl" %}
            </div>
        </div>

        {# Account validation #}
        {% if account_validation == 'pending' %}
            <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
                <div class="span6 offset3">
                    <div class="js-account-validation-pending alert alert-primary">
                        {% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill fa-lg m-top-half"} %}
                        <h5 class="m-top m-bottom">{{ "¡Estás a un paso de crear tu cuenta!" | translate }}</h5>
                        <p class="m-bottom font-small">{{ "Te enviamos un link a <strong>{1}</strong> para que valides tu email." | t(customer_email) }} </p>
                    </div>
                    <div class="text-center m-bottom">
                        <p>{{ "¿Todavía no lo recibiste?" | translate }} <span class="js-resend-validation-link btn-link text-primary">{{ "Enviar link de nuevo" | translate }}</span></p>
                    </div>
                    <div class="js-resend-validation-success alert alert-success" style="display:none">
                        <p>{{ "¡El link fue enviado correctamente!" | translate }}</p>
                    </div>
                    <div class="js-resend-validation-error alert alert-danger" style="display:none">
                        <p>{{ "No pudimos enviar el email, intentalo de nuevo en unos minutos." | translate }}</p>
                    </div>
                </div>
            </div>

        {% else %}

            <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
                <form id="login-form" action="" method="post" class="span6 offset3 contact_form" data-store="account-register">
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

                    {# Name input #}

                    {% endif %}
                    <div class="form-group">
                        <label for="name" class="form-label">{{ 'Nombre' | translate }}</label>
                        <input type="text" name="name" id="name" value="{{ result.name }}" class="form-control {% if result.errors.name %} input-error {% endif %}" placeholder="{{ 'ej.: María Perez' | translate }}" />
                    </div>
                    {% if result.errors.name %}
                        <div class="alert alert-danger">{{ 'Usamos tu nombre para identificar tus pedidos.' | translate }}</div>
                    {% endif %}

                    {# Email input #}

                    <div class="form-group">
                        <label for="email" class="form-label">{{ 'Email' | translate }}</label>
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" class="form-control {% if result.errors.email == 'exists' or result.errors.email %} input-error {% endif %}" placeholder="{{ 'ej.: tunombre@email.com' | translate }}"/>
                    </div>
                    {% if result.errors.email == 'exists' %}
                        <div class="alert alert-danger">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro o iniciá sesión.' | translate }}</div>
                    {% elseif result.errors.email %}
                        <div class="alert alert-danger">{{ 'Necesitamos un email válido para crear tu cuenta.' | translate }}</div>
                    {% endif %}

                    {# Phone input #}

                     <div class="form-group">
                        <label for="phone" class="form-label">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                        <input type="text" name="phone" id="phone" value="{{ result.phone }}" class="form-control" placeholder="{{ 'ej.: 1123445567' | translate }}"/>
                    </div>

                    {# Password input #}

                    <div class="form-group p-relative">
                        <label for="password" class="form-label">{{ 'Contraseña' | translate }}</label>
                        <input type="password" name="password" id="password" autocomplete="off" class="js-password-input form-control {% if result.errors.password == 'required' %} input-error {% endif %}"/>
                        <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-lock">
                            <span class="js-lock-open" style="display: none;">
                                {% include "snipplets/svg/lock-open.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                            </span>
                            <span class="js-lock-closed">
                                {% include "snipplets/svg/lock-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                            </span>
                        </a>
                    </div>
                     {% if result.errors.password == 'required' %}
                        <div class="alert alert-danger">{{ 'Necesitamos una contraseña para registrarte.' | translate }}</div>
                    {% endif %}

                    {# Confirm password input #}

                    <div class="form-group p-relative">
                        <label for="password_confirmation" class="form-label">{{ 'Confirmar contraseña' | translate }}</label>
                        <input type="password" name="password_confirmation" id="password_confirmation" autocomplete="off" class="js-password-input form-control {% if result.errors.password == 'confirmation' %} input-error {% endif %}"/>
                        <a aria-label="{{ 'Ver contraseña' | translate }}" class="js-password-view btn form-toggle-lock">
                            <span class="js-lock-open" style="display: none;">
                                {% include "snipplets/svg/lock-open.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                            </span>
                            <span class="js-lock-closed">
                                {% include "snipplets/svg/lock-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                            </span>
                        </a>
                    </div>
                    {% if result.errors.password == 'confirmation' %}
                        <div class="alert alert-danger">{{ 'Las contraseñas no coinciden.' | translate }}</div>
                    {% endif %}

                    {# Google reCAPTCHA #}

                    <div class="g-recaptcha" data-sitekey="{{recaptchaSiteKey}}" data-callback="recaptchaCallback"></div>
                    <input class="js-recaptcha-button btn btn-primary btn-inverse full-width" type="submit" value="{{ 'Crear cuenta' | translate }}" disabled/>

                    <p class="text-center m-top"> {{ "¿Ya tenés una cuenta?" | translate }} {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'text-primary') }}</p>

                </form>
            </div>
        {% endif %}
    </div>
</div>