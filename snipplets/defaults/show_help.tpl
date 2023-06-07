{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<div class="row-fluid">
	<div class="row-fluid m-top">
		<div class="container p-relative m-bottom">
			<h6 class="subtitle m-none">{{"Productos de ejemplo" | translate}}</h6>
			<div class="js-swiper-primary-products grid-row overflow-none m-top-half-xs">
				<div class="swiper-wrapper swiper-wrapper-md">
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									<div class="labels-floating">
										<div class="pull-right">
											<div class="label-circle label-primary clear-both m-bottom-quarter">
												<span class="label-text">
													<div>33%</div>
													<div>OFF</div>
												</span>
											</div>
										</div>
									</div>
									{% include "snipplets/svg/help-product-2.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"100000" | money }}</span>
										<span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
											<span id="compare_price_display" >{{"150000" | money }}</span>
										</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									<div class="labels-floating">
										<div class="pull-right">
											<div class="label-circle label-primary clear-both">
												<span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
											</div>
										</div>
									</div>
									{% include "snipplets/svg/help-product-1.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"44200" | money }}</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									<div class="labels-floating">
										<div class="pull-right">
											<div class="label-circle label-primary clear-both m-bottom-quarter">
												<span class="label-text">
													<div>23%</div>
													<div>OFF</div>
												</span>
											</div>
										</div>
									</div>
									{% include "snipplets/svg/help-product-6.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"10200" | money }}</span>
										<span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
											<span id="compare_price_display" >{{"13200" | money }}</span>
										</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									<div class="labels-floating">
										<div class="label-circle label-secondary label-circle-big">
											<span class="label-text">{{ "Sin stock" | translate }}</span>
										</div>
									</div>
									{% include "snipplets/svg/help-product-3.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"44200" | money }}</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									{% include "snipplets/svg/help-product-4.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"11200" | money }}</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
					<div class="swiper-slide products-slider-item item-mobile-container">
						<div class="item full-width pull-left">
							<a href="/product/example" title="{{ product.name }}" class="item-link">
								<div class="item-image-container">
									{% include "snipplets/svg/help-product-6.tpl" %}
								</div>
								<div class="item-info-container m-top-half m-bottom-half">
									<h6 class="item-name weight-normal font-body m-bottom-quarter">
										{{ "Producto de ejemplo" | translate }}
									</h6>
									<div class="item-price-container">
										<span class="item-price weight-strong text-primary" id="price_display">{{"13200" | money }}</span>
									</div>
								</div>
							</a>
							<div class="text-uppercase font-small-extra m-top-quarter">
								<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="js-swiper-primary-products-prev swiper-button-top-right swiper-button-prev hidden-phone">{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
			<div class="js-swiper-primary-products-next swiper-button-top-right swiper-button-next hidden-phone">{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	LS.ready.then(function() {
		DOMContentLoaded.addEventOrExecute(() => {
			if (window.innerWidth > 768) {

		        var featuredSwiper = new Swiper ('.js-swiper-primary-products', {
		            lazy: true,
		            spaceBetween: 30,
		            slidesPerView: 4.5,
		            slidesPerGroup: 4.5,
		            threshold: 5,
		            watchOverflow: true,
		            navigation: {
		                nextEl: '.js-swiper-primary-products-next',
		                prevEl: '.js-swiper-primary-products-prev',
		            },
		        });
		    }
	    });
    });
</script>