{# /*============================================================================
style.scss.tpl

    -This file contains all the theme non critical styles wich will be loaded asynchronously
    -Rest of styling can be found in:
        -static/css/main-color.scss.tpl --> For color and font styles related to config/settings.txt
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site
        -static/css/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/ #}

{# /*============================================================================
  Table of Contents

  #External CSS libraries and plugins
    // Not critical part of Bootstrap v2.3.1
  #Components
    // Mixins
    // SVG Icons
    // Animations
    // Buttons and links
    // Modals
    // Chips
    // Dividers
    // Badges
    // Forms
    // Alerts and notifications
    // Tabs
    // Paginaton
    // Thumbs scroller
    // User content
    // Tables
    // Images
    // Welcome
    // Social Widgets
    // Video
    // Captcha
  #Header and nav
    // Nav desktop
    // Search
    // Logo
  #Product grid
    // Filters
    // Grid item
  #Product detail
    // Image
    // Form and info
    // Shipping calculator
  #Contact page
  #Cart page
    // Cart page
    // Ajax cart
    // Totals
  #Construction page
  #Footer
  #Media queries
    // Min width 770px
    // Max width 767px
        //// Components
        //// Header and nav
        //// Product grid
        //// Product detail
        //// Footer
        //// Cart page
        //// Construction page
    // Max width 321px
        //// Header and nav
  #Critical path utilities

==============================================================================*/ #}

{#/*============================================================================
  #External CSS libraries and Reset
==============================================================================*/#}

{# /* // Not critical part of Bootstrap v2.3.1 */ #}

.form-horizontal .help-inline,.form-horizontal .input-append,.form-horizontal .input-prepend,.form-horizontal .uneditable-input,.form-horizontal input,.form-horizontal select,.form-horizontal textarea,.form-inline .help-inline,.form-inline .input-append,.form-inline .input-prepend,.form-inline .uneditable-input,.form-inline input,.form-inline select,.form-inline textarea,.form-search .help-inline,.form-search .input-append,.form-search .input-prepend,.form-search .uneditable-input,.form-search input,.form-search select,.form-search textarea{display:inline-block;margin-bottom:0;vertical-align:middle}.form-horizontal .hide,.form-inline .hide,.form-search .hide{display:none}.form-inline .btn-group,.form-inline label,.form-search .btn-group,.form-search label{display:inline-block}.form-inline .input-append,.form-inline .input-prepend,.form-search .input-append,.form-search .input-prepend{margin-bottom:0}.form-inline .checkbox,.form-inline .radio,.form-search .checkbox,.form-search .radio{padding-left:0;margin-bottom:0;vertical-align:middle}.form-inline .checkbox input[type=checkbox],.form-inline .radio input[type=radio],.form-search .checkbox input[type=checkbox],.form-search .radio input[type=radio]{float:left;margin-right:3px;margin-left:0}.control-group{margin-bottom:10px}legend+.control-group{margin-top:20px;-webkit-margin-top-collapse:separate}.form-horizontal .control-group{margin-bottom:20px}.form-horizontal .control-group:after,.form-horizontal .control-group:before{display:table;line-height:0;content:""}.form-horizontal .control-label{float:left;width:160px;padding-top:5px;text-align:right}.form-horizontal .controls{margin-left:180px}.form-horizontal .help-block{margin-bottom:0}.form-horizontal .input-append+.help-block,.form-horizontal .input-prepend+.help-block,.form-horizontal .uneditable-input+.help-block,.form-horizontal input+.help-block,.form-horizontal select+.help-block,.form-horizontal textarea+.help-block{margin-top:10px}.form-horizontal .form-actions{padding-left:180px}table{background-color:transparent;border-collapse:collapse;border-spacing:0}.table{width:100%;margin-bottom:20px}.table td,.table th{padding:8px;line-height:20px;text-align:left;vertical-align:top;border-top:1px solid #ddd}.table th{font-weight:700}.table thead th{vertical-align:bottom}.table caption+thead tr:first-child td,.table caption+thead tr:first-child th,.table colgroup+thead tr:first-child td,.table colgroup+thead tr:first-child th,.table thead:first-child tr:first-child td,.table thead:first-child tr:first-child th{border-top:0}.table tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed td,.table-condensed th{padding:4px 5px}.table-bordered{border:1px solid #ddd;border-collapse:separate;border-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.table-bordered td,.table-bordered th{border-left:1px solid #ddd}.table-bordered caption+tbody tr:first-child td,.table-bordered caption+tbody tr:first-child th,.table-bordered caption+thead tr:first-child th,.table-bordered colgroup+tbody tr:first-child td,.table-bordered colgroup+tbody tr:first-child th,.table-bordered colgroup+thead tr:first-child th,.table-bordered tbody:first-child tr:first-child td,.table-bordered tbody:first-child tr:first-child th,.table-bordered thead:first-child tr:first-child th{border-top:0}.table-bordered tbody:first-child tr:first-child>td:first-child,.table-bordered tbody:first-child tr:first-child>th:first-child,.table-bordered thead:first-child tr:first-child>th:first-child{-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topleft:4px}.table-bordered tbody:first-child tr:first-child>td:last-child,.table-bordered tbody:first-child tr:first-child>th:last-child,.table-bordered thead:first-child tr:first-child>th:last-child{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-moz-border-radius-topright:4px}.table-bordered tbody:last-child tr:last-child>td:first-child,.table-bordered tbody:last-child tr:last-child>th:first-child,.table-bordered tfoot:last-child tr:last-child>td:first-child,.table-bordered tfoot:last-child tr:last-child>th:first-child,.table-bordered thead:last-child tr:last-child>th:first-child{-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-moz-border-radius-bottomleft:4px}.table-bordered tbody:last-child tr:last-child>td:last-child,.table-bordered tbody:last-child tr:last-child>th:last-child,.table-bordered tfoot:last-child tr:last-child>td:last-child,.table-bordered tfoot:last-child tr:last-child>th:last-child,.table-bordered thead:last-child tr:last-child>th:last-child{-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-bottomright:4px}.table-bordered tfoot+tbody:last-child tr:last-child td:first-child{-webkit-border-bottom-left-radius:0;border-bottom-left-radius:0;-moz-border-radius-bottomleft:0}.table-bordered tfoot+tbody:last-child tr:last-child td:last-child{-webkit-border-bottom-right-radius:0;border-bottom-right-radius:0;-moz-border-radius-bottomright:0}.table-bordered caption+tbody tr:first-child td:first-child,.table-bordered caption+thead tr:first-child th:first-child,.table-bordered colgroup+tbody tr:first-child td:first-child,.table-bordered colgroup+thead tr:first-child th:first-child{-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topleft:4px}.table-bordered caption+tbody tr:first-child td:last-child,.table-bordered caption+thead tr:first-child th:last-child,.table-bordered colgroup+tbody tr:first-child td:last-child,.table-bordered colgroup+thead tr:first-child th:last-child{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-moz-border-radius-topright:4px}.table-striped tbody>tr:nth-child(odd)>td,.table-striped tbody>tr:nth-child(odd)>th{background-color:#f9f9f9}.table-hover tbody tr:hover>td,.table-hover tbody tr:hover>th{background-color:#f5f5f5}.row-fluid table td[class*=span],.row-fluid table th[class*=span],table td[class*=span],table th[class*=span]{display:table-cell;float:none;margin-left:0}.table td.span1,.table th.span1{float:none;width:44px;margin-left:0}.table td.span2,.table th.span2{float:none;width:124px;margin-left:0}.table td.span3,.table th.span3{float:none;width:204px;margin-left:0}.table td.span4,.table th.span4{float:none;width:284px;margin-left:0}.table td.span5,.table th.span5{float:none;width:364px;margin-left:0}.table td.span6,.table th.span6{float:none;width:444px;margin-left:0}.table td.span7,.table th.span7{float:none;width:524px;margin-left:0}.table td.span8,.table th.span8{float:none;width:604px;margin-left:0}.table td.span9,.table th.span9{float:none;width:684px;margin-left:0}.table td.span10,.table th.span10{float:none;width:764px;margin-left:0}.table td.span11,.table th.span11{float:none;width:844px;margin-left:0}.table td.span12,.table th.span12{float:none;width:924px;margin-left:0}.table tbody tr.success>td{background-color:#dff0d8}.table tbody tr.error>td{background-color:#f2dede}.table tbody tr.warning>td{background-color:#fcf8e3}.table tbody tr.info>td{background-color:#d9edf7}.table-hover tbody tr.success:hover>td{background-color:#d0e9c6}.table-hover tbody tr.error:hover>td{background-color:#ebcccc}.table-hover tbody tr.warning:hover>td{background-color:#faf2cc}.table-hover tbody tr.info:hover>td{background-color:#c4e3f3}[class*=" icon-"],[class^=icon-]{display:inline-block;width:14px;height:14px;margin-top:1px;line-height:14px;vertical-align:text-top;background-image:url(../img/glyphicons-halflings.png);background-position:14px 14px;background-repeat:no-repeat}.dropdown-menu>.active>a>[class*=" icon-"],.dropdown-menu>.active>a>[class^=icon-],.dropdown-menu>li>a:focus>[class*=" icon-"],.dropdown-menu>li>a:focus>[class^=icon-],.dropdown-menu>li>a:hover>[class*=" icon-"],.dropdown-menu>li>a:hover>[class^=icon-],.dropdown-submenu:focus>a>[class*=" icon-"],.dropdown-submenu:focus>a>[class^=icon-],.dropdown-submenu:hover>a>[class*=" icon-"],.dropdown-submenu:hover>a>[class^=icon-],.icon-white,.nav-list>.active>a>[class*=" icon-"],.nav-list>.active>a>[class^=icon-],.nav-pills>.active>a>[class*=" icon-"],.nav-pills>.active>a>[class^=icon-],.navbar-inverse .nav>.active>a>[class*=" icon-"],.navbar-inverse .nav>.active>a>[class^=icon-]{background-image:url(../img/glyphicons-halflings-white.png)}.icon-glass{background-position:0 0}.icon-music{background-position:-24px 0}.icon-search{background-position:-48px 0}.icon-envelope{background-position:-72px 0}.icon-heart{background-position:-96px 0}.icon-star{background-position:-120px 0}.icon-star-empty{background-position:-144px 0}.icon-user{background-position:-168px 0}.icon-film{background-position:-192px 0}.icon-th-large{background-position:-216px 0}.icon-th{background-position:-240px 0}.icon-th-list{background-position:-264px 0}.icon-ok{background-position:-288px 0}.icon-remove{background-position:-312px 0}.icon-zoom-in{background-position:-336px 0}.icon-zoom-out{background-position:-360px 0}.icon-off{background-position:-384px 0}.icon-signal{background-position:-408px 0}.icon-cog{background-position:-432px 0}.icon-trash{background-position:-456px 0}.icon-home{background-position:0 -24px}.icon-file{background-position:-24px -24px}.icon-time{background-position:-48px -24px}.icon-road{background-position:-72px -24px}.icon-download-alt{background-position:-96px -24px}.icon-download{background-position:-120px -24px}.icon-upload{background-position:-144px -24px}.icon-inbox{background-position:-168px -24px}.icon-play-circle{background-position:-192px -24px}.icon-repeat{background-position:-216px -24px}.icon-refresh{background-position:-240px -24px}.icon-list-alt{background-position:-264px -24px}.icon-lock{background-position:-287px -24px}.icon-flag{background-position:-312px -24px}.icon-headphones{background-position:-336px -24px}.icon-volume-off{background-position:-360px -24px}.icon-volume-down{background-position:-384px -24px}.icon-volume-up{background-position:-408px -24px}.icon-qrcode{background-position:-432px -24px}.icon-barcode{background-position:-456px -24px}.icon-tag{background-position:0 -48px}.icon-tags{background-position:-25px -48px}.icon-book{background-position:-48px -48px}.icon-bookmark{background-position:-72px -48px}.icon-print{background-position:-96px -48px}.icon-camera{background-position:-120px -48px}.icon-font{background-position:-144px -48px}.icon-bold{background-position:-167px -48px}.icon-italic{background-position:-192px -48px}.icon-text-height{background-position:-216px -48px}.icon-text-width{background-position:-240px -48px}.icon-align-left{background-position:-264px -48px}.icon-align-center{background-position:-288px -48px}.icon-align-right{background-position:-312px -48px}.icon-align-justify{background-position:-336px -48px}.icon-list{background-position:-360px -48px}.icon-indent-left{background-position:-384px -48px}.icon-indent-right{background-position:-408px -48px}.icon-facetime-video{background-position:-432px -48px}.icon-picture{background-position:-456px -48px}.icon-pencil{background-position:0 -72px}.icon-map-marker{background-position:-24px -72px}.icon-adjust{background-position:-48px -72px}.icon-tint{background-position:-72px -72px}.icon-edit{background-position:-96px -72px}.icon-share{background-position:-120px -72px}.icon-check{background-position:-144px -72px}.icon-move{background-position:-168px -72px}.icon-step-backward{background-position:-192px -72px}.icon-fast-backward{background-position:-216px -72px}.icon-backward{background-position:-240px -72px}.icon-play{background-position:-264px -72px}.icon-pause{background-position:-288px -72px}.icon-stop{background-position:-312px -72px}.icon-forward{background-position:-336px -72px}.icon-fast-forward{background-position:-360px -72px}.icon-step-forward{background-position:-384px -72px}.icon-eject{background-position:-408px -72px}.icon-chevron-left{background-position:-432px -72px}.icon-chevron-right{background-position:-456px -72px}.icon-plus-sign{background-position:0 -96px}.icon-minus-sign{background-position:-24px -96px}.icon-remove-sign{background-position:-48px -96px}.icon-ok-sign{background-position:-72px -96px}.icon-question-sign{background-position:-96px -96px}.icon-info-sign{background-position:-120px -96px}.icon-screenshot{background-position:-144px -96px}.icon-remove-circle{background-position:-168px -96px}.icon-ok-circle{background-position:-192px -96px}.icon-ban-circle{background-position:-216px -96px}.icon-arrow-left{background-position:-240px -96px}.icon-arrow-right{background-position:-264px -96px}.icon-arrow-up{background-position:-289px -96px}.icon-arrow-down{background-position:-312px -96px}.icon-share-alt{background-position:-336px -96px}.icon-resize-full{background-position:-360px -96px}.icon-resize-small{background-position:-384px -96px}.icon-plus{background-position:-408px -96px}.icon-minus{background-position:-433px -96px}.icon-asterisk{background-position:-456px -96px}.icon-exclamation-sign{background-position:0 -120px}.icon-gift{background-position:-24px -120px}.icon-leaf{background-position:-48px -120px}.icon-fire{background-position:-72px -120px}.icon-eye-open{background-position:-96px -120px}.icon-eye-close{background-position:-120px -120px}.icon-warning-sign{background-position:-144px -120px}.icon-plane{background-position:-168px -120px}.icon-calendar{background-position:-192px -120px}.icon-random{width:16px;background-position:-216px -120px}.icon-comment{background-position:-240px -120px}.icon-magnet{background-position:-264px -120px}.icon-chevron-up{background-position:-288px -120px}.icon-chevron-down{background-position:-313px -119px}.icon-retweet{background-position:-336px -120px}.icon-shopping-cart{background-position:-360px -120px}.icon-folder-close{width:16px;background-position:-384px -120px}.icon-folder-open{width:16px;background-position:-408px -120px}.icon-resize-vertical{background-position:-432px -119px}.icon-resize-horizontal{background-position:-456px -118px}.icon-hdd{background-position:0 -144px}.icon-bullhorn{background-position:-24px -144px}.icon-bell{background-position:-48px -144px}.icon-certificate{background-position:-72px -144px}.icon-thumbs-up{background-position:-96px -144px}.icon-thumbs-down{background-position:-120px -144px}.icon-hand-right{background-position:-144px -144px}.icon-hand-left{background-position:-168px -144px}.icon-hand-up{background-position:-192px -144px}.icon-hand-down{background-position:-216px -144px}.icon-circle-arrow-right{background-position:-240px -144px}.icon-circle-arrow-left{background-position:-264px -144px}.icon-circle-arrow-up{background-position:-288px -144px}.icon-circle-arrow-down{background-position:-312px -144px}.icon-globe{background-position:-336px -144px}.icon-wrench{background-position:-360px -144px}.icon-tasks{background-position:-384px -144px}.icon-filter{background-position:-408px -144px}.icon-briefcase{background-position:-432px -144px}.icon-fullscreen{background-position:-456px -144px}.dropdown-toggle:active,.open .dropdown-toggle{outline:0}.caret{display:inline-block;width:0;height:0;vertical-align:top;border-top:4px solid #000;border-right:4px solid transparent;border-left:4px solid transparent;content:""}.dropdown .caret{margin-top:8px;margin-left:2px}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,.2);box-shadow:0 5px 10px rgba(0,0,0,.2);-webkit-background-clip:padding-box;background-clip:padding-box}.alert .close,.btn-group,.btn-group>.btn,.collapse,.dropdown-submenu,.navbar-search{position:relative}.dropdown-menu.pull-right,.pull-right>.dropdown-menu{right:0;left:auto}.dropdown-menu>li>a,.dropdown-submenu:hover>.dropdown-menu,.open>.dropdown-menu{display:block}.dropdown-menu .divider{height:1px;margin:9px 1px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}.dropdown-menu>li>a{padding:3px 20px;font-weight:400;line-height:20px;color:#333;white-space:nowrap}.close,.nav-header{font-weight:700;line-height:20px}.dropdown-menu>.active>a,.dropdown-menu>.active>a:focus,.dropdown-menu>.active>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>li>a:hover,.dropdown-submenu:focus>a,.dropdown-submenu:hover>a{color:#fff;background-color:#0081c2;background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0);text-decoration:none}.dropdown-menu>li>a:focus,.dropdown-menu>li>a:hover,.dropdown-submenu:focus>a,.dropdown-submenu:hover>a{background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3)}.dropdown-menu>.active>a,.dropdown-menu>.active>a:focus,.dropdown-menu>.active>a:hover{background-image:-moz-linear-gradient(top,#08c,#0077b3);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#0077b3));background-image:-webkit-linear-gradient(top,#08c,#0077b3);background-image:-o-linear-gradient(top,#08c,#0077b3);background-image:linear-gradient(to bottom,#08c,#0077b3);outline:0}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{color:#999}.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{text-decoration:none;cursor:default;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{border-top:0;border-bottom:4px solid #000;content:""}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:1px}.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px;-moz-border-radius:0 6px 6px;border-radius:0 6px 6px}.dropup .dropdown-submenu>.dropdown-menu{top:auto;bottom:0;margin-top:0;margin-bottom:-2px;-webkit-border-radius:5px 5px 5px 0;-moz-border-radius:5px 5px 5px 0;border-radius:5px 5px 5px 0}.dropdown-submenu>a:after{display:block;float:right;width:0;height:0;margin-top:5px;margin-right:-10px;border-color:transparent transparent transparent #ccc;border-style:solid;border-width:5px 0 5px 5px;content:" "}.dropdown-submenu:hover>a:after{border-left-color:#fff}.dropdown-submenu.pull-left{float:none}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}.breadcrumb,.typeahead{-webkit-border-radius:4px;-moz-border-radius:4px}.dropdown .dropdown-menu .nav-header{padding-right:20px;padding-left:20px}.typeahead{z-index:1051;margin-top:2px;border-radius:4px}.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);box-shadow:inset 0 1px 1px rgba(0,0,0,.05)}.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,.15)}.well-large{padding:24px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.btn-small,.well-small{-webkit-border-radius:3px;-moz-border-radius:3px}.well-small{padding:9px;border-radius:3px}.btn-group{font-size:0;white-space:nowrap;vertical-align:middle}.btn-group+.btn-group{margin-left:5px}.btn-toolbar{margin-top:10px;margin-bottom:10px;font-size:0}.btn-toolbar>.btn+.btn,.btn-toolbar>.btn+.btn-group,.btn-toolbar>.btn-group+.btn{margin-left:5px}.btn-group>.btn{border-radius:0}.btn-group>.btn+.btn{margin-left:-1px}.btn-group>.btn,.btn-group>.dropdown-menu,.btn-group>.popover{font-size:14px}.btn-group>.btn-mini{font-size:10.5px}.btn-group>.btn-small{font-size:11.9px}.btn-group>.btn-large{font-size:17.5px}.btn-group>.btn:first-child{margin-left:0;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-bottomleft:4px;-moz-border-radius-topleft:4px}.btn-group>.btn:last-child,.btn-group>.dropdown-toggle{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-bottomright:4px}.btn-group>.btn.large:first-child{margin-left:0;-webkit-border-bottom-left-radius:6px;border-bottom-left-radius:6px;-webkit-border-top-left-radius:6px;border-top-left-radius:6px;-moz-border-radius-bottomleft:6px;-moz-border-radius-topleft:6px}.btn-group>.btn.large:last-child,.btn-group>.large.dropdown-toggle{-webkit-border-top-right-radius:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;border-bottom-right-radius:6px;-moz-border-radius-topright:6px;-moz-border-radius-bottomright:6px}.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}.btn-group>.btn+.dropdown-toggle{padding-right:8px;padding-left:8px;-webkit-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 1px 0 0 rgba(255,255,255,.125),inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}.btn-group>.btn-mini+.dropdown-toggle{padding-right:5px;padding-left:5px}.btn-group>.btn-large+.dropdown-toggle{padding-right:12px;padding-left:12px}.btn-group.open .dropdown-toggle{background-image:none;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}.btn-group.open .btn.dropdown-toggle{background-color:#e6e6e6}.btn-group.open .btn-primary.dropdown-toggle{background-color:#04c}.btn-group.open .btn-warning.dropdown-toggle{background-color:#f89406}.btn-group.open .btn-danger.dropdown-toggle{background-color:#bd362f}.btn-group.open .btn-success.dropdown-toggle{background-color:#51a351}.btn-group.open .btn-info.dropdown-toggle{background-color:#2f96b4}.btn-group.open .btn-inverse.dropdown-toggle{background-color:#222}.btn .caret{margin-top:8px;margin-left:0}.btn-large .caret{margin-top:6px;border-top-width:5px;border-right-width:5px;border-left-width:5px}.btn-mini .caret,.btn-small .caret{margin-top:8px}.dropup .btn-large .caret{border-bottom-width:5px}.btn-danger .caret,.btn-info .caret,.btn-inverse .caret,.btn-primary .caret,.btn-success .caret,.btn-warning .caret{border-top-color:#fff;border-bottom-color:#fff}.nav-header,.nav>li>a{display:block}.btn-group-vertical>.btn{display:block;float:none;max-width:100%;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.btn-group-vertical>.btn+.btn{margin-top:-1px;margin-left:0}.btn-group-vertical>.btn:first-child{-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}.btn-group-vertical>.btn:last-child{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}.btn-group-vertical>.btn-large:first-child{-webkit-border-radius:6px 6px 0 0;-moz-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0}.btn-group-vertical>.btn-large:last-child{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}.alert{padding:8px 35px 8px 14px;margin-bottom:20px;background-color:#fcf8e3;border:1px solid #fbeed5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.alert,.alert h4{color:#c09853}.alert h4{margin:0}.alert .close{top:-2px;right:-21px;line-height:20px}.alert-success{color:#468847;background-color:#dff0d8;border-color:#d6e9c6}.alert-success h4{color:#468847}.alert-danger,.alert-error{color:#b94a48;background-color:#f2dede;border-color:#eed3d7}.alert-danger h4,.alert-error h4{color:#b94a48}.alert-info,.alert-info h4{color:#3a87ad}.alert-info{background-color:#d9edf7;border-color:#bce8f1}.alert-block{padding-top:14px;padding-bottom:14px}.alert-block>p,.alert-block>ul{margin-bottom:0}.alert-block p+p{margin-top:5px}.nav{margin-bottom:20px;margin-left:0}.nav>li>a:focus,.nav>li>a:hover{text-decoration:none;background-color:#eee}.nav>li>a>img{max-width:none}.nav>.pull-right{float:right}.nav-header{padding:3px 15px;font-size:11px;color:#999;text-transform:uppercase}.nav li+.nav-header{margin-top:9px}.nav-list{padding-right:15px;padding-left:15px;margin-bottom:0}.nav-list .nav-header,.nav-list>li>a{margin-right:-15px;margin-left:-15px}.nav-list>li>a{padding:3px 15px}.nav-pills>li>a,.nav-tabs>li>a{padding-top:8px;padding-bottom:8px}.nav-list>.active>a,.nav-list>.active>a:focus,.nav-list>.active>a:hover{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.2);background-color:#08c}.nav-list [class*=" icon-"],.nav-list [class^=icon-]{margin-right:2px}.nav-list .divider{height:1px;margin:9px 1px;overflow:hidden;background-color:#e5e5e5;border-bottom:1px solid #fff}.nav-pills:after,.nav-pills:before,.nav-tabs:after,.nav-tabs:before{display:table;line-height:0;content:""}.nav-pills>li,.nav-tabs>li{float:left}.nav-stacked>li,.tabs-left>.nav-tabs>li,.tabs-right>.nav-tabs>li{float:none}.nav-pills>li>a,.nav-tabs>li>a{padding-right:12px;padding-left:12px;margin-right:2px;line-height:14px}.nav-tabs{border-bottom:1px solid #ddd}.nav-tabs>li{margin-bottom:-1px}.nav-tabs>li>a{line-height:20px;border:1px solid transparent;-webkit-border-radius:4px 4px 0 0;-moz-border-radius:4px 4px 0 0;border-radius:4px 4px 0 0}.nav-tabs>li>a:focus,.nav-tabs>li>a:hover{border-color:#eee #eee #ddd}.nav-tabs>.active>a,.nav-tabs>.active>a:focus,.nav-tabs>.active>a:hover{color:#555;cursor:default;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent}.nav-pills>li>a{margin-top:2px;margin-bottom:2px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px}.nav-pills>.active>a,.nav-pills>.active>a:focus,.nav-pills>.active>a:hover{color:#fff;background-color:#08c}.nav-stacked>li>a{margin-right:0}.nav-tabs.nav-stacked{border-bottom:0}.nav-tabs.nav-stacked>li>a{border:1px solid #ddd;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.nav-tabs.nav-stacked>li:first-child>a{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-topleft:4px}.nav-tabs.nav-stacked>li:last-child>a{-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-moz-border-radius-bottomright:4px;-moz-border-radius-bottomleft:4px}.nav-tabs.nav-stacked>li>a:focus,.nav-tabs.nav-stacked>li>a:hover{z-index:2;border-color:#ddd}.nav-pills.nav-stacked>li>a{margin-bottom:3px}.nav-pills.nav-stacked>li:last-child>a{margin-bottom:1px}.nav-tabs .dropdown-menu{-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px}.nav-pills .dropdown-menu{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.nav .dropdown-toggle .caret{margin-top:6px;border-top-color:#08c;border-bottom-color:#08c}.nav .dropdown-toggle:focus .caret,.nav .dropdown-toggle:hover .caret{border-top-color:#005580;border-bottom-color:#005580}.nav-tabs .dropdown-toggle .caret{margin-top:8px}.nav .active .dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}.nav-tabs .active .dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}.nav-pills .open .dropdown-toggle,.nav-tabs .open .dropdown-toggle,.nav>li.dropdown.open.active>a:focus,.nav>li.dropdown.open.active>a:hover{color:#fff;background-color:#999;border-color:#999}.nav li.dropdown.open .caret,.nav li.dropdown.open a:focus .caret,.nav li.dropdown.open a:hover .caret,.nav li.dropdown.open.active .caret{border-top-color:#fff;border-bottom-color:#fff;opacity:1;filter:alpha(opacity=100)}.tabs-stacked .open>a:focus,.tabs-stacked .open>a:hover{border-color:#999}.tabbable:after,.tabbable:before{display:table;line-height:0;content:""}.tabbable:after{clear:both}.tab-content{overflow:auto}.tabs-below>.nav-tabs,.tabs-left>.nav-tabs,.tabs-right>.nav-tabs{border-bottom:0}.pill-content>.pill-pane,.tab-content>.tab-pane{display:none}.pill-content>.active,.tab-content>.active{display:block}.tabs-below>.nav-tabs{border-top:1px solid #ddd}.tabs-below>.nav-tabs>li{margin-top:-1px;margin-bottom:0}.tabs-below>.nav-tabs>li>a{-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}.tabs-below>.nav-tabs>li>a:focus,.tabs-below>.nav-tabs>li>a:hover{border-top-color:#ddd;border-bottom-color:transparent}.tabs-below>.nav-tabs>.active>a,.tabs-below>.nav-tabs>.active>a:focus,.tabs-below>.nav-tabs>.active>a:hover{border-color:transparent #ddd #ddd}.tabs-left>.nav-tabs>li>a,.tabs-right>.nav-tabs>li>a{min-width:74px;margin-right:0;margin-bottom:3px}.tabs-left>.nav-tabs{float:left;margin-right:19px;border-right:1px solid #ddd}.tabs-left>.nav-tabs>li>a{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.tabs-left>.nav-tabs>li>a:focus,.tabs-left>.nav-tabs>li>a:hover{border-color:#eee #ddd #eee #eee}.tabs-left>.nav-tabs .active>a,.tabs-left>.nav-tabs .active>a:focus,.tabs-left>.nav-tabs .active>a:hover{border-color:#ddd transparent #ddd #ddd}.tabs-right>.nav-tabs{float:right;margin-left:19px;border-left:1px solid #ddd}.tabs-right>.nav-tabs>li>a{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.tabs-right>.nav-tabs>li>a:focus,.tabs-right>.nav-tabs>li>a:hover{border-color:#eee #eee #eee #ddd}.tabs-right>.nav-tabs .active>a,.tabs-right>.nav-tabs .active>a:focus,.tabs-right>.nav-tabs .active>a:hover{border-color:#ddd #ddd #ddd transparent}.nav>.disabled>a{color:#999}.nav>.disabled>a:focus,.nav>.disabled>a:hover{text-decoration:none;cursor:default;background-color:transparent}.navbar{margin-bottom:20px;overflow:visible}.navbar-inner{min-height:40px;padding-right:20px;padding-left:20px;border-top:1px solid #eee;border-bottom:1px solid #eee}.navbar-inner:after,.navbar-inner:before{display:table;line-height:0;content:""}.navbar .container{width:auto}.nav-collapse.collapse{height:auto;overflow:visible}.navbar .brand{display:block;float:left;padding:10px 20px;margin-left:-20px;font-size:20px;font-weight:200;color:#777;text-shadow:0 1px 0 #fff}.navbar .brand:focus,.navbar .brand:hover{text-decoration:none}.navbar-text{margin-bottom:0;line-height:40px;color:#777}.navbar-link{color:#777}.navbar-link:focus,.navbar-link:hover{color:#333}.navbar .divider-vertical{height:40px;margin:0 9px;border-right:1px solid #fff;border-left:1px solid #f2f2f2}.navbar .btn,.navbar .btn-group{margin-top:5px}.navbar .btn-group .btn,.navbar .input-append .btn,.navbar .input-append .btn-group,.navbar .input-prepend .btn,.navbar .input-prepend .btn-group{margin-top:0}.navbar-form{margin-bottom:0}.navbar-form:after,.navbar-form:before{display:table;line-height:0;content:""}.navbar-form .checkbox,.navbar-form .radio,.navbar-form input,.navbar-form select{margin-top:5px}.navbar-form .btn,.navbar-form input,.navbar-form select{display:inline-block;margin-bottom:0}.navbar-form input[type=image],.navbar-form input[type=radio],.navbar-form input[type=checkbox]{margin-top:3px}.navbar-form .input-append,.navbar-form .input-prepend{margin-top:5px;white-space:nowrap}.navbar-form .input-append input,.navbar-form .input-prepend input{margin-top:0}.navbar-search{float:left;margin-top:5px;margin-bottom:0}.navbar-search .search-query{padding:4px 14px;margin-bottom:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:13px;font-weight:400;line-height:1;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.navbar-static-top{position:static;margin-bottom:0}.navbar-static-top .navbar-inner{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.navbar-fixed-bottom,.navbar-fixed-top{position:fixed;right:0;left:0;z-index:1030;margin-bottom:0}.navbar-fixed-top .navbar-inner,.navbar-static-top .navbar-inner{border-width:0 0 1px;-webkit-box-shadow:0 1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 1px 10px rgba(0,0,0,.1);box-shadow:0 1px 10px rgba(0,0,0,.1)}.navbar-fixed-bottom .navbar-inner{border-width:1px 0 0;-webkit-box-shadow:0 -1px 10px rgba(0,0,0,.1);-moz-box-shadow:0 -1px 10px rgba(0,0,0,.1);box-shadow:0 -1px 10px rgba(0,0,0,.1)}.navbar-fixed-bottom .navbar-inner,.navbar-fixed-top .navbar-inner{padding-right:0;padding-left:0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container{width:940px}.navbar-fixed-top{top:0}.navbar-fixed-bottom{bottom:0}.navbar .nav{position:relative;left:0;display:block;float:left;margin:0 10px 0 0}.popover,.popover-title:empty{display:none}.navbar .nav.pull-right{float:right;margin-right:0}.navbar .nav>li{float:left}.navbar .nav>li>a{float:none;padding:10px 15px;color:#777;text-decoration:none;text-shadow:0 1px 0 #fff}.navbar .nav .dropdown-toggle .caret{margin-top:8px}.navbar .nav>li>a:focus,.navbar .nav>li>a:hover{color:#333;text-decoration:none;background-color:transparent}.navbar .nav>.active>a,.navbar .nav>.active>a:focus,.navbar .nav>.active>a:hover{color:#555;text-decoration:none;background-color:#e5e5e5;-webkit-box-shadow:inset 0 3px 8px rgba(0,0,0,.125);-moz-box-shadow:inset 0 3px 8px rgba(0,0,0,.125);box-shadow:inset 0 3px 8px rgba(0,0,0,.125)}.navbar .btn-navbar{display:none;float:right;padding:7px 10px;margin-right:5px;margin-left:5px;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#ededed;background-image:-moz-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f2f2f2),to(#e5e5e5));background-image:-webkit-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:-o-linear-gradient(top,#f2f2f2,#e5e5e5);background-image:linear-gradient(to bottom,#f2f2f2,#e5e5e5);background-repeat:repeat-x;border-color:#e5e5e5 #e5e5e5 #bfbfbf;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff2f2f2', endColorstr='#ffe5e5e5', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.075);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.075);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.075)}.navbar .btn-navbar.active,.navbar .btn-navbar.disabled,.navbar .btn-navbar:active,.navbar .btn-navbar:focus,.navbar .btn-navbar:hover,.navbar .btn-navbar[disabled]{color:#fff;background-color:#e5e5e5}.navbar .btn-navbar.active,.navbar .btn-navbar:active{background-color:#ccc\9}.navbar .btn-navbar .icon-bar{display:block;width:18px;height:2px;background-color:#f5f5f5;-webkit-border-radius:1px;-moz-border-radius:1px;border-radius:1px;-webkit-box-shadow:0 1px 0 rgba(0,0,0,.25);-moz-box-shadow:0 1px 0 rgba(0,0,0,.25);box-shadow:0 1px 0 rgba(0,0,0,.25)}.btn-navbar .icon-bar+.icon-bar{margin-top:3px}.navbar .nav>li>.dropdown-menu:before{position:absolute;top:-7px;left:9px;display:inline-block;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-left:7px solid transparent;border-bottom-color:rgba(0,0,0,.2);content:''}.navbar .nav>li>.dropdown-menu:after{position:absolute;top:-6px;left:10px;display:inline-block;border-right:6px solid transparent;border-bottom:6px solid #fff;border-left:6px solid transparent;content:''}.navbar-fixed-bottom .nav>li>.dropdown-menu:before{top:auto;bottom:-7px;border-top:7px solid #ccc;border-bottom:0;border-top-color:rgba(0,0,0,.2)}.navbar-fixed-bottom .nav>li>.dropdown-menu:after{top:auto;bottom:-6px;border-top:6px solid #fff;border-bottom:0}.navbar .nav li.dropdown>a:focus .caret,.navbar .nav li.dropdown>a:hover .caret{border-top-color:#333;border-bottom-color:#333}.navbar .nav li.dropdown.active>.dropdown-toggle,.navbar .nav li.dropdown.open.active>.dropdown-toggle,.navbar .nav li.dropdown.open>.dropdown-toggle{color:#555;background-color:#e5e5e5}.navbar .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#777;border-bottom-color:#777}.navbar .nav li.dropdown.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open.active>.dropdown-toggle .caret,.navbar .nav li.dropdown.open>.dropdown-toggle .caret{border-top-color:#555;border-bottom-color:#555}.navbar .nav>li>.dropdown-menu.pull-right,.navbar .pull-right>li>.dropdown-menu{right:0;left:auto}.navbar .nav>li>.dropdown-menu.pull-right:before,.navbar .pull-right>li>.dropdown-menu:before{right:12px;left:auto}.navbar .nav>li>.dropdown-menu.pull-right:after,.navbar .pull-right>li>.dropdown-menu:after{right:13px;left:auto}.navbar .nav>li>.dropdown-menu.pull-right .dropdown-menu,.navbar .pull-right>li>.dropdown-menu .dropdown-menu{right:100%;left:auto;margin-right:-1px;margin-left:0;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}.navbar-inverse .navbar-inner{background-color:#1b1b1b;background-image:-moz-linear-gradient(top,#222,#111);background-image:-webkit-gradient(linear,0 0,0 100%,from(#222),to(#111));background-image:-webkit-linear-gradient(top,#222,#111);background-image:-o-linear-gradient(top,#222,#111);background-image:linear-gradient(to bottom,#222,#111);border-color:#252525;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff222222', endColorstr='#ff111111', GradientType=0)}.navbar-inverse .brand,.navbar-inverse .nav>li>a{color:#999;text-shadow:0 -1px 0 rgba(0,0,0,.25)}.navbar-inverse .brand:focus,.navbar-inverse .brand:hover,.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{color:#fff}.navbar-inverse .brand,.navbar-inverse .navbar-text{color:#999}.navbar-inverse .nav>li>a:focus,.navbar-inverse .nav>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .nav .active>a,.navbar-inverse .nav .active>a:focus,.navbar-inverse .nav .active>a:hover{color:#fff;background-color:#111}.navbar-inverse .navbar-link{color:#999}.navbar-inverse .navbar-link:focus,.navbar-inverse .navbar-link:hover{color:#fff}.navbar-inverse .divider-vertical{border-right-color:#222;border-left-color:#111}.navbar-inverse .nav li.dropdown.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle,.navbar-inverse .nav li.dropdown.open>.dropdown-toggle{color:#fff;background-color:#111}.navbar-inverse .nav li.dropdown>a:focus .caret,.navbar-inverse .nav li.dropdown>a:hover .caret{border-top-color:#fff;border-bottom-color:#fff}.navbar-inverse .nav li.dropdown>.dropdown-toggle .caret{border-top-color:#999;border-bottom-color:#999}.navbar-inverse .nav li.dropdown.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open.active>.dropdown-toggle .caret,.navbar-inverse .nav li.dropdown.open>.dropdown-toggle .caret{border-top-color:#fff;border-bottom-color:#fff}.navbar-inverse .navbar-search .search-query{color:#fff;background-color:#515151;border-color:#111;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1),0 1px 0 rgba(255,255,255,.15);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1),0 1px 0 rgba(255,255,255,.15);box-shadow:inset 0 1px 2px rgba(0,0,0,.1),0 1px 0 rgba(255,255,255,.15);-webkit-transition:none;-moz-transition:none;-o-transition:none;transition:none}.navbar-inverse .navbar-search .search-query:-moz-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query:-ms-input-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query::-webkit-input-placeholder{color:#ccc}.navbar-inverse .navbar-search .search-query.focused,.navbar-inverse .navbar-search .search-query:focus{padding:5px 15px;color:#333;text-shadow:0 1px 0 #fff;background-color:#fff;border:0;outline:0;-webkit-box-shadow:0 0 3px rgba(0,0,0,.15);-moz-box-shadow:0 0 3px rgba(0,0,0,.15);box-shadow:0 0 3px rgba(0,0,0,.15)}.navbar-inverse .btn-navbar{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#0e0e0e;background-image:-moz-linear-gradient(top,#151515,#040404);background-image:-webkit-gradient(linear,0 0,0 100%,from(#151515),to(#040404));background-image:-webkit-linear-gradient(top,#151515,#040404);background-image:-o-linear-gradient(top,#151515,#040404);background-image:linear-gradient(to bottom,#151515,#040404);border-color:#040404 #040404 #000;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff151515', endColorstr='#ff040404', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar.disabled,.navbar-inverse .btn-navbar:active,.navbar-inverse .btn-navbar:focus,.navbar-inverse .btn-navbar:hover,.navbar-inverse .btn-navbar[disabled]{color:#fff;background-color:#040404}.navbar-inverse .btn-navbar.active,.navbar-inverse .btn-navbar:active{background-color:#000\9}.breadcrumb{padding:8px 15px;margin:0 0 20px;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block;text-shadow:0 1px 0 #fff}.badge,.label,.progress .bar{text-shadow:0 -1px 0 rgba(0,0,0,.25)}.breadcrumb>li>.divider{padding:0 5px;color:#ccc}.breadcrumb>.active{color:#999}.pagination{margin:20px 0}.pagination ul{display:inline-block;margin-bottom:0;margin-left:0;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05)}.pagination ul>li{display:inline}.pagination ul>li>a,.pagination ul>li>span{float:left;padding:4px 12px;line-height:20px;text-decoration:none;background-color:#fff;border:1px solid #ddd;border-left-width:0}.pagination ul>.active>a,.pagination ul>.active>span,.pagination ul>li>a:focus,.pagination ul>li>a:hover{background-color:#f5f5f5}.pagination ul>.active>a,.pagination ul>.active>span{color:#999;cursor:default}.pagination ul>.disabled>a,.pagination ul>.disabled>a:focus,.pagination ul>.disabled>a:hover,.pagination ul>.disabled>span{color:#999;cursor:default;background-color:transparent}.pagination ul>li:first-child>a,.pagination ul>li:first-child>span{border-left-width:1px;-webkit-border-bottom-left-radius:4px;border-bottom-left-radius:4px;-webkit-border-top-left-radius:4px;border-top-left-radius:4px;-moz-border-radius-bottomleft:4px;-moz-border-radius-topleft:4px}.pagination ul>li:last-child>a,.pagination ul>li:last-child>span{-webkit-border-top-right-radius:4px;border-top-right-radius:4px;-webkit-border-bottom-right-radius:4px;border-bottom-right-radius:4px;-moz-border-radius-topright:4px;-moz-border-radius-bottomright:4px}.pagination-right{text-align:right}.pagination-large ul>li>a,.pagination-large ul>li>span{padding:11px 19px;font-size:17.5px}.pagination-large ul>li:first-child>a,.pagination-large ul>li:first-child>span{-webkit-border-bottom-left-radius:6px;border-bottom-left-radius:6px;-webkit-border-top-left-radius:6px;border-top-left-radius:6px;-moz-border-radius-bottomleft:6px;-moz-border-radius-topleft:6px}.pagination-large ul>li:last-child>a,.pagination-large ul>li:last-child>span{-webkit-border-top-right-radius:6px;border-top-right-radius:6px;-webkit-border-bottom-right-radius:6px;border-bottom-right-radius:6px;-moz-border-radius-topright:6px;-moz-border-radius-bottomright:6px}.pagination-mini ul>li:first-child>a,.pagination-mini ul>li:first-child>span,.pagination-small ul>li:first-child>a,.pagination-small ul>li:first-child>span{-webkit-border-bottom-left-radius:3px;border-bottom-left-radius:3px;-webkit-border-top-left-radius:3px;border-top-left-radius:3px;-moz-border-radius-bottomleft:3px;-moz-border-radius-topleft:3px}.pagination-mini ul>li:last-child>a,.pagination-mini ul>li:last-child>span,.pagination-small ul>li:last-child>a,.pagination-small ul>li:last-child>span{-webkit-border-top-right-radius:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;border-bottom-right-radius:3px;-moz-border-radius-topright:3px;-moz-border-radius-bottomright:3px}.pagination-small ul>li>a,.pagination-small ul>li>span{padding:2px 10px;font-size:11.9px}.pagination-mini ul>li>a,.pagination-mini ul>li>span{padding:0 6px;font-size:10.5px}.pager{margin:20px 0;text-align:center}.modal-footer,.modal-form{margin-bottom:0}.pager:after,.pager:before{display:table;line-height:0;content:""}.pager li{display:inline}.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.pager li>a:focus,.pager li>a:hover{text-decoration:none;background-color:#f5f5f5}.pager .next>a,.pager .next>span{float:right}.pager .previous>a,.pager .previous>span{float:left}.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span{color:#999;cursor:default;background-color:#fff}.tooltip{z-index:1030;display:block;font-size:11px;line-height:1.4;opacity:0;filter:alpha(opacity=0);visibility:visible}.tooltip.in{opacity:.8;filter:alpha(opacity=80)}.tooltip.top{padding:5px 0;margin-top:-3px}.tooltip.right{padding:0 5px;margin-left:3px}.tooltip.bottom{padding:5px 0;margin-top:3px}.tooltip.left{padding:0 5px;margin-left:-3px}.tooltip-inner{max-width:200px;padding:8px;color:#fff;text-align:center;text-decoration:none;background-color:#000;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.tooltip-arrow{width:0;height:0;border-color:transparent;border-style:solid}.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-top-color:#000;border-width:5px 5px 0}.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-right-color:#000;border-width:5px 5px 5px 0}.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-left-color:#000;border-width:5px 0 5px 5px}.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-bottom-color:#000;border-width:0 5px 5px}.popover{top:0;left:0;z-index:1010;max-width:276px;padding:1px;text-align:left;white-space:normal;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,.2);-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,.2);-moz-box-shadow:0 5px 10px rgba(0,0,0,.2);box-shadow:0 5px 10px rgba(0,0,0,.2);-webkit-background-clip:padding-box;background-clip:padding-box}.popover.top{margin-top:-10px}.popover.right{margin-left:10px}.popover.bottom{margin-top:10px}.popover.left{margin-left:-10px}.popover-title{padding:8px 14px;margin:0;font-size:14px;font-weight:400;line-height:18px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;-webkit-border-radius:5px 5px 0 0;-moz-border-radius:5px 5px 0 0;border-radius:5px 5px 0 0}.popover-content{padding:9px 14px}.popover .arrow,.popover .arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}.popover .arrow{border-width:11px}.popover .arrow:after{border-width:10px;content:""}.popover.top .arrow{bottom:-11px;left:50%;margin-left:-11px;border-top-color:#999;border-top-color:rgba(0,0,0,.25);border-bottom-width:0}.popover.top .arrow:after{bottom:1px;margin-left:-10px;border-top-color:#fff;border-bottom-width:0}.popover.right .arrow{top:50%;left:-11px;margin-top:-11px;border-right-color:#999;border-right-color:rgba(0,0,0,.25);border-left-width:0}.popover.right .arrow:after{bottom:-10px;left:1px;border-right-color:#fff;border-left-width:0}.popover.bottom .arrow{top:-11px;left:50%;margin-left:-11px;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,.25);border-top-width:0}.popover.bottom .arrow:after{top:1px;margin-left:-10px;border-bottom-color:#fff;border-top-width:0}.popover.left .arrow{top:50%;right:-11px;margin-top:-11px;border-left-color:#999;border-left-color:rgba(0,0,0,.25);border-right-width:0}.popover.left .arrow:after{right:1px;bottom:-10px;border-left-color:#fff;border-right-width:0}.thumbnails{margin-left:-20px}.thumbnails:after,.thumbnails:before{display:table;line-height:0;content:""}.media-object,.thumbnail{display:block}.row-fluid .thumbnails{margin-left:0}.thumbnails>li{float:left;margin-bottom:20px;margin-left:20px}.thumbnail{padding:4px;line-height:20px;border:1px solid #ddd;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 3px rgba(0,0,0,.055);-moz-box-shadow:0 1px 3px rgba(0,0,0,.055);box-shadow:0 1px 3px rgba(0,0,0,.055);-webkit-transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}a.thumbnail:focus,a.thumbnail:hover{border-color:#08c;-webkit-box-shadow:0 1px 4px rgba(0,105,214,.25);-moz-box-shadow:0 1px 4px rgba(0,105,214,.25);box-shadow:0 1px 4px rgba(0,105,214,.25)}.thumbnail>img{display:block;margin-right:auto;margin-left:auto}.thumbnail .caption{padding:9px;color:#555}.media,.media-body{overflow:hidden;zoom:1}.media,.media .media{margin-top:15px}.media:first-child{margin-top:0}.media-heading{margin:0 0 5px}.accordion,.progress{margin-bottom:20px}.media>.pull-left{margin-right:10px}.media>.pull-right{margin-left:10px}.media-list{margin-left:0}.badge,.label{display:inline-block;padding:2px 4px;font-size:11.84px;font-weight:700;line-height:14px;color:#fff;white-space:nowrap;background-color:#999}.label{-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.badge{padding-right:9px;padding-left:9px;-webkit-border-radius:9px;-moz-border-radius:9px;border-radius:9px}.badge:empty,.label:empty{display:none}a.badge:focus,a.badge:hover,a.label:focus,a.label:hover{color:#fff;text-decoration:none;cursor:pointer}.badge-important,.label-important{background-color:#b94a48}.badge-important[href],.label-important[href]{background-color:#953b39}.badge-warning,.label-warning{background-color:#f89406}.badge-warning[href],.label-warning[href]{background-color:#c67605}.badge-success,.label-success{background-color:#468847}.badge-success[href],.label-success[href]{background-color:#356635}.badge-info,.label-info{background-color:#3a87ad}.badge-info[href],.label-info[href]{background-color:#2d6987}.badge-inverse,.label-inverse{background-color:#333}.badge-inverse[href],.label-inverse[href]{background-color:#1a1a1a}.btn .badge,.btn .label{position:relative;top:-1px}.btn-mini .badge,.btn-mini .label{top:0}@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-moz-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-ms-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-o-keyframes progress-bar-stripes{from{background-position:0 0}to{background-position:40px 0}}@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}.progress{height:20px;overflow:hidden;background-color:#f7f7f7;background-image:-moz-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#f5f5f5),to(#f9f9f9));background-image:-webkit-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:-o-linear-gradient(top,#f5f5f5,#f9f9f9);background-image:linear-gradient(to bottom,#f5f5f5,#f9f9f9);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}.progress .bar{float:left;width:0;height:100%;font-size:12px;color:#fff;text-align:center;background-color:#0e90d2;background-image:-moz-linear-gradient(top,#149bdf,#0480be);background-image:-webkit-gradient(linear,0 0,0 100%,from(#149bdf),to(#0480be));background-image:-webkit-linear-gradient(top,#149bdf,#0480be);background-image:-o-linear-gradient(top,#149bdf,#0480be);background-image:linear-gradient(to bottom,#149bdf,#0480be);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff149bdf', endColorstr='#ff0480be', GradientType=0);-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-sizing:border-box;box-sizing:border-box;-webkit-transition:width .6s ease;-moz-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}.progress .bar+.bar{-webkit-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);-moz-box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 1px 0 0 rgba(0,0,0,.15),inset 0 -1px 0 rgba(0,0,0,.15)}.progress-striped .bar{background-color:#149bdf;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(.25,rgba(255,255,255,.15)),color-stop(.25,transparent),color-stop(.5,transparent),color-stop(.5,rgba(255,255,255,.15)),color-stop(.75,rgba(255,255,255,.15)),color-stop(.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;-moz-background-size:40px 40px;-o-background-size:40px 40px;background-size:40px 40px}.progress.active .bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-moz-animation:progress-bar-stripes 2s linear infinite;-ms-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}.progress .bar-danger,.progress-danger .bar{background-color:#dd514c;background-image:-moz-linear-gradient(top,#ee5f5b,#c43c35);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#c43c35));background-image:-webkit-linear-gradient(top,#ee5f5b,#c43c35);background-image:-o-linear-gradient(top,#ee5f5b,#c43c35);background-image:linear-gradient(to bottom,#ee5f5b,#c43c35);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffc43c35', GradientType=0)}.progress-danger.progress-striped .bar,.progress-striped .bar-danger{background-color:#ee5f5b;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(.25,rgba(255,255,255,.15)),color-stop(.25,transparent),color-stop(.5,transparent),color-stop(.5,rgba(255,255,255,.15)),color-stop(.75,rgba(255,255,255,.15)),color-stop(.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress .bar-success,.progress-success .bar{background-color:#5eb95e;background-image:-moz-linear-gradient(top,#62c462,#57a957);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#57a957));background-image:-webkit-linear-gradient(top,#62c462,#57a957);background-image:-o-linear-gradient(top,#62c462,#57a957);background-image:linear-gradient(to bottom,#62c462,#57a957);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff57a957', GradientType=0)}.progress-striped .bar-success,.progress-success.progress-striped .bar{background-color:#62c462;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(.25,rgba(255,255,255,.15)),color-stop(.25,transparent),color-stop(.5,transparent),color-stop(.5,rgba(255,255,255,.15)),color-stop(.75,rgba(255,255,255,.15)),color-stop(.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress .bar-info,.progress-info .bar{background-color:#4bb1cf;background-image:-moz-linear-gradient(top,#5bc0de,#339bb9);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#339bb9));background-image:-webkit-linear-gradient(top,#5bc0de,#339bb9);background-image:-o-linear-gradient(top,#5bc0de,#339bb9);background-image:linear-gradient(to bottom,#5bc0de,#339bb9);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff339bb9', GradientType=0)}.progress-info.progress-striped .bar,.progress-striped .bar-info{background-color:#5bc0de;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(.25,rgba(255,255,255,.15)),color-stop(.25,transparent),color-stop(.5,transparent),color-stop(.5,rgba(255,255,255,.15)),color-stop(.75,rgba(255,255,255,.15)),color-stop(.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress .bar-warning,.progress-warning .bar{background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0)}.progress-striped .bar-warning,.progress-warning.progress-striped .bar{background-color:#fbb450;background-image:-webkit-gradient(linear,0 100%,100% 0,color-stop(.25,rgba(255,255,255,.15)),color-stop(.25,transparent),color-stop(.5,transparent),color-stop(.5,rgba(255,255,255,.15)),color-stop(.75,rgba(255,255,255,.15)),color-stop(.75,transparent),to(transparent));background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-moz-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.accordion-group{margin-bottom:2px;border:1px solid #e5e5e5;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.accordion-heading{border-bottom:0}.accordion-heading .accordion-toggle{display:block;padding:8px 15px}.accordion-inner{padding:9px 15px;border-top:1px solid #e5e5e5}.carousel{position:relative;margin-bottom:20px;line-height:1}.carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner>.item{position:relative;display:none;-webkit-transition:.6s ease-in-out left;-moz-transition:.6s ease-in-out left;-o-transition:.6s ease-in-out left;transition:.6s ease-in-out left}.carousel-inner>.item>a>img,.carousel-inner>.item>img{display:block;line-height:1}.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block}.carousel-inner>.active{left:0}.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%}.carousel-inner>.next{left:100%}.carousel-inner>.prev{left:-100%}.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0}.carousel-inner>.active.left{left:-100%}.carousel-inner>.active.right{left:100%}.carousel-control{position:absolute;top:40%;left:15px;width:40px;height:40px;margin-top:-20px;font-size:60px;font-weight:100;line-height:30px;color:#fff;text-align:center;background:#222;border:3px solid #fff;-webkit-border-radius:23px;-moz-border-radius:23px;border-radius:23px;opacity:.5;filter:alpha(opacity=50)}.carousel-control.right{right:15px;left:auto}.carousel-control:focus,.carousel-control:hover{color:#fff;text-decoration:none;opacity:.9;filter:alpha(opacity=90)}.carousel-indicators{position:absolute;top:15px;right:15px;z-index:5;margin:0}.carousel-indicators li{display:block;float:left;width:10px;height:10px;margin-left:5px;text-indent:-999px;background-color:#ccc;background-color:rgba(255,255,255,.25);border-radius:5px}.carousel-indicators .active{background-color:#fff}.carousel-caption{position:absolute;right:0;bottom:0;left:0;padding:15px;background:#333;background:rgba(0,0,0,.75)}.carousel-caption h4,.carousel-caption p{line-height:20px;color:#fff}.carousel-caption h4{margin:0 0 5px}.carousel-caption p{margin-bottom:0}.hero-unit{padding:60px;margin-bottom:30px;font-size:18px;font-weight:200;line-height:30px;color:inherit;background-color:#eee;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.hero-unit h1{margin-bottom:0;font-size:60px;line-height:1;letter-spacing:-1px;color:inherit}.hero-unit li{line-height:30px}

{#/*============================================================================
  #Components
==============================================================================*/ #}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  &:hover,
  &:focus{
    text-decoration: none;
  }
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
   #{$property}: $value;
}

{# /* // SVG Icons */ #}

.svg-small {
  width: 20px;
  height: 20px;
}

{# /* // Animations */ #}

@keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-moz-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-webkit-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@-o-keyframes fade{
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

.transition-soft {
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}
.transition-up {
  position: relative;
  top: -8px;
  @include prefix(transition, all 0.5s ease, webkit ms moz o);
  z-index: 10;
  pointer-events: none;
  &-active {
    top: 0;
    opacity: 1; 
    z-index: 100;
    pointer-events: all;
  }
}


{# /* // Buttons */ #}

.btn.facebook {
  line-height: 28px;
  background-color: #1977f2;
  color: white;
  border: 3px solid #0e65d6;
  &:hover,
  &:focus,
  &:active{
    background-color: #1977f2;
    color: white;
  }
  svg{
    display: inline-block;
    height: 24px;
    margin-right: 15px;
    vertical-align: middle;
    fill: #fff;
  }
}
.btn-shipping{
  width: 53%;
  display: inline-block;
  border-width: 1px;
}

.btn-transition {
  position: relative;
  overflow: hidden;
  .transition-container {
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    margin-top: -70px;
    text-align: center;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    cursor: not-allowed;
    pointer-events: none;
    &.active {
      top: 50%;
      margin-top: -10px;
      &.btn-transition-success{
        margin-top: -10px
      }
    } 
  } 
} 

.link-module,
.btn-module{
  display: block;
  position: relative;
  float: left;
  width: 100%;
  clear: both;
  padding: 10px 0;
  box-sizing:border-box;
}
.link-module{
  padding: 15px 0;
  font-size: 16px;
  &:hover{
    opacity: 0.6;
  }
  &.no-border{
    margin: 0;
    border: none;
  }
  &-content {
    display: inline-block;
  }
}

.link-module-icon {
  display: inline-block;
  height: 20px;
  width: 18px;
  float: left;
  margin-right: 10px;
}

{# /* // Modals */ #}

.modal{
  width: 800px;
  &-small .modal-body {
    height: auto;
    min-height: initial;
  }
  &.fade.in{
    top: 5%;
  }
  margin-left: -375px;
  border-radius:0;
  &-header{
    h3{
      margin-top: 2px;
      text-transform: uppercase;
      font-size: 18px;
      font-weight: normal;
    }
    .nav-tabs-container{
      border:0;
    }
    &.with-tabs{
      padding:0;
    }
  }
  &-body{
    min-height: 200px;
    max-height: 500px;
  }
  &-footer{
    width: 100%;
    padding: 15px;
    box-sizing: border-box;
    box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.06), 0 0 24px 0 rgba(0, 0, 0, 0.08);
  }
  &-xs-footer-fixed {
    box-sizing: border-box;
    padding: 0 15px;
  }
}

.modal-with-fixed-footer {
  display: flex;
  flex-direction: column;
  height: 100%;
  .modal-scrollable-area {
    height: 100%;
    overflow: auto;
  }
}

.modal-backdrop {
  z-index: 1049;
}

.modal-open{
  overflow: hidden;
}

{# /* Modal docked to the right */ #}

.modal-right{
  position: fixed;
  top: 0;
  right: 0;
  width: 500px;
  height: 100%;
  z-index: 1048;
  border-left: 1px solid #eee;
  overflow-y: scroll;
  -webkit-overflow-scrolling: touch;
  text-align: left;
  &-header{
    padding: 25px 15px 0 15px;
    box-sizing:border-box;
  }
  &-body{
    padding: 0 15px 15px 15px;
  }
}

.backdrop{
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1045;
  width: 100%;
  height: 140%; /* Height to always take full height even then the mobile nav moves up on scroll or the device keyboard is visible*/
  background-color: rgba(0,0,0,0.5); /* Dark overlay when cart or search is active */
}

{# /* Modals v2 - applied for now only on hamburguer panel */ #}

.new-modal {
  position: fixed;
  top: 0;
  display: block;
  width: 80%;
  height: 100%;
  -webkit-overflow-scrolling: touch;
  overflow-y: auto;
  transition: all .2s cubic-bezier(.16,.68,.43,.99);
  z-index: 4200;
  &.modal-full {
    width: 100%;
  }
  &.modal-top{
    top: -100%;
  }
  &.modal-bottom{
    top: 100%;
  }
  &.modal-left{
    left: -100%;
  }
  &.modal-right{
    right: -100%;
  }
  &.modal-top.modal-show,
  &.modal-bottom.modal-show {
    top: 0;
  }
  &.modal-left.modal-show {
    left: 0;
  }
  &.modal-right.modal-show {
    right: 0;
  }
}

{# /* // Chips */ #}

.chip {
  position: relative;
  display: inline-block;
  margin: 0 5px 10px 0;
  padding: 5px 30px 5px 10px;
  white-space: normal;
  word-break: break-word;
  border: none;
  &:focus {
    outline: 0;
  }
  &-remove-icon {
    position: absolute;
    top: 6px;
    right: 8px;
    display: inline-block;
    width: 10px;
    height: 18px;
  }
}

{# /* // Dividers */ #}

.featurette-or-divider {
  margin: -9px auto 24px auto;
}

{# /* // Badges */ #}

.badge{
    display: inline-block;
    height: 20px;
    width: 20px;
    padding:0 ;
    font-size: 12px;
    font-weight: 700;
    line-height: 19px;
    text-align: center;
    border-radius: 100%;
}

{# /* // Forms */ #}

.radio-group-label{
  padding: 0 10px;
  margin-bottom: 10px;
}
.radio-button{
  width: 100%;
  float: left;
  clear: both;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  &.disabled{
    opacity: 0.6;
    cursor: not-allowed;
    input[type="radio"] {
      cursor: not-allowed;
    }
  }
  &-content{
    position: relative;
    width: 100%;
    float: left;
    padding: 20px 10px; 
    clear: both;
    box-sizing: border-box;
    overflow: hidden;
  }
  &-icons-container{
    position: absolute;
    top: 18px;
    left: 10px;
  }
  &-icons{
    position: relative;
    float: left;
  }
  &-icon{
    border-radius: 50%;
    width: 16px;
    height: 16px;
  }
  input[type="radio"]{
    display: none;
    & +  .radio-button-content .unchecked{
      float: left;
    }
    & +  .radio-button-content .checked{
      position: absolute;
      left: 10px;
      top: 10px;
      width: 0;
      height: 0;      
      @include prefix(transform, translate(-50%,-50%), webkit ms moz o);
      @include prefix(transition, all 0.2s , webkit ms moz o);
    }
    &:checked + .radio-button-content .checked{
      width: 14px;
      height: 14px;
    }
    & + .radio-button-content .radio-bg-selected{
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      opacity:0;
      @include prefix(transition, all 0.3s , webkit ms moz o);
      @include prefix(transform, translate(-100%,0), webkit ms moz o);
    }
    &:checked + .radio-button-content .radio-bg-selected{
      left:0;
      opacity: 1;
      @include prefix(transform, translate(0,0), webkit ms moz o);
    }
  }
  &-label{
    width: calc(100% - 35px);
    float: left;
    padding-left: 35px;
  }

}
.checkbox-container{
  .checkbox {
    position: relative;
    display: block;
    margin-bottom: 15px;
    padding-left: 35px;
    font-size: 14px;
    line-height: 22px;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    cursor: pointer;
    &-icon {
      position: absolute;
      left: 0;
      display: block;
      width: 16px;
      height: 16px;
      &:after {
        position: absolute;
        top: 0px;
        left: 6px;
        display: none;
        width: 3px;
        height: 11px;
        content: '';
        @include prefix(transform, rotate(45deg), webkit ms moz o);
      }
      &.with-color:after {
        display: none;
      }
    }
    &-icon-color {
      position: absolute;
      top: 3px;
      left: 3px;
      width: 14px;
      height: 14px;
    }
    &-text {
      display: inline-block;
      padding-top: 2px;
    }
  }
  input {
    display: none;
    &:checked ~ .checkbox {
      opacity: 1;
      .checkbox-icon:after {
        display: block;
      }
    }
  }
}

.input-clear-content {
  position: absolute;
  right: 3px;
  bottom: 3px;
  width: 22px;
  height: 34px;
  padding: 1px;
  cursor: pointer;
  &:before {
    display: block;
    margin: 9px 0 0 5px;
  }
}

.input-shipping{
  float: left;
  width: 45%;
  border-width: 1px;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  margin: 0;
  -webkit-appearance: none;
}

input[type=number] {
  -moz-appearance: textfield;
}

.quantity{

  &-label{
    margin-bottom: 5px;
    font-size: 12px;
    text-transform: uppercase;
  }
  &-input-container{
    position: relative;
  }
  input::-webkit-inner-spin-button,
  input::-webkit-outer-spin-button{
    -webkit-appearance: none;
    margin: 0;
  }
  input.form-control{
    padding-right: 30px;
    -moz-appearance: textfield;
    text-align:center;
  }
  .quantity-nav {
    position: absolute;
    top: 0;
    height: 100%;
    text-align: center;

    &-right{
      right: 0;
    }
    &-left{
      left: 0;
    }
  }
  .quantity-btn {
    cursor: pointer;
    padding: 2px 10px;
    box-sizing: border-box;
    &:hover{
      opacity: 0.6;
    }
  }
}

.form-group{
  .quantity-btn {
    height: 19px;
    margin:3px 3px 0 0; 
    padding: 0px 10px;
    &:last-child{
      margin-top: -3px;
    }
  }
}

.form-group-small .quantity-btn:last-child{
  height: 28px;
  margin: 1px 0 0 0;
  line-height: 28px;
}

.form-group-big{
  .quantity-btn {
    height: 23px;
    margin:3px 3px 0 0; 
    padding: 2px 10px;
  }
}

.input-error{
  border-color: red!important;
}

.list-readonly{
  .list-item{
    float: left;
    width: 100%;
    padding: 20px 15px;
    box-sizing: border-box;
  }
  .radio-button-label{
    width: 100%;
    padding: 0;
  }
  .radio-button-content{
    padding: 0;
  } 
}

{# /* // Alerts and notifications */ #}

.alert{
  clear: both;
  padding: 8px;
  border-radius: 0;
  border: 0;
  text-align: center;
  text-shadow: none;
}

{# /* // Tabs */ #}

.nav-tabs{
  margin-bottom: 0px;
  border-bottom: 0;
  > li{
    display: inline-block;
    float: none;
  }
  .tab-link {
    padding: 12px 15px;
    text-transform: uppercase;
  }
  .tab-link,
  .tab-check-link{
    border-radius: 0;
    border:0;
  }
  li.tab-check{
    position: relative;
    margin: 2px 5px 2px 2px;
    .tab-check-icon{
      display:none;
      position: absolute;
      top: -7px;
      right: -5px;
    }
    &.active{
      .tab-check-link,
      .tab-check-link:focus{
        background-color: transparent;
        border: 0;
        line-height: 12px;
        outline-offset:0;
      }
      .tab-check-icon{
        display: block;
      }
    }
  }
  .tab-check-link{
    padding:2px;
    background-color: transparent;
    &:hover,
    &:focus{
      opacity: 0.8;
      background-color: transparent;
      outline-offset:0;
    }
  }
  .tab-check-link-text{
    padding: 10px;
    line-height: 12px;
  }
}

{# /* // Pagination */ #}

.pagination{
  font-size: 16px;
}

{# /* // User content */ #}

.user-content{
  iframe {
    width: calc(100% + 30px);
    margin: 0 0 0 -15px;
  }
  ul {
    list-style: disc inside none;
  }
  ol {
    list-style: decimal inside none;
  }
  ul,
  ol{
    margin: 0 0 10px;
  }
  h1,
  h2,
  h3,
  h4,
  h5{
    margin: 10px 0;
  }
  p {
    margin-bottom: 10px;
  }
  img{
    margin: 10px auto;
    max-width: 100%!important;
    height: auto!important;
    &.user-page-logos{
      width: 45px;
      margin-top: 5px;
    }
  }
}

{# /* // Tables */ #}

.table {
  td,
  th {
    border-top: 0;
  }
}

{# /* // Images */ #}

.card-img{
  margin: 0 5px 5px 0;
  border: 1px solid #00000012;
  @include prefix(box-shadow, 0 1px 0px 0 rgba(0, 0, 0, 0.05), webkit ms moz);
  &-medium{
    height: 35px;
  }
  &-big{
    height: 50px;
  }
}

{# /* // Welcome */ #}

.welcome-container {
  .welcome-message {
    margin: 20px 0;
    padding: 40px;
  }
  &.full-container {
    width: 100%;
    margin: 10px 0 40px 0;
    .welcome-message {
      padding: 80px 40px;
      .welcome-message-text {
        display: block;
        max-width: 70%;
        margin: 0 auto 40px auto;
      }
    }
  }
}

{# /*  // Social widgets */ #}

.fb-page{
  width: 300px;
  clear: both;
  margin: 0 auto 20px auto;
  border: 1px solid #e0e0e0;
  background: white;
  font-family: Helvetica, Arial, sans-serif;
  font-size: 11px;
  text-align: left;
  color: #383838;
  &-title{
    font-family: Helvetica, Arial, sans-serif!important;
  }
  &-box{
    background: #fff;
    border-color: #EBEDF0 #dfe0e4 #d0d1d5;
    border-radius: 2px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .12);
  }
  &-img-container{
    position: relative;
    flex: 0 0 50px;
    width: 50px;
    height: 50px;
    border: 2px solid #fff;
    box-shadow: 0 1px 6px rgba(0, 0, 0, .5);
  }
  &-img{
    position: absolute;
    left: 50%;
    top: 50%;
    width: 100%;
    @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
  }
  &-icon{
    line-height: 50px;
    opacity: 0.1;
  }
  &-link{
    font-family: sans-serif;
    font-size: 12px;
    text-decoration: underline;
    color: #383838;
    svg{
      fill: #4267b2;
    }
  }
  .fb-like{
    padding: 5px 10px;
    border-radius: 3px;
    color: white;
    background: #4267b2;
    font-size: 12px;
    font-family: Helvetica, Arial, sans-serif;
    &:hover{
      opacity: 0.8;
      text-decoration: none;
    }
    svg {
      fill: white;
    }
  }
  &-footer{
    background: #f5f6f7;
    text-align: center;
  }
}

.instafeed-module {
  .instafeed-item {
    position: relative;
    float:left;
    .instafeed-link {
      position: relative;
      display: block;
      padding-top: 100%;
      overflow: hidden;
    }
    .instafeed-img {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .instafeed-info {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      padding: 0;
      font-size: 10px;
      opacity: 0;
      @include prefix(transition, all 0.3s ease, webkit ms moz o);
      &:hover {
        opacity: 1;
      }
      .instafeed-info-item {
        position: relative;
        display: inline-block;
        margin: 35% 5px 0;
        .instafeed-icon {
          display: block;
          margin: 0;
          font-size: 18px;
        }      
      }
    }
  }
}

{# /* // Video */ #}

.video-modal {
  position: absolute;
  width: 100%;
  height: 100%;
  .embed-responsive {
    height: 100%;
    padding-bottom: 0;
  }
}

{# /* // Captcha */ #}

.g-recaptcha {
  float: left;
  width: 100%;
  margin-bottom: 15px;
  clear: both;
}

.g-recaptcha > div {
  margin: 0 auto;
}

.grecaptcha-badge {
  bottom: 100px !important;
}

{# /* // Modules with image and text */ #}

.module-wrapper {
  position: relative;
  min-height: 300px;
}

.module-image {
  img {
    width: 100%;
    display: block;
    margin: 0 auto;
  }
  .placeholder{
    position: relative;
    padding-top: 70%;
    text-align: center;
    background: #eee;
    .module-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      margin-left: -28px;
      margin-top: -28px;
      opacity: 0.2;
    }
  }
}

.module-text {
  position: absolute;
  width: 32%;
  height: 100%;
  .text-container {
    position: absolute;
    top: 50%;
    left: 0;
    z-index: 9;
    padding: 30px 30px 30px 0;
    transform: translate(-0%, -50%);
    .module-text-title {
      margin-bottom: 15px;
      display: -webkit-box;
      font-size: 24px;
      font-weight: 700;
      line-height: 26px;
      text-transform: uppercase;
      overflow: hidden;
      text-overflow: ellipsis;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
    }
    .module-text-paragraph {
      margin-bottom: 25px;
      display: -webkit-box;
      overflow: hidden;
      text-overflow: ellipsis;
      -webkit-line-clamp: 8;
      -webkit-box-orient: vertical;
    }
    .btn-small {
      padding: 7px 15px;
    }
  }
}


{#/*============================================================================
  #Header and nav
==============================================================================*/ #}

{# /* // Nav desktop */ #}

.desktop-nav-item{
  .desktop-nav-link{
    @include text-decoration-none();
    &:hover,
    &:focus{
      opacity: 0.6;
      background-color:transparent;
    }
    &:hover + .desktop-nav-list{
      display: block;
      visibility: visible;
      opacity: 1;
    }
  }
  .desktop-nav-item{
    margin: 0; 
    .desktop-nav-link{
      display: block;
      padding:10px;
      text-transform: none;
    }
  }
  .desktop-nav-arrow{
    float: right;
  }
  .desktop-nav-list:hover{
    display: block;
    visibility: visible;
    opacity: 1;
  }
  .desktop-nav-list{
    display: none;
    position: absolute;
    top: 20px; 
    width: 100%;
    min-width: 180px;
    max-width: 300px;
    text-align: left;
    visibility: hidden;
    opacity: 0;
    transition: visibility 0s, opacity 0.1s linear;
    z-index: 9;
  }
  .desktop-nav-item{
    width: 100%;
    .desktop-nav-list{
      top:0;
      left: 100%;
      margin: 0;
    }
  }
}

.head-top-fixed {
  position: fixed;
  top: -140px;
  height: auto;
  width: 100%;
  padding: 10px 0;
  z-index: 1001;
  transition: top .5s;
  &.visible {
    top: 0;
    transition: top .12s;
  }
}

{# /* // Search */ #}

.search-suggest{
  position: absolute;
  top: 45px;
  left: 0;
  z-index: 2000;
  display: none;
  width: 100%;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
  -webkit-overflow-scrolling: touch;
  &-list{
    float: left;
    width: 100%;
    margin: 0;
    padding: 0;
  }
  &-item{
    list-style-type: none;
  }
  &-link{
    position: relative;
    display: block;
    float: left;
    width: 100%;
    padding: 5px 10px;
    box-sizing: border-box;
    border-bottom: 1px solid rgba(0, 0, 0, 0.12);
    list-style-type: none;
    @include text-decoration-none();
  }
  &-text{
    display: inline-block;
    float: left;
    width: 70%;
  }
  &-image-container{
    width: 40px;
    float: left;
    margin-right: 10px;
    padding-top: 3px;
  }
  &-image{
    max-width: 100%;
    max-height: 45px;
  }
  &-icon{
    position: absolute;
    right: 10px;
    top: 50%;
    margin-top: -7px;  
    width: 30px;
  }
  &-all-link{
    min-height: initial;
    padding: 10px;
    text-align: center;
    text-decoration: underline;
  }
}

{# /* // Logo */ #}

.logo-fixed{
  max-height: 50px;
}

{#/*============================================================================
  #Product grid
==============================================================================*/ #}

{# /* // Filters */ #}

.filters-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 30000;
  width: 100%;
  height: 100%;
  .filters-updating-message {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 80%;
    text-align: center;
    @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
    * {
      font-size: 24px;
      font-weight: normal;
    }
  }
}

.filter-input-price-container {
  position: relative;
  display: inline-block;
  width: calc(50% - 25px);
  margin-right: 5px;
  .filter-input-price {
    height: auto;
    padding: 3px 6px;
    font-size: 11px;
  }
}

{# /* // Grid item */ #}

.item-small:hover{
  box-shadow: none;
}

.item-buy-variants {
  position: absolute;
  top: 30%;
  left: 5px;
  z-index: 100;
  width: 120%;
  padding: 10px 20px;
  transition: all .1s cubic-bezier(.16,.68,.43,.99);
  opacity: 0;
  @include prefix(transform, translate(0, -10%), webkit ms moz o);
  pointer-events: none;
  box-shadow: 0 0 10px rgba(0, 0, 0, .5);
  &.item-buy-visible {
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    opacity: 1;
    @include prefix(transform, translate(0, 0), webkit ms moz o);
    pointer-events: auto;
  }
  .item-buy-close {
    position: absolute;
    top: 15px;
    right: 20px;
  }
  .item-buy-arrow{
    position: absolute;
    top: -8px;
    left: 30%;
    width: 0;
    height: 0;
    pointer-events: none;
  }
  .quantity input.form-control{
    padding-left: 30px;
  }
}

.label {
  padding: 5px 10px;
  text-transform: uppercase;
  font-weight: normal;
  white-space: normal;
  border-radius: 0;
}

{#/*============================================================================
  #Product detail
==============================================================================*/ #}

{# /* // Image */ #}

.cloud-zoom-wrap{
  position:relative;
}
.cloud-zoom-big {
  /* Importants necesaries to overide plugin inline styles */
  width: 100%!important;
  overflow:hidden;
  background-color:#fff;
  z-index: 1!important;
}
.mousetrap{
  /* Importants necesaries to overide plugin inline styles */
  width: 100%!important;
  z-index: 2!important;
}
.cloud-zoom-loading {
  color:white;
  background:#222;
  padding:3px;
  border:1px solid #000;
}
.quickshop-image{
  height: auto;
  max-width: 100%;
}

.desktop-zoom-big {
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 1;
  background-position: 50% 50%;
  opacity: 0;
  transition: opacity 0.5s;
}

.desktop-zoom-container {
  cursor: zoom-in;
}

.desktop-zoom-container:hover .product-slider-image:not(.desktop-zoom-big) {
  opacity: 0;
}

.desktop-zoom-container:hover .desktop-zoom-big {
  opacity: 1;
}

{# /* // Form and info */ #}

.product-payment-logos-img{
  height: 20px;
  margin: 0 1px 0 0;
}
.payments-card-img{
  height: 26px;
}
.product-check-icon-gw{
  position: relative;
  top: 0;
  right: 0;
  display: inline-block;
  margin-top: -3px;
}
.payments-disabled-select{
  top: 0;
  left: 0;
  cursor: not-allowed;
}
.payments-disabled-select.hidden{
  display: none!important;
}
.btn-variant-container{
  margin-bottom: 15px;
  clear: both;
}
.variant-label{
  display: block;
  clear: both;
  text-transform: uppercase;
  font-size: 12px;
  letter-spacing: 1px;
  opacity: 0.6;
}
.variant-select{
  width: 100%;
  margin: 5px 0 0 0;
  text-transform: uppercase;
  font-size: 12px;
  letter-spacing: 3px;
}

.variant-label-small,
.variant-select-small {
  font-size: 10px;
  font-weight: normal;
  opacity: 1;
}
.variant-select-small {
  border-width: 1px;
}
.btn-variant {
  width: auto;
  float: left;
  padding: 1px;
  display: inline-block;
  cursor: pointer;
  margin: 5px 10px 10px 0;
  height: 24px;
  .btn-variant-content {
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 24px;
    opacity: 0.7;
  }
  &.selected .btn-variant-content{
    opacity: 1;
  }
  &.btn-variant-custom{
    min-height: 24px;
    height: auto;
  }
  &.btn-variant-custom .btn-variant-content {
    width: auto;
    height: auto;
    padding: 2px 8px;
  }
}
.stockalarm-trigger {
  margin-top: 15px;
}

{# /* // Shipping calculator */ #}

.product-shipping-calculator{
  label{
    cursor: default;
  }
  li input[type="radio"]:checked + .shipping-option{
    border:0px solid;
  }
  .radio-button-icons{
    display: none
  }
}

{#/*============================================================================
  #Contact page
==============================================================================*/ #}
.map{
  height: 400px;
  width: 100%;
}

{#/*============================================================================
  #Cart page
==============================================================================*/ #}

{# /* // Cart page */ #}

.cart-table-header{
  margin: 20px 0 10px 0;
  padding-bottom: 10px;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 12px;
}
.cart-table-row{
  position: relative;
  padding: 10px;
  box-sizing: border-box;
  clear: both;
}
.cart-quantity-btn,
.cart-btn-delete{
  float: left;
  clear: both;
  padding: 3px;
  display: inline-block;
  background: transparent;
  font-size: 16px;
  opacity: 0.8;
  &:hover{
    opacity: 0.6;
  }
}
.cart-quantity-btn-small{
  padding: 1px;
}
.cart-btn-delete{
  float: right;
  border:0;
}
.cart-quantity-input-container{
  svg{
    padding: 6px 14px;
  }
  .fa-cog{
    display: none;
  }
  &-spinner{
    position: absolute;
    left: 50%;
    width: 40px;
    margin-left: -20px;
    text-align: center;
  }
}
.cart-quantity-svg-icon{
  width: 16px;
  height:16px;
}
.cart-delete-svg-icon{
  width: 13px;
  height: 13px;
}

{# /* // Ajax cart */ #}

.ajax-cart-header{
  padding: 10px 15px 0 15px;
}
.ajax-cart-table-header{
  padding: 10px 0;
  overflow: hidden;
  font-weight: normal;
  text-transform: uppercase;
}
.ajax-cart-item {
  position: relative;
  float: left;
  width: 100%;
  padding: 10px 0;
  clear: both;
  &-col{
    float: left;
  }
  &-image-col{
    width: 12%;
  }
  &-desc-col{
    width: 53%;
    padding-left: 10px;
  }
  &-unit-price{
    float: left;
    width: 100%;
    margin:5px 0 2px 0;
  }
  &-subtotal{
    width: 25%;
  }
  &-delete-col{
    width: 10%;
  }
}
.ajax-cart-promotions{
  .cart-promotion-detail{
    float: left;
    width: 65%;
    text-align: left;
  } 
  .cart-promotion-number{
    position: absolute;
    right: 0;
    bottom: 0;
    float: right;
    text-align: right;
    font-weight: bold;
  } 
}
.ajax-cart-shipping-calculator{
  padding: 10px;
  box-sizing:border-box;
}
.cart-subtotal-header{
  margin-right: 10%;
}

{# /* // Totals */ #}

.cart-subtotal{
  clear: both;
  margin-bottom: 10px;
}
.total-promotions-row{
  float: right;
  width: 100%;
  margin-bottom: 5px;
  position: relative;
  .cart-promotion-number{
    margin-left: 5px;
  }
}

{#/*============================================================================
  #Construction page
==============================================================================*/ #}

.construction-page-svg{
  width: 6%;
  margin-top: 20px;
  &.wiggle {
    -webkit-animation: wiggle 1.5s infinite;
    animation-delay: 2s;
  }
}
@-webkit-keyframes wiggle {
  0% {
    -webkit-transform:rotate(0deg);
  }
  25% {
    -webkit-transform:rotate(-4deg);
  }
  50%{
     -webkit-transform:rotate(4deg);
  }
  75% {
    -webkit-transform:rotate(0deg);
  }
  100%{
    -webkit-transform:rotate(0deg);
  }
}
.password-footer-tall{
  margin-top: 130px;
}

{#/*============================================================================
  #Footer
==============================================================================*/ #}

.social-link {
  display: inline-block;
  height: 70px;
  width: 70px;
  margin: 0 25px;
  padding: 10px 0;
  border-radius: 50%;
  box-sizing: border-box;
}

.footer {
  padding: 30px 0;  
  &-title {
    margin-bottom: 5px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 14px;
    font-weight: bold;
  }
  &-nav-item{
    margin-bottom: 5px;
    list-style: none;
    clear: both;
    a:hover{
      text-decoration: underline;
    }
  }
}

.seals{
  .custom-seals-container, 
  .afip, 
  .ebit{
    float: left;
    width: 100%;
  }
  img {
    max-height: 70px;
    max-width: 110px;
  }
  div {
    display: inline-block;
    margin: 5px auto;
  }
  .afip {
    display: inline-block;
    float: right;
    img {
      max-height: 40px;
      vertical-align: middle;
    }
  }
  .custom-seals-container{
    .custom-seal{
      margin: 5px auto;
    }
    .custom-seal-img,
    .custom-seal-img img {
      max-width: 120px;
      max-height: 60px;
    }
  }
}

.footer-payship-img {
  width: auto;
  height: 30px;
  margin: 0 5px 0 0;
}
.footer-legal {
  padding: 20px 0;
  font-size: 10px;
  letter-spacing: 1px;
  text-transform: uppercase;
  .powered-by-logo { 
    width: 175px; 
  }
}


{#/*============================================================================
  #Media queries
==============================================================================*/#}


{# /* // Min width 770px */ #}

@media (min-width: 770px) {
    
  {# /* //// Components */ #}

  .no-slide-effect-md{
      -webkit-transition: 0.001s ease !important;
      transition: 0.001s ease !important;
  }
}

{# /* // max width 767px  */ #}

@media (max-width: 767px) {

  {# /* //// Components */ #}

  {# /* Wrappers */ #}

  .main-content{
    padding-top: 94px;
  }
  .has_store_bar_thin .main-content{
    padding-top: 60px;
  }

  body.hamburger-panel-animated{
    height: 100%;
    overflow: hidden;
  }

  .frame-title {
    margin-top: 10px;
    font-size: 16px;
  }

  {# /* Buttons and links */ #}

  .link-module,
  .btn-module{
    display: block;
    position: relative;
    float: left;
    width: 100%;
    clear: both;
    padding: 10px 0;
    margin-bottom: 20px;
    box-sizing:border-box;
    &:hover{
      opacity: 0.8;
    }
  }
  .btn-module {
    padding: 10px 40px 10px 10px;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    text-align: left;
  }
  .link-module {
    margin-bottom: 0;
    padding: 20px 0;
    text-align: left;
  }
  .link-module-icon-right,
  .btn-module-icon-right {
    position: absolute;
    right: 10px;
    float: right;
    display: block;
    top: 50%;
    margin-top: -10px;
  }

  {# /* Forms */ #}

  select{
    height: 40px;
  }

  /* Hack to avoid autozoom on IOS */

  input:not([type=submit]),
  textarea,
  select.form-control,
  select{
    font-size: 16px;
  }

  .form-group-big{
     .quantity-btn{
      height: 45px;
      padding-top: 12px;
      margin: 3px;
      font-size: 18px;
      &:last-child{
        margin: 3px;
      }
    } 
  }
  .quantity{
    padding: 10px 0;
    .quantity-label{
      width: 50%;
      float: left;
      margin-top: 15px;
    }
    .quantity-input-container{
      width: 45%;
      float: right;
    }
    input.form-control{
      padding: 0 35px;
    }
  }
  
  {# /* Tabs */ #}

  .nav-tabs{
    padding-top: 5px;
    li.tab-check{
      margin: 2px 5px 8px 2px;
    }
  }

  {# /* Modals */ #}

  .modal-backdrop.fade.in{
    opacity:0;
    &.modal-backdrop-zindex-top{
      opacity: .8;
      z-index: 4300;
    }
  }
  .sheet-bottom-backdrop{
    background-color:#000;
    z-index: 4200;
  }
  .sheet-bottom-backdrop.fade.in{
    opacity:.6;
  }
  .modal-right{
    overflow:initial;
  }
  .modal:not(.modal-xs-centered) .modal-header{
    padding:0;
  }
  .modal-xs{
    position: fixed;
    top: 0;
    z-index: 4200;
    width: 100%;
    height: 100%;
    margin: 0;
    border:0;
    opacity: 1;
    box-sizing:border-box;
    overflow: auto;
    &-centered{
      left: 50%;
      width: 80%;
      height: auto;
      @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
      .modal-body {
        max-height: 400px;
      }
      &.fade.in{
        top: 50%;
      }
    }
    &.modal-zindex-top{
      z-index: 4400;
    }
    &.sheet-bottom {
      top: initial!important;
      left: 0;
      bottom: 0;
      padding: 50% 0 0 0;
      z-index: 4300;
    }

    &-dialog{
      display: flex;
      flex-direction: column;
      height: 100%;
      margin: 0;
      .modal-content{
        height: 100%;
        overflow: auto;
        box-shadow:none;
        border: 0;
      }
    }
    
    &-footer-fixed {
      min-height: 70px;
      width: 100%;
      @include prefix(box-sizing, border-box, webkit ms moz);
      padding: 15px;
      z-index: 9999;
      @include prefix(box-shadow, 0px -4px 3px rgba(50, 50, 50, 0.1), webkit ms moz);
      &.big {
        min-height: 120px;
      }
    }

    {# To avoid IOS bottom gap when modal is scrolled #}
    &-tall {
      height: calc(100% + 70px);
      .modal-xs-footer-fixed {
        margin-bottom: 70px;
      }
    }

    {# Modal styles for all modals #}
    &-header{
      min-height:20px;
      position: relative;
      display: block;
      padding: 20px 15px;
      clear: both;
      text-decoration: none;
      ms-word-break: break-all;
      word-wrap: break-word;
      -webkit-hyphens: auto;
      -moz-hyphens: auto;
      hyphens: auto;
      -webkit-tap-highlight-color:rgba(0,0,0,0);
      box-shadow: 0 2px 2px 0 rgba(0,0,0,.04), 0 3px 1px -2px rgba(0,0,0,.04), 0 1px 5px 0 rgba(0,0,0,.04);
      &.sheet-bottom-header{
        text-align:center;
        .btn,
        .btn-link{
          position:absolute;
        }
        .btn-primary{
          padding: 5px;
          font-size:12px;
          font-weight: normal;
        }
        .btn-left{
          left:15px;
          top: 22px;
        }
        .btn-right{
          right: 15px;
          top: 10px;
        }
      }
    }
    &-header-text{
      display: inline-block;
      clear: both;
      font-size: 18px;
      &.modal-xs-right-header-text{
        margin-left: 30px;
      }
    }
    &-header-icon{
      position: absolute;
      top: 20px;
      right: 14px;
      &.modal-xs-right-header-icon{
        left: initial;
        right: initial;
      }
    }
    &-body{
      height: 100%;
      max-height: initial;
      padding:10px 10px 40px 10px;
      box-sizing: border-box;
      overflow: initial;
      &-list{
        padding:0 0 200px 0;
        overflow-y:auto;
      }
    }
    &-list-item{
      position: relative;
      display: block;
      clear: both;
      padding: 20px 15px;
      text-decoration: none;
      font-size: 14px;
      &.selected{
        .modal-xs-radio-icon svg{
          visibility: visible;
        }
      }
    }
    &-radio-icon-container {
      width: 12%;
      display: inline-block;
      float: left;
    }
    &-radio-icon {
      height: 20px;
      width: 12px;
      display: inline-block;
      padding: 0px 4px;
      border-radius: 100%;
      cursor: pointer;
      opacity: 0.7;
      svg{
        visibility: hidden;
      }
    }
    &-radio-text {
      width: 88%;
      display: inline-block;
    }
  }

  .modal .modal-footer {
    box-shadow: none;
  }

  .sticky-cta {
    position: -webkit-sticky;
    position: sticky;
    bottom: 0;
    min-height: 80px;
    width: 100vw;
    margin-left: -10px;
    @include prefix(box-sizing, border-box, webkit ms moz);
    padding: 10px;
    z-index: 9999px;
    @include prefix(box-shadow, 0px -1px 10px 1px rgba(0,0,0,0.08), webkit ms moz);
    &.big {
      min-height: 110px;
    }
  }

  {# /* Modal animated from right */ #}

  .modal-xs-right{
    right: inherit;
    left: inherit;
    @include prefix(box-shadow, -4px 0 17px 0 rgba(0,0,0,0.23), webkit ms moz);
    -webkit-overflow-scrolling: touch;
    &.modal.fade.in,
    &.modal.fade{
      left: 0;
      top: 0;
    }
    &.mobile-nav-subcategories-panel{
      top: 95px;
      z-index: 3000;
    }
  }

  .modal-xs-right.modal.fade.in,
  .modal-xs-right-in{
    transition: all .3s cubic-bezier(.16,.68,.43,.99);
    @include prefix(transform, translate3d(0,0,0), webkit ms moz o);
  }

  {# /* Modal animated from bottom */ #}

  .modal-xs-bottom.modal.fade.in,
  .modal-xs-bottom-in{
    left: 0;
    top: 0;
    @include prefix(transform, translate3d(0,0,0), webkit ms moz o);
  }

  .modal-xs-bottom.modal.fade.in,
  .modal-xs-bottom-in{
    left: 0;
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    @include prefix(transform, translate3d(0,0,0), webkit ms moz o);
  }

  {# /* Mobile Paginator */ #}

  .pagination{
    &-input-container{
      width: 80%;
      &-wide{
        width: 90%;
      }
      input.pagination-input{
        height: 30px;
        width: 50px;
        margin: 0px 5px 5px 0;
        padding: 7px;
      }
    }

    .pagination-arrow-link{
      &:hover,
      &:focus{
        @include text-decoration-none();
      }
      .pagination-arrow-prev,
      .pagination-arrow-next {
        margin-top: 5px;
        width: 10%;
      }
    }
  }

  {# /* User content */ #}

  .user-content{
    width: 100%;
    img {
      max-width: 80%!important;
      height: auto!important;
      width: auto;
    }
    table{
      width: 100%!important;
    }
  }

  {# /* Images */ #}

  .card-img{
    &-big{
      height: 60px;
    }
  }

  {# /* Welcome */ #}

  .welcome-container {
    .welcome-message {
      padding: 40px 10px;
      .welcome-message-text {
        max-width: 80%;
      }
    }
    &.full-container {
      .welcome-message {
        padding: 70px 10px;
        .welcome-message-text {
          margin: 0 auto 40px auto;
        }
      }
    }
  }

  {# /* Modules with image and text */ #}

  .module-text {
    position: relative;
    float: left;
    width: 100%;
    .text-container {
      position: relative;
      padding: 20px 15px;
      transform: none;
      .module-text-paragraph {
        -webkit-line-clamp: 6;
      }
    }
  } 

  {# /* //// Header and nav */ #}
  
  {# /* Nav mobile */ #}
  
  .btn-hamburger-icon{
    width: 25px;
    height: 25px;
    margin-top: 5px;
    cursor: pointer;
  }
  .modal-active{
  margin: 0;
  height: 100%;
  overflow: hidden;
  .site-overlay{
    display: block;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 4100;
    background-color: rgba(0,0,0,.5);
    -webkit-animation: fade .5s;
    -moz-animation: fade .5s;
    -o-animation: fade .5s;
    animation: fade .5s;
  }
}

.hamburger-panel{
    box-shadow: none;
    .btn-hamburger-close {
        float: right;
        padding: 10px 0;
        font-size: 18px;
    }
    .list-items {
        padding: 55px 0 10px;
        .hamburger-panel-link {
            display: block;
            padding: 20px;
            letter-spacing: 1px;
            font-weight: 400;
            border-bottom: 0;
            &.selected .hamburger-panel-arrow {
              transform: rotate(90deg);
            }
        }
        .list-subitems { 
            padding: 0;
        }
    }
    .hamburger-panel-arrow {
        font-size: 12px;
    }
    .hamburger-panel-first-row {
        background: none;
        .mobile-accounts{
            .nav-accounts-item{
                text-transform: uppercase;
                font-size: 11px;
                letter-spacing: 0.5px;
                padding-right: 15px;
            }
            .mobile-accounts-item {
                width: auto;
                display: inline-block;
                .mobile-accounts-link {
                    padding: 10px 5px;
                    font-size: 12px;
                    opacity: 0.6;
                }
                &:first-child a:after {
                position: relative;
                right: -7px;
                content: "|";
                }
            }
        }
    }
  &-arrow{
    top: 15px;
    right: 10px;
    margin-top: -10px;
    &.selected i{
      transform-origin: center;
      transform: rotate(180deg);
      -webkit-transform: rotate(180deg);
      -moz-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
      -o-transform: rotate(180deg);
    }
  }
}

.nav-accounts {
  &-icon {
    display: inline-block;
    width: 65px;
    margin: 12px 0;
    text-align: center;
    vertical-align: top;
    .nav-svg {
      height: 26px;
      vertical-align: middle;
    }
  }
  &-list {
    width: calc( 100% - 95px );
    display: inline-block;
  }
  &-item {
    display: inline-block;
  }
  &-link{
    display: inline-block;
    padding: 12px 10px 12px 0;
    font-size: 11px;
    text-transform: uppercase;
  }
  &-message {
    width: 100%;
    margin-bottom: -5px;
    padding-bottom: 4px;
    border-bottom: 1px solid;
  }
}

  {# /* Search */ #}

  .search-container {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 5000;
    .add-on.mobile-search-input-back {
      height: 20px;
      padding: 15px 10px;
      vertical-align: middle;
      font-size: 22px;
    }
    .add-on.mobile-search-input-submit {
      height: 50px;
      padding: 10px;
      font-size: 22px;
    }
  }
  .add-on.mobile-search-input-back,
  .add-on.mobile-search-input-submit{
    height: auto;
    border: 0;
    background: none;
  }
  input.mobile-search-input{
    width: 74%!important; /*Override Bootstrap width*/
    height: 30px;
    border: 0;
    margin: 0;
    padding: 10px;
    font-size: 16px;
    box-shadow:none;
    &:focus{
      border: 0;
      box-shadow: none;
    }
  }
    
  .search-suggest{
    position: fixed;
    top: 54px;
    z-index: 3000;
    display: none;
    height: 100%;
    width: 100%;
    box-sizing:border-box;
    margin: 0;
    padding-bottom: 1000px;
    overflow-y: scroll;
    &-link{
      padding: 20px 15px;
    }
  }
  .has_store_bar_thin .search-suggest{
    top: 60px;
  }
  .mobile-search-backdrop{
    z-index: 1;
  }
  .mobile-nav-categories-container{
    top: 92px;
    padding: 0 0 200px 0;
    z-index: 3000;
    overflow: auto;
  }

  .move-list-up .mobile-nav-categories-container,
  .move-list-up .mobile-nav-subcategories-panel{
    top: 40px;
  } 

  {# /* // Thumbs scroller */ #}

  .scroller {
    &.primary-products-scroller {
      max-height: none;
    }
    &.secondary-products-scroller {
      height: auto;
    }
  }

  {# /* //// Product grid */ #}

  .item-buy-variants {
    left: 0;
    width: 75vw;
    box-shadow: 0 0 10px rgba(0, 0, 0, .8);
    &-even {
      right: 3px;
      left: initial;
      .item-buy-arrow {
        right: 30%;
        left: initial;
      }
    }
    .variant-label-small,
    .variant-select-small {
      font-size: 12px;
    }
    .quanity-input {
      height: 40px;
    }
    .form-group-small .quantity-btn:last-child{
      height: 38px;
      line-height: 38px;
    }
  }

  {# /* Filters */ #}

  .filter-input-price-container {
    width: 85px;
    .filter-input-price {
      padding: 8px 25px 8px 8px;
      font-size: 13px;
    }
  }

  {# /* //// Product detail */ #}

  {# /* Image */ #}

  .zoom-svg-icon{
    width: 16px;
    height: 18px;
  }
  .mobile-zoom-panel{
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    width: 100%;
    height: 100%;
    overflow: auto;
    .mobile-zoom-image-container{
      margin: 15px;
      max-height: 95%;
    }
    .mobile-zoom-spinner{
      display: none;
      position: absolute;
      top: 40%;
      left: 50%;
      z-index: 99;
      margin-left: -15px;
    }
    img{
      width: 100%;
      max-height: inherit;
    }
  }

  .desktop-zoom-container:hover .product-slider-image:not(.desktop-zoom-big) {
    opacity: 1;
  }

  {# /* Variants */ #}

  .btn-variant{
    margin: 10px 15px 5px 0;
  }
  .panel-mobile-variant {
    left: 0;
  }
  
  {# /* //// Footer */ #}

  .social-link {
    margin: 0px 5px;
    width: 50px;
    height: 50px;
    .social-link-icon{
      font-size: 24px; 
    }
  }

  .footer-nav-item {
    margin: 15px 0;
    &-link {
      display: inline-block;
      min-width: 48px;
    }
  }

  .powered-by-logo{
    margin: auto;
  }

  {# /* //// Cart page */ #}

  {# /* Cart table */ #}

  .cart-item-name{
    float: left;
    width: 100%;
    margin-bottom: 5px;
    padding: 0 30px 10px 0;
    box-sizing:border-box;
  }
  .cart-table-product{
    /* !important necesary to override Bootstrap 2*/
    width: 18%!important;
    float: left!important;
  }
  .cart-quantity{
    /* !important necesary to override Bootstrap 2*/
    width: 82%!important;
    float: left!important;
    padding-left: 10px;
  }
  .cart-quantity-input-container svg {
    padding: 6px 14px;
  }
  .cart-item-subtotal{
    /* !important necesary to override Bootstrap 2*/
    width: auto;
    padding: 12px 0 10px 10px;
    text-align: right;
    font-weight: bold;
  }
  .cart-quantity-btn,
  .cart-btn-delete{
    padding: 10px;
  }
  input.cart-quantity-input{
    height: 26px;
  }
  .cart-quantity-svg-icon{
    width: 18px;
    height: 20px;
  }
  .cart-delete-container{
    /* !important necesary to override Bootstrap 2*/
    position: absolute;
    right: 0;
    top: 7px;
    float: right!important;
    width: 32px!important;
    .cart-btn-delete{
      padding-right:0; 
    }
  }

  {# /* Ajax cart */ #}

  .ajax-cart-container{
    width: 100%;
    box-sizing: border-box;
    .ajax-cart-item{
      &-image-col{
        width: 16%;
      }
      &-desc-col{
        width: 82%;
      }
    }
  }      

  {# /* //// Construction page */ #}
  
  .construction-page-svg{
    width: 15%;
  }
}


{# /* // max width 321px  */ #}

@media (max-width: 321px) {

  {# /* //// Header and nav */ #}

  .mobile-nav-tab {
    width: auto;
    display: inline-block;
    float: none;
    padding: 10px 5px;
  }

}

{#/*============================================================================
  #Critical path utilities
==============================================================================*/#}

.visible-when-content-ready{
  visibility: visible!important;
}
.display-when-content-ready{
  display: block!important;
}
.hidden-when-content-ready{
  display: none;
}
.product-single-image{
  height: auto;
}
