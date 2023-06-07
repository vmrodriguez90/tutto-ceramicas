{#/*============================================================================
	#Specific store JS functions: product variants, cart, shipping, etc
==============================================================================*/#}

{#/*============================================================================
  
  Table of Contents

	#Lazy load
	#Accordions
    #Cards
	#Modals
	#Notifications
	#Header and nav
		// Mobile navigation tabs and search
		// Search suggestions
	#Home page
		// Newsletter popup
		// Home slider
		// Banner services slider
		// Products slider
        // Youtube or Vimeo video embed
	#Product grid
		// Sort by
		// Filters
		// Fixed category controls
		// Infinite scroll
		// Mobile pagination
		// Categories sidebar
	#Product detail functions
		// Installments
		// Change Variant
		// Product labels on variant change
		// Color and size variations
		// Product mobile variants
		// Quickshop
		// Pinterest sharing
		// Product slider
		// Product thumbs
		// Mobile zoom
		// Submit to contact
	#Cart
		// Cart quantitiy changes
		// Empty cart alert
		// Add to cart
		// Cart toggle
		// Go to checkout
	#Shipping calculator
		// Select and save shipping function
		// Toggle branches link
		// Shipping and branch click
		// Select shipping first option on results
		// Calculate shipping by submit
		// Calculate shipping function
		// Toggle more shipping options
		// Calculate shipping on page load
		// Calculate product detail shipping on page load
		// Change CP
		// Shipping provinces
		// Change store country
    #Forms
    #Footer

==============================================================================*/#}

// Move to our_content
window.urls = {
    "shippingUrl": "{{ store.shipping_calculator_url | escape('js') }}"
}

{#/*============================================================================
  #Lazy load
==============================================================================*/ #}

document.addEventListener('lazybeforeunveil', function(e){
    if ((e.target.parentElement) && (e.target.nextElementSibling)) {
        var parent = e.target.parentElement;
        var sibling = e.target.nextElementSibling;
        if (sibling.classList.contains('js-lazy-loading-preloader')) {
            sibling.style.display = 'none';
            parent.style.display = 'block';
        }
    }
});

LS.ready.then(function() {
	$(document).ready(function(){

		{#/*============================================================================
			#Accordions
		==============================================================================*/ #}

        $(document).on("click", ".js-accordion-toggle", function(e) {
            e.preventDefault();
            if($(this).hasClass("js-accordion-show-only")){
                $(this).hide();
            }else{
                $(this).find(".js-accordion-toggle-inactive").toggle();
                $(this).find(".js-accordion-toggle-active").toggle();
            }
            $(this).prev(".js-accordion-container").slideToggle();
        });

        {#/*============================================================================
          #Cards
        ==============================================================================*/ #}
        
        $(document).on("click", ".js-card-collapse-toggle", function(e) {
            e.preventDefault();
            $(this).toggleClass('active');
            $(this).closest(".js-card-collapse").toggleClass('active').find(".js-card-body").slideToggle("fast");
        });

		{#/*============================================================================
			#Modals
		==============================================================================*/ #}

        {# Mobile gestures and functions #}

        if ($(window).width() < 768) {

            {# Detect if device is IOS #}

            var is_ios = /(iPad|iPhone|iPod)/g.test( navigator.userAgent );
            if(is_ios){
                {% if not settings.continue_buying %}
                    {# Apply big size to fixed CTAs to avoid 44px IOS not tapable ghost area #}
                    $(".js-ios-fixed-bottom").addClass("big");
                {% endif %}
                $(".js-ajax-cart-panel").addClass("modal-xs-tall");
            };
        }

        {# /* Modals v2 - applied for now only on hamburguer panel */ #}

        var $modal_close = $('.js-modal-close');
        var $modal_open = $('.js-modal-open');
        var $modal_overlay = $('.js-modal-overlay');

        $modal_open.click(function (e) {
            e.preventDefault(); 
            var $modal_id = $(this).data('toggle');
            $("body").toggleClass("overflow-none modal-active");
            if ($($modal_id).hasClass("modal-show")) {
                $($modal_id).removeClass("modal-show").delay(200).hide(0);
            } else {
                $($modal_id).show(0).addClass("modal-show");
            }             
        });

        $modal_close.click(function (e) {
            e.preventDefault();  
            $("body").toggleClass("overflow-none modal-active");
            $(this).closest(".js-modal").removeClass("modal-show").delay(200).hide(0);      
        });

        $modal_overlay.click(function (e) {
            e.preventDefault();  
            $("body").toggleClass("overflow-none modal-active");
            $(".js-modal").removeClass("modal-show").delay(200).hide(0);      
        });

        {# Modals above all elements #}

        $(document).on("click", ".js-trigger-modal-zindex-top", function (e) {
            e.preventDefault();
            var modal_id = $(this).attr("href");
            $(modal_id).detach().insertAfter(".modal-backdrop");
            $(".modal-backdrop").addClass("modal-backdrop-zindex-top");
        });

        if ($(window).width() < 768) {

            {# Modals backdrop close on mobile for small popups #}

            $(document).on("click", ".modal-backdrop", function () {
                $(this).next(".js-modal-xs-centered").modal('toggle');
            });

            {# Full screen mobile modals back events #}

            {# Clean url hash function #}

            cleanURLHash = function(){
                const uri = window.location.toString();
                const clean_uri = uri.substring(0, uri.indexOf("#"));
                window.history.replaceState({}, document.title, clean_uri);
            };

            {# Go back 1 step on browser history #}

            goBackBrowser = function(){
                cleanURLHash();
                history.back();
            };

            {# Clean url hash on page load: All modals should be closed on load #}

            if(window.location.href.indexOf("modal-fullscreen") > -1) {
                cleanURLHash();
            }

            {# Open full screen modal and url hash #}

            $(document).on("click", ".js-fullscreen-modal-open", function(e) {
                e.preventDefault();
                var modal_url_hash = $(this).data("modal-url");            
                window.location.hash = modal_url_hash;
            });

            {# Close full screen modal: Remove url hash #}

            $(document).on("click", ".js-fullscreen-modal-close", function(e) {
                e.preventDefault();
                goBackBrowser();
            });

            {# Hide panels or modals on browser backbutton #}

            window.onhashchange = function() {
                if(window.location.href.indexOf("modal-fullscreen") <= -1) {
                    $("body").removeClass("overflow-none");

                    {# For custom modals #}

                    if($(".js-fullscreen-modal").hasClass("modal-xs-right-in")){

                        $(".js-fullscreen-modal.modal-xs-right-in").toggleClass("modal-xs-right-in modal-xs-right-out");
                        setTimeout(function() { 
                            $(".js-fullscreen-modal.modal-xs-right-in").hide();
                        }, 300);

                    {# For bootstrap modals #}

                    }else if($(".js-fullscreen-modal").hasClass("in")){
                        $(".js-fullscreen-modal.in").modal('hide');
                    }
                }
            } 
        } 

        {# Bottom sheet modal #}

        $('.js-sheet-bottom').on('show.bs.modal', function (e) {
            setTimeout(function(){
                $('.modal-backdrop').addClass('sheet-bottom-backdrop');
            });
        });

		{#/*============================================================================
			#Notifications
		==============================================================================*/ #}

        {# Notifications variables #}

        var $notification_status_page = $(".js-notification-status-page");
        var $notification_order_cancellation = $(".js-notification-order-cancellation");
        var $fixed_bottom_button = $(".js-btn-fixed-bottom");

        {# /* // Close notification */ #}

        $(".js-notification-close").on( "click", function(e) {
            e.preventDefault();
            $(this).closest(".js-notification").hide();
        });


        {# /* // Follow order status notification */ #}

        if ($notification_status_page.size() > 0){
            if (LS.shouldShowOrderStatusNotification($notification_status_page.data('url'))){
                $notification_status_page.show();
            };
            $(".js-notification-status-page-close").on( "click", function(e) {
                e.preventDefault();
                LS.dontShowOrderStatusNotificationAgain($notification_status_page.data('url'));
            });
        }

        {# /* // Follow order cancellation notification */ #}

        if ($notification_order_cancellation.size() > 0){
            if (LS.shouldShowOrderCancellationNotification($notification_order_cancellation.data('url'))){
                {% if not params.preview %}
                    {# Show order cancellation notification only if cookie banner is not visible #}

                    if (window.cookieNotificationService.isAcknowledged()) {
                {% endif %}
                        $notification_order_cancellation.show();
                {% if not params.preview %}
                    }
                {% endif %}
                $fixed_bottom_button.css({"margin-bottom": "40px"});
            };
            $(".js-notification-order-cancellation-close").on( "click", function(e) {
                e.preventDefault();
                LS.dontShowOrderCancellationNotification($notification_order_cancellation.data('url'));
            });
        }

        {% if not params.preview %}

            {# /* // Cookie banner notification */ #}

            restoreNotifications = function(){

                // Whatsapp button position
                if ($(window).width() < 768) {
                    $fixed_bottom_button.css({"margin-bottom": "10px"});
                }

                {# Restore notifications when Cookie Banner is closed #}

                var show_order_cancellation = ($notification_order_cancellation.size() > 0) && (LS.shouldShowOrderCancellationNotification($notification_order_cancellation.data('url')));

                {% if store.country == 'AR' %}
                    {# Order cancellation #}
                    if (show_order_cancellation){
                        $notification_order_cancellation.show();
                        $fixed_bottom_button.css({"margin-bottom": "40px"});
                    }
                {% endif %}
            };

            if (!window.cookieNotificationService.isAcknowledged()) {
                $(".js-notification-cookie-banner").show();

                {# Whatsapp button position #}
                if ($(window).width() < 768) {
                    $fixed_bottom_button.css({"margin-bottom": "120px"});
                }else{
                    $fixed_bottom_button.css({"margin-bottom": "90px"});
                }
            }

            $(".js-acknowledge-cookies").on( "click", function(e) {
                window.cookieNotificationService.acknowledge();
                restoreNotifications();
            });

        {% endif %}

		{#/*============================================================================
		  #Header and nav
		==============================================================================*/ #}

        {# /* // Mobile navigation tabs and search */ #}

        var $top_nav = $(".js-mobile-nav");
        var $head = $(".js-head");
        var $page_main_content = $(".js-main-content");
        var $mobile_categories_btn = $(".js-toggle-mobile-categories");
        var $main_categories_mobile_container = $(".js-categories-mobile-container");
        var $search_backdrop = $(".js-search-backdrop");

        {# Mobile nav search #}

        $(".js-toggle-mobile-search").click(function(e){
            e.preventDefault;
            var $mobile_tab_navigation = $(".js-mobile-nav-second-row");
            $(".js-mobile-first-row").toggle();
            $(".js-mobile-search-row").toggle();
            $mobile_tab_navigation.toggle();
            $(".js-search-input").val();
            $search_backdrop.toggle().toggleClass("search-open");
            if(!$("body").hasClass("mobile-categories-visible")){
                $("body").toggleClass("overflow-none");
            }else{
                $("body").removeClass("mobile-categories-visible");
            }
            $main_categories_mobile_container.hide();
            if($page_main_content.hasClass("move-up")){
                $head.removeClass("move-up").addClass("move-down");
                $page_main_content.removeClass("move-up").addClass("move-down");
                $search_backdrop.removeClass("move-up").addClass("move-down");
                setTimeout(function() { 
                    $page_main_content.removeClass("move-down");
                }, 200);
            }else{
                $head.removeClass("move-down").addClass("move-up");
                $page_main_content.removeClass("move-down").addClass("move-up");
                $search_backdrop.removeClass("move-down").addClass("move-up");
            }
            if($mobile_categories_btn.hasClass("selected")){
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            }
        });
        var $mobile_search_input = $(".js-mobile-search-input");
        $(".js-toggle-mobile-search-open").click(function(e){
            e.preventDefault;
            $mobile_search_input.focus();
        });
        $(".js-search-back-btn").click(function(e){
            $(".js-search-suggest").hide();
            $mobile_search_input.val('');
        });

        {# Mobile nav categories #}

        $top_nav.addClass("move-down").removeClass("move-up");
        $mobile_categories_btn.click(function (e) {
            e.preventDefault();
            $("body").toggleClass("overflow-none mobile-categories-visible");
            if ($mobile_categories_btn.hasClass("selected")) {
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            } else {
                $mobile_categories_btn.addClass("selected");
                $(".js-current-page").removeClass("selected");
            }
            $main_categories_mobile_container.toggle();
            if ($top_nav.hasClass("move-up")) {
                $main_categories_mobile_container.toggleClass("move-list-up");
            }
        });

        {# Mobile nav subcategories #}

        $(".js-open-mobile-subcategory").click(function (e) {
            e.preventDefault();
            var $this = $(this);
            var this_link_id_val = $this.data("target");
            var $subcategories_panel_to_be_visible = $this.closest($main_categories_mobile_container).find("#" + this_link_id_val);
            $subcategories_panel_to_be_visible.detach().insertAfter(".js-categories-mobile-container > .js-mobile-nav-subcategories-panel:last-child");
            $subcategories_panel_to_be_visible.addClass("modal-xs-right-out").show();
            setTimeout(function () {
                $subcategories_panel_to_be_visible.toggleClass("modal-xs-right-in modal-xs-right-out");
            }, 100);
        });

        $(".js-go-back-mobile-categories").click(function (e) {
            e.preventDefault();
            var $this = $(this);
            var $subcategories_panel_to_be_closed = $this.closest(".js-mobile-nav-subcategories-panel");
            $(".js-mobile-nav-subcategories-panel").scrollTop(0);
            $subcategories_panel_to_be_closed.toggleClass("modal-xs-right-in modal-xs-right-out");
            setTimeout(function () {
                $subcategories_panel_to_be_closed.removeClass("modal-xs-right-out").hide();
            }, 300);
        });

        {# Mobile nav hamburger subitems #}

        $(".js-toggle-hamburger-panel").click(function(e){
            e.preventDefault();
            $("body, .js-hamburger-overlay, .js-hamburger-panel, .js-main-content").toggleClass("hamburger-panel-animated");
        });

        $(".js-toggle-page-accordion").click(function (e) {
            e.preventDefault();
            $(this).toggleClass("selected").closest(".js-hamburger-panel-toggle-accordion").next(".js-pages-accordion").slideToggle(300);
        });

        {# Show and hide mobile nav on scroll #}

        {# Only hide and show nav on scroll when page is not cart #}

        {% if template != 'cart' %}

            var didScroll;
            var lastScrollTop = 0;
            var delta = 20;
            var navbarHeight = $('header').outerHeight();

            $(window).scroll(function(event){
                didScroll = true;
            });

            setInterval(function() {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);

            function hasScrolled() {
                var st = $(this).scrollTop();
                
                // Make sure they scroll more than delta
                if(Math.abs(lastScrollTop - st) <= delta)
                    return;
                
                // If they scrolled down and are past the navbar, add class .move-up.
                if (st > lastScrollTop && st > navbarHeight){
                    // Scroll Down
                        if(!$("body").hasClass("mobile-categories-visible")){
                            $top_nav.addClass("move-up").removeClass("move-down");
                        }
                        $(".backdrop").addClass("move-up").removeClass("move-down");
                        $(".js-head").addClass("logo-small");
                        $(".js-mobile-nav-second-row").addClass("move-up").removeClass("move-down");

                } else {
                    // Scroll Up
                    if(st + $(window).height() < $(document).height()) {
                        if(!$("body").hasClass("mobile-categories-visible")){
                            $top_nav.removeClass("move-up").addClass("move-down");
                        }
                        $top_nav.removeClass("move-up").addClass("move-down");
                        $(".backdrop").removeClass("move-up").addClass("move-down");
                        $(".js-head").removeClass("logo-small");
                        $(".js-mobile-nav-second-row").removeClass("move-up").addClass("move-down");

                    }
                }
                
                lastScrollTop = st;
            }

        {% else %}

        {# If page is cart hide the nav on scroll and show it only if you are on top of window #}

            $(window).scroll(function(event){
                var scrollTop = $(this).scrollTop();
                if (scrollTop <= 0) {
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.removeClass("move-up").addClass("move-down");
                    }
                    $top_nav.removeClass("move-up").addClass("move-down");
                } else {
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.addClass("move-up").removeClass("move-down");
                    }
                }
            });

        {% endif %}

        {# /* // Header fixed */ #}

        if ($(window).width() < 768) {
            var height_head = $(".js-head").height();
            var height_headtabs = $(".js-head").height();

            {% if settings.tab_menu  %} 
                $(".js-main-content").css("padding-top", height_headtabs); 
                $(".js-mobile-nav-second-row").css("top", height_head); 
                $(".js-categories-mobile-container-list").css("top", height_headtabs);
                $(".js-mobile-nav-subcategories-panel").css("top", height_head);
            {% else %}
                $(".js-main-content").css("padding-top", height_head);                    
            {% endif %}
        };

        {# /* // Desktop fixed nav */ #}

        var headerStart = $("#header").position().top;
        $(window).scroll(function(){
            var position = $(window).scrollTop();

            if(position > headerStart){
                $("#header-slim").stop().animate({  top: 0  }, 500);
            } else {
                $("#header-slim").stop().animate({  top: -140  }, 120);
            }
        });

        {# /* // Scroll top */ #}

        $('.js-go-to-top').click(function(){
            $("html, body").animate({scrollTop:"0px"});
        });

        {# /* // Go to previous page */ #}

        $('.js-go-back').click(function(){
            window.history.back();
        });

        {# /* // Search suggestions */ #}
        
        LS.search($(".js-search-input"), function(html, count){
            $search_suggests = $(this).closest(".js-search-container").next(".js-search-suggest");
            if(count > 0){
                $search_suggests.html(html).show();
            }else{
                $search_suggests.hide();
            }
        }, {
            snipplet: 'navigation/search-results.tpl'
        });
        
        if ($(window).width() > 768) {

            {# Hide search suggestions if user click outside results #}

            $("body").click(function () {
                $(".js-search-suggest").hide();
            });

            {# Maintain search suggestions visibility if user click on links inside #}

            $(document).on("click", ".js-search-suggest a", function () {
                $(".js-search-suggest").show();
            });
        }

        $(".js-search-suggest").on("click", ".js-search-suggest-all-link", function(e){
            e.preventDefault();
            $this_closest_form = $(this).closest(".js-search-suggest").prev(".js-search-container").find(".js-search-form");
            $this_closest_form.submit();
        });

		{#/*============================================================================
		  #Home page
		==============================================================================*/ #}

		{# /* // Newsletter popup */ #}

        LS.newsletter_avoid_siteblindado_bot();

        {% if contact and contact.type == 'newsletter' %}
            $(window).scrollTop($("#newsletter").offset().top - 100);
        {% endif %}

        {% if settings.show_news_box %}

            var $newspopup_mandatory_field = $('#news-popup-form').find(".js-mandatory-field");

            $('#news-popup-form').submit(function () {
                $(".js-news-spinner").show();
                $newspopup_mandatory_field.removeClass("input-error");
                $(".js-news-popup-submit").prop("disabled", true);
                ga_send_event('contact', 'newsletter', 'popup');
            });
            LS.newsletter('#news-popup-form-container', '#news-popup', '{{ store.contact_url | escape('js') }}', function (response) {
                $(".js-news-spinner").hide();
                var selector_to_use = response.success ? '.js-news-popup-success' : '.js-news-popup-failed';
                $(this).find(selector_to_use).fadeIn(100).delay(4000).fadeOut(500);
                if ($(".js-news-popup-success").css("display") == "block") {
                    setTimeout(function () {
                        $("#news-popup").modal('hide');
                    }, 2500);
                } else {
                    $newspopup_mandatory_field.addClass("input-error");
                }
                $(".js-news-popup-submit").prop("disabled", false);
            });
            $(document).ready(function () {
                LS.newsletterPopup({
                    selector: "#news-popup"
                });
            });

        {% endif %}

		{# /* // Home slider */ #}

        var width = window.innerWidth;
        
        {% if settings.slider_auto %}
            if (width > 767) { 
                var slider_autoplay = {delay: 6000,};
            } else {
                var slider_autoplay = false;
            }
        {% endif %}

        window.homeSlider = {
            getAutoRotation: function() {
                return slider_autoplay;
            },
            updateSlides: function(slides) {
                homeSwiper.removeAllSlides();
                slides.forEach(function(aSlide){
                    homeSwiper.appendSlide(
                        '<div class="swiper-slide slide-container">' +
                            (aSlide.link ? '<a href="' + aSlide.link + '">' : '' ) +
                                '<img src="' + aSlide.src + '" class="slide-img"/>' + 
                            (aSlide.link ? '</a>' : '' ) +
                        '</div>'
                    );
                });
                if(!slides.length){
                    $(".js-home-slider-container").addClass("hidden");
                    $(".js-home-empty-slider-container").removeClass("hidden")
                }else{
                    if(slides.length > 1){
                        $('.js-swiper-home-pagination, .js-swiper-home-prev, .js-swiper-home-next').show();
                    }
                    $(".js-home-slider-container").removeClass("hidden");
                    $(".js-home-empty-slider-container").addClass("hidden");
                }
            },
            changeAutoRotation: function(){

            },
        };

        var homeSwiper = null;
        createSwiper('.js-home-slider', {
            preloadImages: false,
            lazy: true,
            {% if settings.slider | length > 1 %}
                loop: true,
            {% endif %}
            {% if settings.slider_auto %}
                autoplay: slider_autoplay,
            {% endif %}
            pagination: {
                el: '.js-swiper-home-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.js-swiper-home-next',
                prevEl: '.js-swiper-home-prev',
            },
        }, function (swiperInstance) {
            homeSwiper = swiperInstance;
        });

        {% if settings.slider | length == 1 %}
            $('.js-swiper-home .swiper-wrapper').addClass( "disabled" );
            {% if params.preview %}
                $('.js-swiper-home-pagination, .js-swiper-home-prev, .js-swiper-home-next').hide();
            {% else %}
                $('.js-swiper-home-pagination, .js-swiper-home-prev, .js-swiper-home-next').remove();
            {% endif %}
        {% endif %}

        {# /* // Banner services slider */ #}

        {% set has_banner_services = settings.banner_services or settings.banner_services_home or settings.banner_services_category %}

        {% if has_banner_services %}

            {# /* // Banner services slider */ #}

            var width = window.outerWidth;
            if (width < 767) {   
                createSwiper('.js-mobile-services', {
                    slidesPerView: 1,
                    watchOverflow: true,
                    centerInsufficientSlides: true,
                    pagination: {
                        el: '.js-mobile-service-pagination',
                        clickable: true,
                    },
                });
            }

        {% endif %}

        {# /* // Banners */ #}

        // Ensure all banners have the same height
        // This has to go before the infite scrolling hides them and `$(this).height()` returns 0.
        var maxHeight = 0;
        $('.js-wrap-banner').each(function(){
            maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
        });
        $('.js-wrap-banner').css("height", maxHeight);

		{# /* // Products slider */ #}

        {% if sections.primary.products %}

            if ($(window).width() > 768) {

                createSwiper('.js-swiper-primary-products', {
                    lazy: true,
                    spaceBetween: 30,
                    slidesPerView: 4.5,
                    slidesPerGroup: 4,
                    watchSlidesVisibility: true,
                    slideVisibleClass: 'js-swiper-slide-visible',
                    threshold: 5,
                    watchOverflow: true,
                    navigation: {
                        nextEl: '.js-swiper-primary-products-next',
                        prevEl: '.js-swiper-primary-products-prev',
                    },
                });
            }

        {% endif %}

        {% if template == 'home' %}

            {% if sections.offer.products %}

                if ($(window).width() > 768) {
                    createSwiper('.js-swiper-offer-products', {
                        lazy: true,
                        direction: 'vertical',
                        slidesPerView: 'auto',
                        watchOverflow: true,
                        spaceBetween: 20,
                        threshold: 5,
                        navigation: {
                            nextEl: '.js-swiper-offer-products-next',
                            prevEl: '.js-swiper-offer-products-prev',
                        },
                    });
                }

            {% endif %}

            {% if sections.coming.products %}

                if ($(window).width() > 768) {
                    createSwiper('.js-swiper-coming-products', {
                        lazy: true,
                        direction: 'vertical',
                        slidesPerView: 'auto',
                        watchOverflow: true,
                        spaceBetween: 20,
                        threshold: 5,
                        navigation: {
                            nextEl: '.js-swiper-coming-products-next',
                            prevEl: '.js-swiper-coming-products-prev',
                        },
                    });
                }

            {% endif %}

            {% if sections.recent.products %}

                if ($(window).width() > 768) {
                    createSwiper('.js-swiper-recent-products', {
                        lazy: true,
                        direction: 'vertical',
                        slidesPerView: 'auto',
                        watchOverflow: true,
                        spaceBetween: 20,
                        threshold: 5,
                        navigation: {
                            nextEl: '.js-swiper-recent-products-next',
                            prevEl: '.js-swiper-recent-products-prev',
                        },
                    });
                }

            {% endif %}
        {% endif %}

        {% if template == 'home' %}
            {% set video_url = settings.video_embed %}
        {% elseif template == 'product' and product.video_url %}
            {% set video_url = product.video_url %}
        {% endif %}

        {% if video_url %}

            {# /* // Youtube or Vimeo video for home or each product */ #}

            LS.loadVideo('{{ video_url }}');

            {# Empty product video modal iframe on close #}
            
            $('#modal-product-video').on('hidden.bs.modal', function (e) {
              $(".js-product-video-modal").find(".js-video-iframe").empty().hide();
            });
            
        {% endif %}

		{#/*============================================================================
		  #Product grid
		==============================================================================*/ #}

        {# /* // Sort by */ #}

        $('.js-sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if ($.inArray(key, ['results_only', 'page']) == -1) {
                    sort_params_array.push(key + '=' + params[key]);
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });

        {# /* // Filters */ #}

        $(".js-toggle-mobile-filters").click(function (e) {
            e.preventDefault();
            $(".js-mobile-filters-panel").toggleClass("modal-xs-right-in modal-xs-right-out");
            $("body").toggleClass("overflow-none");
        });

        $(document).on("click", ".js-apply-filter, .js-remove-filter", function(e) {
            e.preventDefault();
            var filter_name = $(this).data('filter-name');
            var filter_value = $(this).data('filter-value');
            if($(this).hasClass("js-apply-filter")){
                $(this).find("[type=checkbox]").prop("checked", true);
                LS.urlAddParam(
                    filter_name, 
                    filter_value, 
                    true
                );
            }else{
                $(this).find("[type=checkbox]").prop("checked", false);
                LS.urlRemoveParam(
                    filter_name, 
                    filter_value
                );   
            }
            {# Toggle class to avoid adding double parameters in case of double click and show applying changes feedback #}

            if ($(this).hasClass("js-filter-checkbox")){
                if ($(window).width() < 768) {
                    $(".js-filters-overlay").show();
                    if($(this).hasClass("js-apply-filter")){
                        $(".js-applying-filter").show();
                    }else{
                        $(".js-removing-filter").show();
                    }
                }
                $(this).toggleClass("js-apply-filter js-remove-filter");
            }
        });

        $(document).on("click", ".js-remove-all-filters", function(e) {
            e.preventDefault();
            LS.urlRemoveAllParams();
        });

        {# /* // Mobile pagination */ #}

        $(".js-mobile-paginator-input").focusout(function(e){
            e.preventDefault();
            LS.paginateMobile();
        });

        {% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}

            {# /* // Infinite scroll */ #}

            {% if pages.current == 1 and not pages.is_last %}
                LS.hybridScroll({
                    productGridSelector: '.js-product-table',
                    spinnerSelector: '#js-infinite-scroll-spinner',
                    loadMoreButtonSelector: '.js-load-more-btn',
                    hideWhileScrollingSelector: ".js-hide-footer-while-scrolling",
                    productsBeforeLoadMoreButton: 50,
                    productsPerPage: {{ settings.category_quantity_products }}
                });
            {% endif %}

        {% endif %}

        {% if settings.product_color_variants %}

            {# Product color variations #}

            $(document).on("click", ".js-color-variant", function(e) {
                e.preventDefault();
                $this = $(this);

                var option_id = $this.data('option');
                $selected_option = $this.closest('.js-item-product').find('.js-variation-option option').filter(function() {
                    return this.value == option_id;
                });
                $selected_option.prop('selected', true).trigger('change');
                var available_variant = $(this).closest(".js-product-container").data('variants');

                var available_variant_color = $(this).closest('.js-color-variant-active').data('option');

                for (var variant in available_variant) {
                    if (option_id == available_variant[variant]['option'+ available_variant_color ]) {
                        if (available_variant[variant]['stock'] == null || available_variant[variant]['stock'] > 0 ) {
                            var otherOptions = getOtherOptionNumbers(available_variant_color);
                            var otherOption = available_variant[variant]['option' + otherOptions[0]];
                            var anotherOption = available_variant[variant]['option' + otherOptions[1]];
                            changeSelect($(this), otherOption, otherOptions[0]);
                            changeSelect($(this), anotherOption, otherOptions[1]);
                            break;
                        }
                    }
                }

                $this.siblings().removeClass("selected");
                $this.addClass("selected");
            });

            function getOtherOptionNumbers(selectedOption) {
                switch (selectedOption) {
                    case 0:
                        return [1, 2];
                    case 1:
                        return [0, 2];
                    case 2:
                        return [0, 1];
                }
            }

            function changeSelect(element, optionToSelect, optionIndex) {
                if (optionToSelect != null) {
                    var selected_option_parent_id = element.closest('.js-item-product').data("product-id");
                    var selected_option_attribute = $('.js-item-product[data-product-id="'+selected_option_parent_id+'"]').find('.js-color-variant-available-' + (optionIndex + 1)).data('value');
                    var selected_option = $('.js-item-product[data-product-id="'+selected_option_parent_id+'"]').find('.js-variation-option[data-variant-id="'+selected_option_attribute+'"] option').filter(function() {
                        return this.value == optionToSelect;
                    });

                    selected_option.prop('selected', true).trigger('change');
                }
            }
        {% endif %}

		{#/*============================================================================
		  #Product detail functions
		==============================================================================*/ #}

		{# /* // Installments */ #}

        {# Installments without interest #}

        function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
            if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
                if (installment_data.without_interests) {
                    return [number_of_installment, installment_data.installment_value.toFixed(2)];
                }
            }
            return max_installments_without_interests;
        }

        {# Installments with interest #}

        function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
            if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
                if (installment_data.without_interests == false) {
                    return [number_of_installment, installment_data.installment_value.toFixed(2)];
                }
            }
            return max_installments_with_interests;
        }

        {# Refresh installments inside detail popup #}

        function refreshInstallmentv2(price){
            $(".js-modal-installment-price" ).each(function( index ) {
                const installment = Number($(this).data('installment'));
                $(this).text(LS.currency.display_short + (price/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
            });
        }

        {# Refresh price on payments popup with payment discount applied #}

        function refreshPaymentDiscount(price){
            $(".js-price-with-discount" ).each(function( index ) {
                const payment_discount = $(this).data('payment-discount');
                $(this).text(LS.formatToCurrency(price - ((price * payment_discount) / 100)))
            });
        }

        {# /* // Change variant */ #}

        function changeVariant(variant){
            $(".js-product-detail .js-shipping-calculator-response").hide();
            $("#shipping-variant-id").val(variant.id);

            var parent = $("body");
            if (variant.element){
                parent = $(variant.element);
            }

            var sku = parent.find('#sku');
            if(sku.length) {
                sku.text(variant.sku).show();
            }

            var installment_helper = function($element, amount, price){
                $element.find('.js-installment-amount').text(amount);
                $element.find('.js-installment-price').attr("data-value", price);
                $element.find('.js-installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
                    $element.find('.js-installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                } else {
                    $element.find('.js-installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
                }
            };

            if (variant.installments_data) {
                var variant_installments = JSON.parse(variant.installments_data);
                var max_installments_without_interests = [0,0];
                var max_installments_with_interests = [0,0];
                $.each(variant_installments, function(payment_method, installments) {
                    $.each(installments, function(number_of_installment, installment_data) {
                        max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                        max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                        var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;

                        if(!parent.hasClass("js-quickshop-container")){
                            installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                        }
                    });
                });
                var $installments_container = $(variant.element + ' .js-max-installments-container .js-max-installments');
                var $installments_modal_link = $(variant.element + ' #btn-installments');
                var $payments_module = $(variant.element + ' .js-product-payments-container');
                var $installmens_card_icon = $(variant.element + ' .js-installments-credit-card-icon');

                {% if product.has_direct_payment_only %}
                var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;

                if(installments_to_use[0] <= 0 ) {
                {%  else %}
                var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

                if(installments_to_use[0] <= 1 ) {
                {% endif %}
                    $installments_container.hide();
                    $installments_modal_link.hide();
                    $payments_module.hide();
                    $installmens_card_icon.hide();
                } else {
                    $installments_container.show();
                    $installments_modal_link.show();
                    $payments_module.show();
                    $installmens_card_icon.show();
                    installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
                }
            }

            if(!parent.hasClass("js-quickshop-container")){
                $('#installments-modal .js-installments-one-payment').text(variant.price_short).attr("data-value", variant.price_number);
            }
            
            if (variant.price_short){
                parent.find('.js-price-display').text(variant.price_short).show();
                parent.find('.js-price-display').attr("content", variant.price_number);
            } else {
                parent.find('.js-price-display').hide();
            }

            if ((variant.compare_at_price_short) && !(parent.find(".js-price-display").css("display") == "none")) {
                parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();
            } else {
                parent.find('.js-compare-price-display').hide();
            }

            {% set has_colors_and_quickshop = settings.product_color_variants and settings.quick_view %}

            {% if has_colors_and_quickshop %}
                var $quickshop_link = parent.find('.js-item-buy-open');
            {% endif %}

            var button = parent.find('.js-addtocart');
            button.removeClass('cart').removeClass('contact').removeClass('nostock');
            var $product_shipping_calculator = parent.find("#product-shipping-container");
            {% if not store.is_catalog %}
            if (!variant.available){
                button.val('{{ "Sin stock" | translate }}');
                button.addClass('nostock');
                button.attr('disabled', 'disabled');
                $product_shipping_calculator.hide();
                {% if has_colors_and_quickshop %}
                    $quickshop_link.hide();
                {% endif %}
            } else if (variant.contact) {
                button.val('{{ "Consultar precio" | translate }}');
                button.addClass('contact');
                button.removeAttr('disabled');
                $product_shipping_calculator.hide();
                {% if has_colors_and_quickshop %}
                    $quickshop_link.hide();
                {% endif %}
            } else {
                button.val('{{ "Agregar al carrito" | translate }}');
                button.addClass('cart');
                button.removeAttr('disabled');
                $product_shipping_calculator.show();
                {% if has_colors_and_quickshop %}
                    $quickshop_link.show();
                {% endif %}
            }

            {% endif %}

            {% if template == 'product' %}
                const base_price = Number($("#price_display").attr("content"));
                refreshInstallmentv2(base_price);
                refreshPaymentDiscount(variant.price_number);
            {% endif %}

            {# Update shipping on variant change #}

            LS.updateShippingProduct();
            
            zipcode_on_changevariant = $("#product-shipping-container .js-shipping-input").val();
            $("#product-shipping-container .js-shipping-calculator-current-zip").text(zipcode_on_changevariant);
        }

        {# /* // Product labels on variant change */ #}

        {# Show and hide labels on product variant change. Also recalculates discount percentage #}

        $(document).on("change", ".js-variation-option", function(e) {

            var $parent = $(this).closest(".js-product-variants");
            var $variants_group = $(this).closest(".js-product-variants-group");
            var $quickshop_parent_wrapper = $(this).closest(".js-quickshop-container");
            
            {# If quickshop is used from modal, use quickshop-id from the item that opened it #}

            if($quickshop_parent_wrapper.hasClass("js-quickshop-modal")){
                var quick_id = $(".js-quickshop-opened .js-quickshop-container").data("quickshop-id");
            }else{
                var quick_id = $quickshop_parent_wrapper.data("quickshop-id");
            }            
            if($parent.hasClass("js-product-quickshop-variants")){
                
                var $quickshop_parent = $(this).closest(".js-item-product");

                {# Target visible slider item if necessary #}
                
                if($quickshop_parent.hasClass("js-item-slide")){
                    var $quickshop_variant_selector = '.js-swiper-slide-visible .js-quickshop-container[data-quickshop-id="'+quick_id+'"]';
                }else{
                    var $quickshop_variant_selector = '.js-quickshop-container[data-quickshop-id="'+quick_id+'"]';
                }

                LS.changeVariant(changeVariant, $quickshop_variant_selector);

                {% if settings.product_color_variants %}
                    {# Match selected color variant with selected quickshop variant #}

                    if(($variants_group).hasClass("js-color-variants-container")){
                        var selected_option_id = $(this).find("option:selected").val();
                        if($quickshop_parent.hasClass("js-item-slide")){
                            var $color_parent_to_update = $('.js-swiper-slide-visible .js-quickshop-container[data-quickshop-id="'+quick_id+'"]');
                        }else{
                            var $color_parent_to_update = $('.js-quickshop-container[data-quickshop-id="'+quick_id+'"]');
                        }
                        $color_parent_to_update.find('.js-color-variant').removeClass("selected");
                        $color_parent_to_update.find('.js-color-variant[data-option="'+selected_option_id+'"]').addClass("selected");
                    }
                {% endif %}
            } else {
                LS.changeVariant(changeVariant, '#single-product .js-product-container');
            }

            {# Offer and discount labels update #}

            var $this_product_container = $(this).closest(".js-product-container");
            var $this_compare_price = $this_product_container.find(".js-compare-price-display");
            var $this_price = $this_product_container.find(".js-price-display");
            var $installment_container = $this_product_container.find(".js-product-payments-container");
            var $installment_text = $this_product_container.find(".js-max-installments-container");
            var $this_add_to_cart = $this_product_container.find(".js-prod-submit-form");

            // Get the current product discount percentage value
            var current_percentage_value = $this_product_container.find(".js-offer-percentage");

            // Get the current product price and promotional price
            var compare_price_value = $this_compare_price.html();
            var price_value = $this_price.html();

            // Calculate new discount percentage based on difference between filtered old and new prices
            const percentageDifference = window.moneyDifferenceCalculator.percentageDifferenceFromString(compare_price_value, price_value);
            if(percentageDifference){
                $this_product_container.find(".js-offer-percentage").text(percentageDifference);
                $this_product_container.find(".js-offer-label").css("display" , "table");
            }

            if ($this_compare_price.css("display") == "none" || !percentageDifference) {
                $this_product_container.find(".js-offer-label").hide();
            }

            if ($this_add_to_cart.hasClass("nostock")) {
                $this_product_container.find(".js-stock-label").show();
            }
            else {
                $this_product_container.find(".js-stock-label").hide();
            }
            if ($this_price.css('display') == 'none'){
                $installment_container.hide();
                $installment_text.hide();
            }else{
                $installment_text.show();
            }
        });

        {# /* // Color and size variations */ #}

        $(document).on("click", ".js-insta-variant", function(e) {
            e.preventDefault();
            $this = $(this);
            $this.siblings().removeClass("selected");
            $this.addClass("selected");

            var option_id = $this.data('option');
            $selected_option = $this.closest('.js-product-variants').find('.js-variation-option option').filter(function() {
                return this.value == option_id;
            });
            $selected_option.prop('selected', true).trigger('change');

            $this.closest("[class^='variation']").find('.js-insta-variation-label').html(option_id);

        });

		{% if settings.quick_view or settings.product_color_variants %}

			{# /* // Quickshop or color variant update */ #}

			LS.registerOnChangeVariant(function(variant){
				var current_image = $('.js-item-image', '.js-item-product[data-product-id="'+variant.product_id+'"]');
				current_image.attr('srcset', variant.image_url);
			});

		{% endif %}

        {% if settings.quick_view %}

            {# /* // Quickshop */ #}

            $(document).on("click", ".js-item-buy-open", function(e) {
                e.preventDefault();

                $(".js-item-variants").removeClass("item-buy-visible");
                $(this).closest(".js-quickshop-container").find(".js-item-variants").show().addClass("item-buy-visible");

                {# Position screen on item open #}

                if ($(window).width() < 768) {
                    var offset = + 150;
                }else{
                    var offset = 180;
                }
            
                $([document.documentElement, document.body]).animate({
                    scrollTop: $(this).closest(".js-product-container").offset().top - offset
                }, 400);

            });

            $(document).on("click", ".js-item-buy-close", function(e) {
                e.preventDefault();
                $(this).closest(".js-item-variants").removeClass("item-buy-visible");
            });

        {% endif %}
        
        {# /* // Submit to contact */ #}

        $(".js-product-form").submit(function(e){
            var button = $(this).find(':submit');
            button.attr('disabled', 'disabled');
            if ((button.hasClass('contact')) || (button.hasClass('catalog'))) {
                e.preventDefault();
                var product_id = $(this).find("input[name='add_to_cart']").val();
                window.location = "{{ store.contact_url | escape('js') }}?product=" + product_id;
            } else if (button.hasClass('cart')) {
                button.val('{{ "Agregando" | translate }}');
            }
        });

        {% if template == "product" %}

            {# /* // Product mobile variants */ #}
            
            $(document).on("click", ".js-mobile-vars-btn", function(e) {
                $(this).next(".js-mobile-vars-panel").removeClass('js-var-panel modal-xs-right-out').addClass('js-var-panel modal-xs-right-in');
                $(this).closest(".modal").scrollTop(0), "fast";
                $("body").addClass("overflow-none");
            });

            function closeVarPanel() {
            setTimeout(function(){
                $('.js-var-panel').removeClass('js-var-panel modal-xs-right-in').addClass('js-var-panel modal-xs-right-out')}, 300);
                $("body").removeClass("overflow-none");
            };

            $(document).on("click", ".js-close-panel", function(e) {
              closeVarPanel();
            });

            $(".js-mobile-vars-property").on( "click", function() {
              var selectedoption = $(this).data("option");
              var varname = $(this).closest(".js-mobile-vars-panel").data("custom");
              $(this).closest(".js-mobile-vars").find(".js-mobile-vars-selected-label").html(selectedoption);
              $(this).closest(".js-product-detail").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
              closeVarPanel();
            });

            $(document).on("click", ".js-mobile-vars-property", function(e) {
                e.preventDefault();
                $this = $(this);
                $this.siblings().removeClass("selected");
                $this.addClass("selected");
                var option_id = $this.data('option');
                $selected_option = $this.closest('.js-mobile-variations-container').find('.js-variation-option option[value="'+option_id+'"]');
                $selected_option.prop('selected', true).trigger('change');
            });

            {# /* // Pinterest sharing */ #}

            $('.js-pinterest-share').click(function(e){
                e.preventDefault();
                $(".pinterest-hidden a")[0].click();
            });

            {# /* // Product slider */ #}

            {% set has_multiple_slides = product.images_count > 1 or video_url %}

            function productSliderNav(){
                var productSwiper = null;
                createSwiper('.js-swiper-product', {
                    lazy: true,
                    loop: false,
                    slideActiveClass: 'js-product-active-image',
                    pagination: {
                        el: '.js-swiper-product-pagination',
                        clickable: true,
                    },
                    navigation: {
                        nextEl: '.js-swiper-product-next',
                        prevEl: '.js-swiper-product-prev',
                    },
                    on: {
                        init: function () {
                            $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                            $(".js-swiper-product").css({"visibility" : "visible" , "height" : "auto"});
                            {% if product.video_url %}
                                productSwiperHeight = $(".js-swiper-product").height();
                                $(".js-product-video-slide").height(productSwiperHeight);
                            {% endif %}
                        },
                        {% if product.video_url %}
                            slideChangeTransitionEnd: function () {
                                if($(".js-product-video-slide").hasClass("js-product-active-image")){
                                    $(".js-labels-group, .js-open-mobile-zoom").fadeOut(100);
                                }else{
                                    $(".js-labels-group, .js-open-mobile-zoom").fadeIn(100);
                                }
                                $('.js-video').show();
                                $('.js-video-iframe').hide().find("iframe").remove();
                            },
                        {% endif %}
                    },
                }, function (swiperInstance) {
                    productSwiper = swiperInstance;
                });

                {% if has_multiple_slides %}
                    LS.registerOnChangeVariant(function(variant){
                        var liImage = $('.js-swiper-product').find("[data-image='"+variant.image+"']");
                        var selectedPosition = liImage.data('image-position');
                        var slideToGo = parseInt(selectedPosition);
                        productSwiper.slideTo(slideToGo);
                        $(".js-product-slide-img").removeClass("js-active-variant");
                        liImage.find(".js-product-slide-img").addClass("js-active-variant");
                    });
                    
                    $(".js-product-thumb").click(function(e){
                        e.preventDefault();
                        var current_thumb_index = $(this).attr("data-slide-index");
                        var match_thumb_image = $('.js-swiper-product').find("[data-image-position='"+current_thumb_index+"']");
                        var selectedPosition = match_thumb_image.attr("data-image-position");
                        var slideToGo = parseInt(selectedPosition);
                        productSwiper.slideTo(slideToGo);
                    });
                {% endif %}
            }
            productSliderNav ()

            {# /* // Product thumbs */ #}

            {% if has_multiple_slides %}

                createSwiper('.js-swiper-product-thumbnails', {
                    spaceBetween: 10,
                    slidesPerView: 6,
                    slidesPerGroup: 6,
                    threshold: 6, 
                    navigation: {
                        nextEl: '.js-swiper-product-thumbnails-next',
                        prevEl: '.js-swiper-product-thumbnails-prev',
                    },
                });

            {% endif %}

            {# /* // Mobile zoom */ #}

            //Save scrolling position for fixed body on Mobile Zoom opened
            var scrollPos = $(document).scrollTop();
            $(window).scroll(function(){
                scrollPos = $(document).scrollTop();
            });
            var savedScrollPos = scrollPos;

            // Add tap class to product image
            if ($(window).width() < 768) {
                $(".js-image-open-mobile-zoom").addClass("js-open-mobile-zoom");
            }

            // Mobile zoom open event
            $(".js-open-mobile-zoom").click(function(e){
                e.preventDefault();
                savedScrollPos = scrollPos;
                $('body').css({
                    position: 'fixed',
                    top: -scrollPos
                });
                LS.openMobileZoom();
            });

            // Mobile zoom close event
            $(".js-close-mobile-zoom").click(function(e){
                e.preventDefault();
                LS.closeMobileZoom(100);
            });

            
        {% endif %}

        {# /* // Quantity input */ #}

        $(document).on("click", ".js-quantity .js-quantity-up", function() {
            $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
            $quantity_input.val( parseInt($quantity_input.val(), 10) + 1);
        });

        $(document).on("click", ".js-quantity .js-quantity-down", function() {
            $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
            quantity_input_val = $quantity_input.val();
            if (quantity_input_val>1) { 
                $quantity_input.val( parseInt($quantity_input.val(), 10) - 1);
            }
        });

        {% if show_help %}

            $(".show-help-social .soc-foot").click(function(){
                return false;
            });

            {# 404 handling to show the example product #}
            if ( window.location.pathname === "/product/example/" ) {
                document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
                $("#404").hide();
                $("#product-example").show();
            } else {
                $("#product-example").hide();
            }

        {% endif %}

		{#/*============================================================================
		#Cart
		==============================================================================*/ #}

        {# /* // Cart quantitiy changes */ #}

        $(document).on("keypress", ".js-cart-quantity-input", function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        $(document).on("focusout", ".js-cart-quantity-input", function (e) {
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if (itemVAL == 0) {
                var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                if (r == true) {
                    LS.removeItem(itemID, true);
                } else {
                    $(this).val(1);
                }
            } else {
                LS.changeQuantity(itemID, itemVAL, true);
            }
        });

        {# /* // Empty cart alert */ #}

        $(".js-hide-alert").click(function(e){
            e.preventDefault();
            $(this).closest(".alert").hide();
        })

        $(".js-trigger-empty-cart-alert").click(function (e) {
            e.preventDefault();
            $(".js-mobile-nav-empty-cart-alert").fadeIn(100).delay(1500).fadeOut(500);
        });

        {# /* // Add to cart */ #}

        $(document).on("click", ".js-addtocart:not(.js-addtocart-placeholder)", function (e) {

            {# Button variables for transitions on add to cart #}

            var $productContainer = $(this).closest('.js-product-container');
            var $productButton = $productContainer.find("input[type='submit'].js-addtocart");
            var $productButtonPlaceholder = $productContainer.find(".js-addtocart-placeholder");
            var $productButtonText = $productButtonPlaceholder.find(".js-addtocart-text");
            var $productButtonAdding = $productButtonPlaceholder.find(".js-addtocart-adding");
            var $productButtonSuccess = $productButtonPlaceholder.find(".js-addtocart-success");
            var isQuickShop = $productContainer.hasClass('js-quickshop-container');

            if(isQuickShop && ($(this).hasClass("js-cart-direct-add"))){
                var addedToCartCopy = "{{ 'Comprar' | translate }}";
            }else{
                var addedToCartCopy = "{{ 'Agregar al carrito' | translate }}";
            }
            

            if (!$(this).hasClass('contact')) {

                {% if settings.ajax_cart %}
                    e.preventDefault();
                {% endif %}

                {# Hide real button and show button placeholder during event #}

                $productButton.hide();
                $productButtonPlaceholder.show();
                $productButtonText.fadeOut();
                $productButtonAdding.addClass("active");

                {% if settings.ajax_cart %}

                    var callback_add_to_cart = function(){

                        {# Show button placeholder with transitions #}

                        $productButtonAdding.removeClass("active");
                        $productButtonSuccess.addClass("active");
                        setTimeout(function(){
                            $productButtonSuccess.removeClass("active");
                            $productButtonText.fadeIn();
                        },2000);
                        setTimeout(function(){
                            $productButtonPlaceholder.removeAttr("style").hide();
                            $productButton.show();
                        },3000);

                        if ($(window).width() < 768) {
                            
                            mobileToggleAjaxCart();

                            {# Show or hide sitcky mobile CTA depending the amount of products #}

                            if ($(".js-cart-item").length >= 4){
                                $(".js-visible-when-many-items").show().addClass("sticky");
                            }else{
                                $(".js-visible-when-many-items").slideUp().removeClass("sticky");
                            }
                        }else{
                            {# Lock body scroll on cart visible #}
                            if($(".js-ajax-cart-panel").css('display') == 'none'){
                                $("body").addClass("overflow-none");
                            }
                            $(".js-ajax-backdrop").toggle();
                            ajax_cart_panel.toggle();
                        }

                        if(isQuickShop){
                            setTimeout(function(){
                                $productContainer.find(".js-item-variants").removeClass("item-buy-visible");
                            },2000);
                        }    

                        {# Show added product cart link #}

                        $productContainer.find(".js-added-to-cart-product-message").slideDown();
                        $("#single-product").find(".js-addtocart, .js-product-quantity-container, .js-product-cta-container").removeClass("m-bottom-half m-bottom");
                        $("#single-product .js-quantity").addClass("m-none");
                        
                        {# Update shipping input zipcode on add to cart #}

                        {# Use zipcode from input if user is in product page, or use zipcode cookie if is not #}

                        if ($("#product-shipping-container .js-shipping-input").val()) {
                            zipcode_on_addtocart = $("#product-shipping-container .js-shipping-input").val();
                            $("#cart-shipping-container .js-shipping-input").val(zipcode_on_addtocart);
                            $(".js-shipping-calculator-current-zip").text(zipcode_on_addtocart);
                        } else if (cookieService.get('calculator_zipcode')){
                            var zipcode_from_cookie = cookieService.get('calculator_zipcode');
                            $('.js-shipping-input').val(zipcode_from_cookie);
                            $(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);
                        }
                    }
                    var callback_error = function(){
                            
                        {# Restore real button visibility in case of error #}

                        $productButtonAdding.removeClass("active");
                        $productButtonText.fadeIn();
                        $productButtonPlaceholder.removeAttr("style").hide();
                        $productButton.show();
                    }
                    $prod_form = $(this).closest("form");
                    LS.addToCartEnhanced(
                        $prod_form,
                        addedToCartCopy,
                        '{{ "Agregando" | translate }}',
                        '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
                        {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                        callback_add_to_cart,
                        callback_error
                    );
                {% endif %}
            }
        });

        {% if settings.ajax_cart %}

            {# /* // Cart toggle */ #}

            const ajax_cart_panel = $(".js-ajax-cart-panel");

            {# Toggle ajax cart on mobile #}

            mobileToggleAjaxCart = function(){

                if(!$("body").hasClass("mobile-categories-visible")){
                    $("body").toggleClass("overflow-none");
                }

                if(ajax_cart_panel.hasClass("modal-xs-right-in")){

                    ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    setTimeout(function() { 
                        ajax_cart_panel.hide();
                    }, 300);
                }else{

                    {# Add hash parameter on cart opened #}

                    if ($(window).width() < 768) {
                        window.location.hash = "modal-fullscreen-cart";
                    }
                    
                    ajax_cart_panel.show();
                    setTimeout(function() { 
                        ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    }, 300);
                }
            };


            if ($(window).width() < 768) {

                {# Reduce fixed CTA button when shipping input is focused and keyboard displayed #}

                var ajax_shipping_input = $(".js-ajax-cart-panel .js-shipping-input");

                ajax_shipping_input.focus(function() {
                    $(".js-ajax-cart-fixed-bottom").hide();
                });

                ajax_shipping_input.focusout(function(e){
                    $(".js-ajax-cart-fixed-bottom").show();
                }); 
            }

            {# Ajax cart show or hide #}

            $(document).on("click", ".js-toggle-cart", function (e) {
                e.preventDefault();
                if ($(window).width() < 768) {
                    mobileToggleAjaxCart();
                }else{
                    $(".js-ajax-backdrop").toggle();
                    ajax_cart_panel.toggle();
                    $("body").toggleClass("overflow-none");
                }            
            });

        {% endif %}

		{#/*============================================================================
		  #Shipping calculator
		==============================================================================*/ #}

        {# /* // Select and save shipping function */ #}

        selectShippingOption = function(elem, save_option) {
            $(".js-shipping-method, .js-branch-method").removeClass('js-selected-shipping-method');
            $(elem).addClass('js-selected-shipping-method');

            if (save_option) {
                LS.saveCalculatedShipping(true);
            }

            if($(elem).hasClass("js-shipping-method-hidden")){

                {# Toggle other options visibility depending if they are pickup or delivery for cart and product at the same time #}

                if($(elem).hasClass("js-pickup-option")){
                    $(".js-other-pickup-options, .js-show-other-pickup-options .js-shipping-see-less").show();
                    $(".js-show-other-pickup-options .js-shipping-see-more").hide();

                }else{
                    $(".js-other-shipping-options, .js-show-more-shipping-options .js-shipping-see-less").show();
                    $(".js-show-more-shipping-options .js-shipping-see-more").hide()
                }          
            }
        };

        {# Apply zipcode saved by cookie if there is no zipcode saved on cart from backend #}

        if (cookieService.get('calculator_zipcode')) {

            {# If there is a cookie saved based on previous calcualtion, add it to the shipping input to trigger automatic calculation #}

            var zipcode_from_cookie = cookieService.get('calculator_zipcode');

            {% if settings.ajax_cart %}

                {# If ajax cart is active, target only product input to avoid extra calulation on empty cart #}

                $('#product-shipping-container .js-shipping-input').val(zipcode_from_cookie);

            {% else %}

                {# If ajax cart is inactive, target the only input present on screen #}

                $('.js-shipping-input').val(zipcode_from_cookie);
                
            {% endif %}

            {# Fill zipcode message #}

            $(".js-shipping-calculator-current-zip").text(zipcode_from_cookie);

            {# Hide the shipping calculator and show spinner  #}

            $(".js-shipping-calculator-head").addClass("with-zip").removeClass("with-form");
            $(".js-shipping-calculator-with-zipcode").addClass("transition-up-active");
            $(".js-shipping-calculator-spinner").show();
        } else {

            {# If there is no cookie saved, show calcualtor #}

            $(".js-shipping-calculator-form").addClass("transition-up-active");
        }

        {# Remove shipping suboptions from DOM to avoid duplicated modals #}

        removeShippingSuboptions = function(){
            var shipping_suboptions_id = $(".js-modal-shipping-suboptions").attr("id");
            $("#" + shipping_suboptions_id).remove();
            $('.js-modal-overlay[data-modal-id="#' + shipping_suboptions_id + '"').remove();
        };

        {# /* // Toggle branches link */ #}

        $(document).on("click", ".js-toggle-branches", function (e) {
            e.preventDefault();
            $(".js-store-branches-container").slideToggle("fast");
            $(".js-see-branches, .js-hide-branches").toggle();
        });

        {# /* // Shipping and branch click */ #}

        $(document).on("change", ".js-shipping-method, .js-branch-method", function () {
            selectShippingOption(this, true);
            $(".js-shipping-method-unavailable").hide();
        });

        {# /* // Select shipping first option on results */ #}

        $('.js-shipping-method:checked').livequery(function () {
            let shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);

            let total = (LS.data.cart.total / 100) + parseFloat(shippingPrice);
            $(".js-cart-widget-total").html(LS.formatToCurrency(total));

            selectShippingOption(this, false);
        });

        {# /* // Calculate shipping by submit */ #}

        $(".js-shipping-input").keydown(function (e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $(this).parent().find(".js-calculate-shipping").click();
                $(this).blur();
            }
        });

        {# /* // Calculate shipping function */ #}

        $(".js-calculate-shipping").click(function (e) {
            e.preventDefault();

            {# Take the Zip code to all shipping calculators on screen #}
            let shipping_input_val = $(this).closest(".js-shipping-calculator-form").find(".js-shipping-input").val();

            $(".js-shipping-input").val(shipping_input_val);

            {# Calculate on page load for both calculators: Product and Cart #}

            {% if template == 'product' %}
            if (!vanillaJS) {
                LS.calculateShippingAjax(
                    $('#product-shipping-container').find(".js-shipping-input").val(), 
                    '{{store.shipping_calculator_url | escape('js')}}',
                    $("#product-shipping-container").closest(".js-shipping-calculator-container") );
            }
            {% endif %}

            if ($(".js-cart-item").length) {
                LS.calculateShippingAjax(
                    $('#cart-shipping-container').find(".js-shipping-input").val(), 
                    '{{store.shipping_calculator_url | escape('js')}}',
                    $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
            }

            $(".js-shipping-calculator-current-zip").html(shipping_input_val);
            removeShippingSuboptions();

        });

        {# /* // Toggle more shipping options */ #}

        $(document).on("click", ".js-toggle-more-shipping-options", function(e) {
            e.preventDefault();

            {# Toggle other options depending if they are pickup or delivery for cart and product at the same time #}

            if($(this).hasClass("js-show-other-pickup-options")){
                $(".js-other-pickup-options").slideToggle(600);
                $(".js-show-other-pickup-options .js-shipping-see-less, .js-show-other-pickup-options .js-shipping-see-more").toggle();
            }else{
                $(".js-other-shipping-options").slideToggle(600);
                $(".js-show-more-shipping-options .js-shipping-see-less, .js-show-more-shipping-options .js-shipping-see-more").toggle();
            }
        });

        {# /* // Calculate shipping on page load */ #}

        {# Only shipping input has value, cart has saved shipping and there is no branch selected #}

        calculateCartShippingOnLoad = function() {
            {# Triggers function when a zipcode input is filled #}
            if ($("#cart-shipping-container .js-shipping-input").val()) {
           
                // If user already had calculated shipping: recalculate shipping
                setTimeout(function() { 
                    LS.calculateShippingAjax(
                        $('#cart-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
                        removeShippingSuboptions();
                }, 100);
            } 

            if ($(".js-branch-method").hasClass('js-selected-shipping-method')) {
                {% if store.branches|length > 1 %}
                    $(".js-store-branches-container").slideDown("fast");
                    $(".js-see-branches").hide();
                    $(".js-hide-branches").show();
                {% endif %}
            }
        };

        {% if cart.has_shippable_products %}
            calculateCartShippingOnLoad();
        {% endif %}

        {% if template == 'product' %}

        if (!vanillaJS) {
            if($('#product-shipping-container').find(".js-shipping-input").val()){
                setTimeout(function() { 
                    LS.calculateShippingAjax(
                        $('#product-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#product-shipping-container").closest(".js-shipping-calculator-container") );
                    
                    removeShippingSuboptions();
                }, 100);
            }
        }

        {% endif %}

        {# /* // Change CP */ #}

        $(document).on("click", ".js-shipping-calculator-change-zipcode", function(e) {
            e.preventDefault();
            $(".js-shipping-calculator-response").fadeOut(100);
            $(".js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
            $(".js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
            $(".js-shipping-calculator-form").addClass("transition-up-active");
        }); 

        {# /* // Shipping provinces */ #}

		{% if provinces_json %}
            $('select[name="country"]').change(function () {
                var provinces = {{ provinces_json | default('{}') | raw }};
                LS.swapProvinces(provinces[$(this).val()]);
            }).change();
        {% endif %}

        {# /* // Change store country: From invalid zipcode message */ #}

        $(document).on("click", ".js-save-shipping-country", function(e) {

            e.preventDefault();

            {# Change shipping country #}

            var selected_country_url = $(this).closest(".js-modal-shipping-country").find(".js-shipping-country-select option:selected").attr("data-country-url");
            location.href = selected_country_url; 

            $(this).text('{{ "Aplicando..." | translate }}').addClass("disabled");
        });

        {#/*============================================================================
          #Forms
        ==============================================================================*/ #}

        {# Show the success or error message when resending the validation link #}

        {% if template == 'account.register' or template == 'account.login' %}
            $(".js-resend-validation-link").click(function(e){
                window.accountVerificationService.resendVerificationEmail('{{ customer_email }}');
            });
        {% endif %}

        $('.js-password-view').click(function () {
            $(this).toggleClass('password-view');

            if($(this).hasClass('password-view')){
               $(this).parent().find(".js-password-input").attr('type', '');
               $(this).find(".js-lock-open, .js-lock-closed").toggle();
            } else {
               $(this).parent().find(".js-password-input").attr('type', 'password');
               $(this).find(".js-lock-open, .js-lock-closed").toggle();
            }
        });


		{#/*============================================================================
		 	#Footer
		==============================================================================*/ #}

		{# Add alt attribute to external AFIP logo to improve SEO #}

		{% if store.afip %}
			$('img[src*="www.afip.gob.ar"]').attr('alt', '{{ "Logo de AFIP" | translate }}');
		{% endif %}
	});
});

{% if store.live_chat %}
	
	{# Begin olark code #}

	/*{literal}<![CDATA[*/
	window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
	/* custom configuration goes here (www.olark.com/documentation) */
	olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
{% endif %}
