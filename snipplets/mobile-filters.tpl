<div class="js-fullscreen-modal js-mobile-filters-panel mobile-filters modal-xs modal-xs-right modal-xs-right-out visible-phone">
	<div class="modal-xs-dialog">
	    <a class="js-toggle-mobile-filters js-fullscreen-modal-close modal-xs-header" href="#">
		 	<span class="modal-xs-header-icon modal-xs-right-header-icon">
	            {% include "snipplets/svg/arrow-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
	        </span>
	        <span class="modal-xs-header-text modal-xs-right-header-text">{{ 'Filtrar por:' | translate }}</span>
	    </a>
	    <div class="modal-content">
		    <div class="modal-xs-body">
		    	{% if filter_categories is not empty %}
		    		{% include "snipplets/categories.tpl" with {'mobile': true} %}
		    	{% endif %}
		    	{% if product_filters is not empty %}
		        	{% include "snipplets/filters.tpl" with {'filters_mobile': true} %}
		        {% endif %}
		    </div>
	    </div>
	</div>
</div>
<div class="js-filters-overlay filters-overlay" style="display: none;">
	<div class="filters-updating-message">
		<h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
		<h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
	</div>
</div>