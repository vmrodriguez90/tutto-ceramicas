{# Mobile home slider placeholder: to be hidden after content loaded #}
{% if settings.slider and settings.slider is not empty %}
    <div class="js-home-slider-placeholder mobile-placeholder placeholder-container">
        <div class="placeholder-figures-container">
            <div class="placeholder-icon">{% include "snipplets/svg/images.tpl" %}</div>
            <div class="placeholder-pager">
                {% for slide in settings.slider %}
                    <span class="placeholder-page d-inline-block {% if loop.first %}active {% endif %}"></span>
                {% endfor %}
            </div>
        </div>
        <div class="placeholder-shine">
        </div>
    </div>
    <div class="js-slider-desktop-placeholder slider-desktop-placeholder">
    </div>
{% endif %}