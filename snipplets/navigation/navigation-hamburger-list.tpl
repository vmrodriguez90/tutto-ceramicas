{% for item in navigation %}
	{% if settings.tab_menu %}
		{% if not item.isRootCategory and not item.isHomePage %}
			{% if item.subitems %}
				<li class="item-with-subitems p-relative">
					<div class="js-hamburger-panel-toggle-accordion">
						<a class="js-toggle-page-accordion hamburger-panel-link p-right-double weight-normal" href="#">
							<span class="m-right-quarter">{{ item.name }}</span>
							<span class="hamburger-panel-arrow p-all-quarter p-absolute transition-soft">{% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg p-all-half hamburger-panel-arrow-icon"} %}</span> 
						</a>
					</div>
					<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
						{% if item.isCategory  %}
							<li class="item-with-subitems p-relative">
								<a class="hamburger-panel-link" href="{{ item.url }}">
									<strong>
										{% if item.isRootCategory %}
											{{ 'Ver todos los productos' | translate }}
										{% else %}
											{{ 'Ver todo en' | translate }} {{ item.name }}
										{% endif %}
									</strong>
								</a>
							</li>
						{% endif %}
						{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
					</ul>
				</li>
			{% else %}
				<li>
					<a class="hamburger-panel-link weight-normal" href="{{ item.url }}">{{ item.name }}</a>
				</li>
			{% endif %}
		{% endif %}
	{% else %}
		{% if item.subitems %}
			<li class="item-with-subitems p-relative">
				<div class="js-hamburger-panel-toggle-accordion">
					<a class="js-toggle-page-accordion hamburger-panel-link p-right-double weight-normal" href="#">
						<span class="m-right-quarter">{{ item.name }}</span>
						<span class="hamburger-panel-arrow p-all-quarter p-absolute transition-soft">{% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg p-all-half hamburger-panel-arrow-icon"} %}</span> 
					</a>
				 </div>
				<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
					{% if item.isCategory  %}
						<li class="item-with-subitems p-relative">
							<a class="hamburger-panel-link" href="{{ item.url }}">
								<strong>
									{% if item.isRootCategory %}
										{{ 'Ver todos los productos' | translate }}
									{% else %}
										{{ 'Ver todo en' | translate }} {{ item.name }}
									{% endif %}
								</strong>
							</a>
						</li>
					{% endif %}
					{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
				</ul>
			</li>
		{% else %}
			 <li>
				<a class="hamburger-panel-link weight-normal" href="{{ item.url }}">
					{{ item.name }}</a>
			 </li>
		{% endif %}
	{% endif %}
{% endfor %}
