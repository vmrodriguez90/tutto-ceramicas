{% for item in menus[settings.footer_menu] %}
	<li class="wrap-list-xs">
        <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
	</li>
{% endfor %}
