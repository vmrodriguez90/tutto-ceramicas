{% for item in navigation %}
    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}" data-component="menu.item">
		{% if item.subitems %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
				<span class="desktop-nav-arrow pull-right">{% include "snipplets/svg/angle-right-regular.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-icon-nav"} %}</span>
			</a>
			<ul class="desktop-nav-list">
				{% snipplet "navigation/navigation.tpl" with navigation = item.subitems %}
			</ul>
		{% else %}
			<a href="{{ item.url | setting_url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
			</a>
		{% endif %}
	</li>
{% endfor %}