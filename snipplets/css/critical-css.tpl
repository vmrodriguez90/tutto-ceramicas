{#/*============================================================================

critical-css.tpl

    -This file contains all the theme critical styles wich will be loaded inline before the rest of the site
    -Rest of styling can be found in:
      -static/css/style.css --> For non critical styles witch will be loaded asynchronously
      -static/css/custom.scss.tpl --> For color and font styles related to config/settings.txt
      -static/css/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/#}

{#/*============================================================================
  Table of Contents

  #External CSS libraries and plugins
    // Bootstrap v2.3.1
    // Swiper 4.4.2
    // CSS Reset
  #Critical path utilities classes
  #Components
    // Animations
    // Placeholders and preloaders
    // Images
    // Breadcrumbs
    // Pills
    // Badge
    // Tooltip
    // Sliders
    // Banners
    // Notifications
    // Video
    // Forms
  #Header and nav
    // Nav desktop
    // Nav mobile
    // Search desktop
    // Logo
    // Cart widget desktop
    // Account
  #Product grid
    // Grid item
  #Product detail
    // Image
    // Form and info
  #Cart detail
    // Shipping calculator
  #Media queries
    // Min width 1200px
    // Max width 1199px Min width 770px 
    // Max width 979px
        //// Banner services
    // Max width 767px
        //// Components
        //// Nav mobile
        //// Product grid
        //// Product detail
  #Utilities classes

==============================================================================*/#}

{#/*============================================================================
  #External CSS libraries and plugins
==============================================================================*/#}

{# /* // Critical part of Bootstrap v2.3.1 */ #}

.badge,.label,sub,sup{vertical-align:baseline}.btn,img{vertical-align:middle}.img-polaroid,body,select{background-color:#fff}.breadcrumb,.carousel-indicators,.dropdown-menu,.media-list,.nav,.pager,.thumbnails{list-style:none}.container-fluid:after,.container:after,.dl-horizontal:after,.row-fluid:after,.row:after{clear:both}.btn-group>.btn.active,.btn-group>.btn:active,.btn-group>.btn:focus,.btn-group>.btn:hover,.input-append .uneditable-input:focus,.input-append input:focus,.input-append select:focus,.input-prepend .uneditable-input:focus,.input-prepend input:focus,.input-prepend select:focus{z-index:2}.dropdown,.dropup,sub,sup{position:relative}article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}audio,canvas,video{display:inline-block}audio:not([controls]){display:none}html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}a:focus{outline:#333 dotted thin;outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px}a:active,a:hover{outline:0}sub,sup{font-size:75%;line-height:0}sup{top:-.5em}sub{bottom:-.25em}img{width:auto\9;height:auto;max-width:100%;border:0;-ms-interpolation-mode:bicubic}#map_canvas img,.google-maps img{max-width:none}button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}button,html input[type=button],input[type=reset],input[type=submit]{cursor:pointer;-webkit-appearance:button}button,input[type=button],input[type=checkbox],input[type=radio],input[type=reset],input[type=submit],label,select{cursor:pointer}input[type=search]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}textarea{overflow:auto}.dropdown-menu,.popover{-webkit-background-clip:padding-box}body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#333}.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}a{color:#08c;text-decoration:none}a:focus,a:hover{text-decoration:underline}.row{margin-left:-20px}[class*=span]{float:left;min-height:1px;margin-left:20px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container{width:980px}.span12{width:940px}.span11{width:860px}.span10{width:780px}.span9{width:700px}.span8{width:620px}.span7{width:540px}.span6{width:460px}.span5{width:380px}.span4{width:300px}.span3{width:220px}.span2{width:140px}.span1{width:60px}.row-fluid,.row-fluid .span12{width:100%}.offset12{margin-left:980px}.offset11{margin-left:900px}.offset10{margin-left:820px}.offset9{margin-left:740px}.offset8{margin-left:660px}.offset7{margin-left:580px}.offset6{margin-left:500px}.offset5{margin-left:420px}.offset4{margin-left:340px}.offset3{margin-left:260px}.offset2{margin-left:180px}.offset1{margin-left:100px}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.127659574468085%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.127659574468085%}.row-fluid .span11{width:91.48936170212765%}.row-fluid .span10{width:82.97872340425532%}.row-fluid .span9{width:74.46808510638297%}.row-fluid .span8{width:65.95744680851064%}.row-fluid .span7{width:57.44680851063829%}.row-fluid .span6{width:48.93617021276595%}.row-fluid .span5{width:40.42553191489362%}.row-fluid .span4{width:31.914893617021278%}.row-fluid .span3{width:23.404255319148934%}.row-fluid .span2{width:14.893617021276595%}.row-fluid .span1{width:6.382978723404255%}.row-fluid .offset12{margin-left:104.25531914893617%}.row-fluid .offset12:first-child{margin-left:102.12765957446808%}.row-fluid .offset11{margin-left:95.74468085106382%}.row-fluid .offset11:first-child{margin-left:93.61702127659574%}.row-fluid .offset10{margin-left:87.23404255319149%}.row-fluid .offset10:first-child{margin-left:85.1063829787234%}.row-fluid .offset9{margin-left:78.72340425531914%}.row-fluid .offset9:first-child{margin-left:76.59574468085106%}.row-fluid .offset8{margin-left:70.2127659574468%}.row-fluid .offset8:first-child{margin-left:68.08510638297872%}.row-fluid .offset7{margin-left:61.70212765957446%}.row-fluid .offset7:first-child{margin-left:59.574468085106375%}.row-fluid .offset6{margin-left:53.191489361702125%}.row-fluid .offset6:first-child{margin-left:51.063829787234035%}.row-fluid .offset5{margin-left:44.68085106382979%}.row-fluid .offset5:first-child{margin-left:42.5531914893617%}.row-fluid .offset4{margin-left:36.170212765957444%}.row-fluid .offset4:first-child{margin-left:34.04255319148936%}.row-fluid .offset3{margin-left:27.659574468085104%}.row-fluid .offset3:first-child{margin-left:25.53191489361702%}.row-fluid .offset2{margin-left:19.148936170212764%}.row-fluid .offset2:first-child{margin-left:17.02127659574468%}.row-fluid .offset1{margin-left:10.638297872340425%}.row-fluid .offset1:first-child{margin-left:8.51063829787234%}.row-fluid [class*=span].hide,[class*=span].hide{display:none}.container-fluid:after,.container-fluid:before,.container:after,.container:before{display:table;line-height:0;content:""}.row-fluid [class*=span].pull-right,[class*=span].pull-right{float:right}.container{margin-right:auto;margin-left:auto}.container-fluid{padding-right:20px;padding-left:20px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px}dd,dt,li{line-height:20px}small{font-size:85%}strong{font-weight:700}em{font-style:italic}address,cite{font-style:normal}.muted{color:#999}a.muted:focus,a.muted:hover{color:grey}.text-warning{color:#c09853}a.text-warning:focus,a.text-warning:hover{color:#a47e3c}.text-error{color:#b94a48}a.text-error:focus,a.text-error:hover{color:#953b39}.text-info{color:#3a87ad}a.text-info:focus,a.text-info:hover{color:#2d6987}.text-success{color:#468847}a.text-success:focus,a.text-success:hover{color:#356635}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:inherit;font-weight:700;line-height:20px;color:inherit;text-rendering:optimizelegibility}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:400;line-height:1;color:#999}.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #eee}blockquote p,ol ol,ol ul,ul ol,ul ul{margin-bottom:0}address,dl,legend,pre.prettyprint{margin-bottom:20px}ol,ul{padding:0;margin:0 0 10px 25px}ol.inline,ol.unstyled,ul.inline,ul.unstyled{margin-left:0;list-style:none}ol.inline>li,ul.inline>li{display:inline-block;padding-right:5px;padding-left:5px}dt{font-weight:700}dd{margin-left:10px}.dl-horizontal:after,.dl-horizontal:before{display:table;line-height:0;content:""}address,blockquote small,pre{line-height:20px;display:block}.dl-horizontal dt{float:left;width:160px;overflow:hidden;clear:left;text-align:right;text-overflow:ellipsis;white-space:nowrap}.clearfix:after,.controls-row:after,.dropdown-menu>li>a,.form-actions:after,.form-horizontal .control-group:after,.modal-footer:after,.nav-pills:after,.nav-tabs:after,.navbar-form:after,.navbar-inner:after,.pager:after,.thumbnails:after{clear:both}pre,pre code{white-space:pre}.dl-horizontal dd{margin-left:180px}hr{margin:20px 0;border:0;border-top:1px solid #eee;border-bottom:1px solid #fff}abbr[data-original-title],abbr[title]{cursor:help;border-bottom:1px dotted #999}abbr.initialism{font-size:90%;text-transform:uppercase}.btn{padding:4px 12px;font-size:14px;line-height:20px;color:#333;text-shadow:0 1px 1px rgba(255,255,255,.75);cursor:pointer;background-color:#f5f5f5;background-image:-moz-linear-gradient(top,#fff,#e6e6e6);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image:-webkit-linear-gradient(top,#fff,#e6e6e6);background-image:-o-linear-gradient(top,#fff,#e6e6e6);background-image:linear-gradient(to bottom,#fff,#e6e6e6);border:1px solid #ccc;border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);border-bottom-color:#b3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid: DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);filter:progid: DXImageTransform.Microsoft.gradient(enabled=false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}.btn-danger,.btn-info,.btn-inverse,.btn-primary,.btn-success,.btn-warning,.navbar .btn-navbar{text-shadow:0 -1px 0 rgba(0,0,0,.25)}.btn.active,.btn.disabled,.btn:active,.btn:focus,.btn:hover,.btn[disabled]{color:#333;background-color:#e6e6e6}.btn:focus,.btn:hover{color:#333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position .1s linear;-moz-transition:background-position .1s linear;-o-transition:background-position .1s linear;transition:background-position .1s linear}.btn:focus{outline:#333 dotted thin;outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px}.btn.active,.btn:active{background-color:#ccc\9;background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.breadcrumb{padding:8px 15px;margin:0 0 20px;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block;text-shadow:0 1px 0 #fff}.breadcrumb>li>.divider{padding:0 5px;color:#ccc}.breadcrumb>.active{color:#999}.pull-right{float:right}.pull-left{float:left}.hide{display:none}.show{display:block}.invisible{visibility:hidden}.affix{position:fixed}
.clearfix:after,.clearfix:before{display:table;line-height:0}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}@-ms-viewport{width:device-width}.hidden{display:none}.hidden-desktop,.visible-phone,.visible-tablet{display:none!important}.visible-desktop{display:inherit!important}.quick-content{width:775px}nav.mobile{display:none;border:none}@media (min-width:770px) and (max-width:979px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-tablet{display:inherit!important}.hidden-tablet{display:none!important}.quick-content{width:100%}}@media (max-width:769px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-phone{display:inherit!important}.hidden-phone{display:none!important}.quick-content{width:100%}nav.mobile{display:block;padding:10px 0}#menu,.col-price,.firstrow{display:none}}.visible-print{display:none!important}@media print{.visible-print{display:inherit!important}.hidden-print{display:none!important}}@media (min-width:1200px){.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}.row-fluid:after,.row:after{clear:both}.row{margin-left:-30px}[class*=span]{float:left;min-height:1px;margin-left:30px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container{width:980px}.span12{width:1170px}.span11{width:1070px}.span10{width:970px}.span9{width:870px}.span8{width:770px}.span7{width:670px}.span6{width:570px}.span5{width:470px}.span4{width:370px}.span3{width:270px}.span2{width:170px}.span1{width:70px}.offset12{margin-left:1230px}.offset11{margin-left:1130px}.offset10{margin-left:1030px}.offset9{margin-left:930px}.offset8{margin-left:830px}.offset7{margin-left:730px}.offset6{margin-left:630px}.offset5{margin-left:530px}.offset4{margin-left:430px}.offset3{margin-left:330px}.offset2{margin-left:230px}.offset1{margin-left:130px}.row-fluid{width:100%}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.564102564102564%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid #twitter [class*=span]{margin-left:10px;width:47%}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.564102564102564%}.row-fluid .span12{width:100%}.row-fluid .span11{width:91.45299145299145%}.row-fluid .span10{width:82.90598290598291%}.row-fluid .span9{width:74.35897435897436%}.row-fluid .span8{width:65.81196581196582%}.row-fluid .span7{width:57.26495726495726%}.row-fluid .span6{width:48.717948717948715%}.row-fluid .span5{width:40.17094017094017%}.row-fluid .span4{width:31.623931623931625%}.row-fluid .span3{width:23.076923076923077%}.row-fluid .span2{width:14.52991452991453%}.row-fluid .span1{width:5.982905982905983%}.row-fluid .offset12{margin-left:105.12820512820512%}.row-fluid .offset12:first-child{margin-left:102.56410256410257%}.row-fluid .offset11{margin-left:96.58119658119658%}.row-fluid .offset11:first-child{margin-left:94.01709401709402%}.row-fluid .offset10{margin-left:88.03418803418803%}.row-fluid .offset10:first-child{margin-left:85.47008547008548%}.row-fluid .offset9{margin-left:79.48717948717949%}.row-fluid .offset9:first-child{margin-left:76.92307692307693%}.row-fluid .offset8{margin-left:70.94017094017094%}.row-fluid .offset8:first-child{margin-left:68.37606837606839%}.row-fluid .offset7{margin-left:62.393162393162385%}.row-fluid .offset7:first-child{margin-left:59.82905982905982%}.row-fluid .offset6{margin-left:53.84615384615384%}.row-fluid .offset6:first-child{margin-left:51.28205128205128%}.row-fluid .offset5{margin-left:45.299145299145295%}.row-fluid .offset5:first-child{margin-left:42.73504273504273%}.row-fluid .offset4{margin-left:36.75213675213675%}.row-fluid .offset4:first-child{margin-left:34.18803418803419%}.row-fluid .offset3{margin-left:28.205128205128204%}.row-fluid .offset3:first-child{margin-left:25.641025641025642%}.row-fluid .offset2{margin-left:19.65811965811966%}.row-fluid .offset2:first-child{margin-left:17.094017094017094%}.row-fluid .offset1{margin-left:11.11111111111111%}.row-fluid .offset1:first-child{margin-left:8.547008547008547%}.uneditable-input,input,textarea{margin-left:0}.controls-row [class*=span]+[class*=span]{margin-left:30px}.uneditable-input.span12,input.span12,textarea.span12{width:1156px}.uneditable-input.span11,input.span11,textarea.span11{width:1056px}.uneditable-input.span10,input.span10,textarea.span10{width:956px}.uneditable-input.span9,input.span9,textarea.span9{width:856px}.uneditable-input.span8,input.span8,textarea.span8{width:756px}.uneditable-input.span7,input.span7,textarea.span7{width:656px}.uneditable-input.span6,input.span6,textarea.span6{width:556px}.uneditable-input.span5,input.span5,textarea.span5{width:456px}.uneditable-input.span4,input.span4,textarea.span4{width:356px}.uneditable-input.span3,input.span3,textarea.span3{width:256px}.uneditable-input.span2,input.span2,textarea.span2{width:156px}.uneditable-input.span1,input.span1,textarea.span1{width:56px}.thumbnails{margin-left:-30px}.thumbnails>li{margin-left:30px}.row-fluid .thumbnails{margin-left:0}}@media (min-width:770px) and (max-width:979px){.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}.row-fluid:after,.row:after{clear:both}.row{margin-left:-20px}[class*=span]{float:left;min-height:1px;margin-left:20px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container,.span12{width:724px}.span11{width:662px}.span10{width:600px}.span9{width:538px}.span8{width:476px}.span7{width:414px}.span6{width:352px}.span5{width:290px}.span4{width:228px}.span3{width:166px}.span2{width:104px}.span1{width:42px}.row-fluid,.row-fluid .span12{width:100%}.offset12{margin-left:764px}.offset11{margin-left:702px}.offset10{margin-left:640px}.offset9{margin-left:578px}.offset8{margin-left:516px}.offset7{margin-left:454px}.offset6{margin-left:392px}.offset5{margin-left:330px}.offset4{margin-left:268px}.offset3{margin-left:206px}.offset2{margin-left:144px}.offset1{margin-left:82px}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.7624309392265194%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.7624309392265194%}.row-fluid .span11{width:91.43646408839778%}.row-fluid .span10{width:82.87292817679558%}.row-fluid .span9{width:74.30939226519337%}.row-fluid .span8{width:65.74585635359117%}.row-fluid .span7{width:57.18232044198895%}.row-fluid .span6{width:48.61878453038674%}.row-fluid .span5{width:40.05524861878453%}.row-fluid .span4{width:31.491712707182323%}.row-fluid .span3{width:22.92817679558011%}.row-fluid .span2{width:14.3646408839779%}.row-fluid .span1{width:5.801104972375691%}.row-fluid .offset12{margin-left:105.52486187845304%}.row-fluid .offset12:first-child{margin-left:102.76243093922652%}.row-fluid .offset11{margin-left:96.96132596685082%}.row-fluid .offset11:first-child{margin-left:94.1988950276243%}.row-fluid .offset10{margin-left:88.39779005524862%}.row-fluid .offset10:first-child{margin-left:85.6353591160221%}.row-fluid .offset9{margin-left:79.8342541436464%}.row-fluid .offset9:first-child{margin-left:77.07182320441989%}.row-fluid .offset8{margin-left:71.2707182320442%}.row-fluid .offset8:first-child{margin-left:68.50828729281768%}.row-fluid .offset7{margin-left:62.70718232044199%}.row-fluid .offset7:first-child{margin-left:59.94475138121547%}.row-fluid .offset6{margin-left:54.14364640883978%}.row-fluid .offset6:first-child{margin-left:51.38121546961326%}.row-fluid .offset5{margin-left:45.58011049723757%}.row-fluid .offset5:first-child{margin-left:42.81767955801105%}.row-fluid .offset4{margin-left:37.01657458563536%}.row-fluid .offset4:first-child{margin-left:34.25414364640884%}.row-fluid .offset3{margin-left:28.45303867403315%}.row-fluid .offset3:first-child{margin-left:25.69060773480663%}.row-fluid .offset2{margin-left:19.88950276243094%}.row-fluid .offset2:first-child{margin-left:17.12707182320442%}.row-fluid .offset1{margin-left:11.32596685082873%}.row-fluid .offset1:first-child{margin-left:8.56353591160221%}.uneditable-input,input,textarea{margin-left:0}.controls-row [class*=span]+[class*=span]{margin-left:20px}.uneditable-input.span12,input.span12,textarea.span12{width:710px}.uneditable-input.span11,input.span11,textarea.span11{width:648px}.uneditable-input.span10,input.span10,textarea.span10{width:586px}.uneditable-input.span9,input.span9,textarea.span9{width:524px}.uneditable-input.span8,input.span8,textarea.span8{width:462px}.uneditable-input.span7,input.span7,textarea.span7{width:400px}.uneditable-input.span6,input.span6,textarea.span6{width:338px}.uneditable-input.span5,input.span5,textarea.span5{width:276px}.uneditable-input.span4,input.span4,textarea.span4{width:214px}.uneditable-input.span3,input.span3,textarea.span3{width:152px}.uneditable-input.span2,input.span2,textarea.span2{width:90px}.uneditable-input.span1,input.span1,textarea.span1{width:28px}}@media (max-width:769px){body{padding:0;}.navbar-fixed-bottom,.navbar-fixed-top,.navbar-static-top{margin-right:-20px;margin-left:-20px}.controls-row [class*=span]+[class*=span],.dl-horizontal dd,.row,.row-fluid [class*=offset]:first-child,.thumbnails,.thumbnails>li{margin-left:0}.container-fluid{padding:0}.dl-horizontal dt{float:none;width:auto;clear:none;text-align:left}.container{width:auto;padding:0}.row-fluid{width:100%}.thumbnails>li{float:none}.row-fluid [class*=span],.uneditable-input[class*=span],[class*=span]{display:block;float:none;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid .span12,.span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-large,.input-xlarge,.input-xxlarge,.uneditable-input,input[class*=span],select[class*=span],textarea[class*=span]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-append input,.input-append input[class*=span],.input-prepend input,.input-prepend input[class*=span]{display:inline-block;width:auto}.modal{position:fixed;top:20px;right:20px;left:20px;width:auto;margin:0}.modal.fade{top:-100px}.modal.fade.in{top:20px}}@media (max-width:480px){.form-horizontal .controls,.media-object{margin-left:0}.nav-collapse{-webkit-transform:translate3d(0,0,0)}.page-header h1 small{display:block;line-height:20px}input[type=radio],input[type=checkbox]{border:1px solid #ccc}.form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left}.form-horizontal .control-list{padding-top:0}.form-horizontal .form-actions{padding-right:10px;padding-left:10px}.media .pull-left,.media .pull-right{display:block;float:none;margin-bottom:10px}.media-object{margin-right:0}.modal{top:10px;right:10px;left:10px}.modal-header .close{padding:10px;margin:-10px}.carousel-caption{position:static}}@media (max-width:979px){body{padding-top:0}.navbar-fixed-bottom,.navbar-fixed-top{position:static}.navbar-fixed-top{margin-bottom:20px}.navbar-fixed-bottom{margin-top:20px}.navbar-fixed-bottom .navbar-inner,.navbar-fixed-top .navbar-inner{padding:5px}.navbar .container{width:auto;padding:0}.navbar .brand{padding-right:10px;padding-left:10px;margin:0 0 0 -5px}.nav-collapse{clear:both}.nav-collapse .nav{float:none;margin:0 0 10px}.nav-collapse .dropdown-menu li+li a,.nav-collapse .nav>li>a{margin-bottom:2px}.nav-collapse .nav>li{float:none}.nav-collapse .nav>.divider-vertical{display:none}.nav-collapse .nav .nav-header{color:#777;text-shadow:none}.nav-collapse .dropdown-menu a,.nav-collapse .nav>li>a{padding:9px 15px;font-weight:700;color:#777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.nav-collapse .btn{padding:4px 10px;font-weight:400;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.nav-collapse .dropdown-menu a:focus,.nav-collapse .dropdown-menu a:hover,.nav-collapse .nav>li>a:focus,.nav-collapse .nav>li>a:hover{background-color:#f2f2f2}.navbar-inverse .nav-collapse .dropdown-menu a,.navbar-inverse .nav-collapse .nav>li>a{color:#999}.navbar-inverse .nav-collapse .dropdown-menu a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .nav>li>a:focus,.navbar-inverse .nav-collapse .nav>li>a:hover{background-color:#111}.nav-collapse.in .btn-group{padding:0;margin-top:5px}.nav-collapse .dropdown-menu{position:static;top:auto;left:auto;display:none;float:none;max-width:none;padding:0;margin:0 15px;background-color:transparent;border:none;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.nav-collapse .open>.dropdown-menu{display:block}.nav-collapse .dropdown-menu .divider,.nav-collapse .dropdown-menu:after,.nav-collapse .dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after,.nav-collapse .nav>li>.dropdown-menu:before{display:none}.nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1)}.navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111;border-bottom-color:#111}.navbar .nav-collapse .nav.pull-right{float:none;margin-left:0}.nav-collapse,.nav-collapse.collapse{height:0;overflow:hidden}.navbar .btn-navbar{display:block}.navbar-static .navbar-inner{padding-right:10px;padding-left:10px}}@media (min-width:980px){.nav-collapse.collapse{height:auto!important;overflow:visible!important}}

{# /* // Swiper 4.4.2 */ #}
.swiper-container{width:100%;margin:0 auto;position:relative;overflow:hidden;list-style:none;padding:0;z-index:1}.swiper-container-no-flexbox .swiper-slide{float:left}.swiper-container-vertical>.swiper-wrapper{-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}.swiper-wrapper{position:relative;width:100%;height:100%;z-index:1;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-container-android .swiper-slide,.swiper-wrapper{-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.swiper-container-multirow>.swiper-wrapper{-webkit-flex-wrap:wrap;-ms-flex-wrap:wrap;flex-wrap:wrap}.swiper-container-free-mode>.swiper-wrapper{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out;margin:0 auto}.swiper-slide{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;width:100%;height:100%;position:relative;-webkit-transition-property:-webkit-transform;transition-property:-webkit-transform;-o-transition-property:transform;transition-property:transform;transition-property:transform,-webkit-transform}.swiper-slide-invisible-blank{visibility:hidden}.swiper-container-autoheight,.swiper-container-autoheight .swiper-slide{height:auto}.swiper-container-autoheight .swiper-wrapper{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;-webkit-transition-property:height,-webkit-transform;transition-property:height,-webkit-transform;-o-transition-property:transform,height;transition-property:transform,height;transition-property:transform,height,-webkit-transform}.swiper-container-3d{-webkit-perspective:1200px;perspective:1200px}.swiper-container-3d .swiper-cube-shadow,.swiper-container-3d .swiper-slide,.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top,.swiper-container-3d .swiper-wrapper{-webkit-transform-style:preserve-3d;transform-style:preserve-3d}.swiper-container-3d .swiper-slide-shadow-bottom,.swiper-container-3d .swiper-slide-shadow-left,.swiper-container-3d .swiper-slide-shadow-right,.swiper-container-3d .swiper-slide-shadow-top{position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;z-index:10}.swiper-container-3d .swiper-slide-shadow-left{background-image:-webkit-gradient(linear,right top,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(right,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to left,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-right{background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(left,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to right,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-top{background-image:-webkit-gradient(linear,left bottom,left top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(bottom,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to top,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-3d .swiper-slide-shadow-bottom{background-image:-webkit-gradient(linear,left top,left bottom,from(rgba(0,0,0,.5)),to(rgba(0,0,0,0)));background-image:-webkit-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:-o-linear-gradient(top,rgba(0,0,0,.5),rgba(0,0,0,0));background-image:linear-gradient(to bottom,rgba(0,0,0,.5),rgba(0,0,0,0))}.swiper-container-wp8-horizontal,.swiper-container-wp8-horizontal>.swiper-wrapper{-ms-touch-action:pan-y;touch-action:pan-y}.swiper-container-wp8-vertical,.swiper-container-wp8-vertical>.swiper-wrapper{-ms-touch-action:pan-x;touch-action:pan-x}.swiper-button-next,.swiper-button-prev{position:absolute;top:50%;z-index:10;width:30px;height:40px;margin-top:-25px;line-height:40px;color:#fff;text-align:center;cursor:pointer}.swiper-button-next.swiper-button-disabled,.swiper-button-prev.swiper-button-disabled{opacity:0;cursor:auto}.swiper-button-prev,.swiper-container-rtl .swiper-button-next{left:20px;right:auto}.swiper-button-next,.swiper-container-rtl .swiper-button-prev{right:20px;left:auto}.swiper-button-lock{display:none}.swiper-pagination{position:absolute;text-align:center;-webkit-transition:.3s opacity;-o-transition:.3s opacity;transition:.3s opacity;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);z-index:10}.swiper-pagination.swiper-pagination-hidden{opacity:0}.swiper-container-horizontal>.swiper-pagination-bullets,.swiper-pagination-custom,.swiper-pagination-fraction{bottom:20px;left:0;width:100%}.swiper-pagination-bullets-dynamic{overflow:hidden;font-size:0}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33);position:relative}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-main{-webkit-transform:scale(1);-ms-transform:scale(1);transform:scale(1)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev-prev{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next{-webkit-transform:scale(.66);-ms-transform:scale(.66);transform:scale(.66)}.swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next-next{-webkit-transform:scale(.33);-ms-transform:scale(.33);transform:scale(.33)}.swiper-pagination-bullet{width:8px;height:8px;display:inline-block;border-radius:100%;background:#000;opacity:.2}button.swiper-pagination-bullet{border:none;margin:0;padding:0;-webkit-box-shadow:none;box-shadow:none;-webkit-appearance:none;-moz-appearance:none;appearance:none}.swiper-pagination-clickable .swiper-pagination-bullet{cursor:pointer}.swiper-pagination-bullet-active{opacity:1;background:#007aff}.swiper-container-vertical>.swiper-pagination-bullets{right:10px;top:50%;-webkit-transform:translate3d(0,-50%,0);transform:translate3d(0,-50%,0)}.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{margin:6px 0;display:block}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%);width:8px}.swiper-container-vertical>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{display:inline-block;-webkit-transition:.2s top,.2s -webkit-transform;transition:.2s top,.2s -webkit-transform;-o-transition:.2s transform,.2s top;transition:.2s transform,.2s top;transition:.2s transform,.2s top,.2s -webkit-transform}.swiper-container-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet{margin:0 4px}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic{left:50%;-webkit-transform:translateX(-50%);-ms-transform:translateX(-50%);transform:translateX(-50%);white-space:nowrap}.swiper-container-horizontal>.swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s left,.2s -webkit-transform;transition:.2s left,.2s -webkit-transform;-o-transition:.2s transform,.2s left;transition:.2s transform,.2s left;transition:.2s transform,.2s left,.2s -webkit-transform}.swiper-container-horizontal.swiper-container-rtl>.swiper-pagination-bullets-dynamic .swiper-pagination-bullet{-webkit-transition:.2s right,.2s -webkit-transform;transition:.2s right,.2s -webkit-transform;-o-transition:.2s transform,.2s right;transition:.2s transform,.2s right;transition:.2s transform,.2s right,.2s -webkit-transform}.swiper-pagination-progressbar{background:rgba(0,0,0,.25);position:absolute}.swiper-pagination-progressbar .swiper-pagination-progressbar-fill{background:#007aff;position:absolute;left:0;top:0;width:100%;height:100%;-webkit-transform:scale(0);-ms-transform:scale(0);transform:scale(0);-webkit-transform-origin:left top;-ms-transform-origin:left top;transform-origin:left top}.swiper-container-rtl .swiper-pagination-progressbar .swiper-pagination-progressbar-fill{-webkit-transform-origin:right top;-ms-transform-origin:right top;transform-origin:right top}.swiper-container-horizontal>.swiper-pagination-progressbar,.swiper-container-vertical>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite{width:100%;height:4px;left:0;top:0}.swiper-container-horizontal>.swiper-pagination-progressbar.swiper-pagination-progressbar-opposite,.swiper-container-vertical>.swiper-pagination-progressbar{width:4px;height:100%;left:0;top:0}.swiper-pagination-white .swiper-pagination-bullet-active{background:#fff}.swiper-pagination-progressbar.swiper-pagination-white{background:rgba(255,255,255,.25)}.swiper-pagination-progressbar.swiper-pagination-white .swiper-pagination-progressbar-fill{background:#fff}.swiper-pagination-black .swiper-pagination-bullet-active{background:#000}.swiper-pagination-progressbar.swiper-pagination-black{background:rgba(0,0,0,.25)}.swiper-pagination-progressbar.swiper-pagination-black .swiper-pagination-progressbar-fill{background:#000}.swiper-pagination-lock{display:none}.swiper-lazy-preloader{width:42px;height:42px;position:absolute;left:50%;top:50%;margin-left:-21px;margin-top:-21px;z-index:10;-webkit-transform-origin:50%;-ms-transform-origin:50%;transform-origin:50%;-webkit-animation:swiper-preloader-spin 1s steps(12,end) infinite;animation:swiper-preloader-spin 1s steps(12,end) infinite}.swiper-lazy-preloader:after{display:block;content:'';width:100%;height:100%;background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");background-position:50%;background-size:100%;background-repeat:no-repeat}.swiper-lazy-preloader-white:after{background-image:url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E")}@-webkit-keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}@keyframes swiper-preloader-spin{100%{-webkit-transform:rotate(360deg);transform:rotate(360deg)}}.swiper-container-fade.swiper-container-free-mode .swiper-slide{-webkit-transition-timing-function:ease-out;-o-transition-timing-function:ease-out;transition-timing-function:ease-out}.swiper-container-fade .swiper-slide{pointer-events:none;-webkit-transition-property:opacity;-o-transition-property:opacity;transition-property:opacity}.swiper-container-fade .swiper-slide .swiper-slide{pointer-events:none}.swiper-container-fade .swiper-slide-active,.swiper-container-fade .swiper-slide-active .swiper-slide-active{pointer-events:auto}

{# /* // Font Awesome Sizes */ #}

.svg-inline--fa{display:inline-block;font-size:inherit;height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-lg{vertical-align:-.225em}.svg-inline--fa.fa-w-1{width:.0625em}.svg-inline--fa.fa-w-2{width:.125em}.svg-inline--fa.fa-w-3{width:.1875em}.svg-inline--fa.fa-w-4{width:.25em}.svg-inline--fa.fa-w-5{width:.3125em}.svg-inline--fa.fa-w-6{width:.375em}.svg-inline--fa.fa-w-7{width:.4375em}.svg-inline--fa.fa-w-8{width:.5em}.svg-inline--fa.fa-w-9{width:.5625em}.svg-inline--fa.fa-w-10{width:.625em}.svg-inline--fa.fa-w-11{width:.6875em}.svg-inline--fa.fa-w-12{width:.75em}.svg-inline--fa.fa-w-13{width:.8125em}.svg-inline--fa.fa-w-14{width:.875em}.svg-inline--fa.fa-w-15{width:.9375em}.svg-inline--fa.fa-w-16{width:1em}.svg-inline--fa.fa-w-17{width:1.0625em}.svg-inline--fa.fa-w-18{width:1.125em}.svg-inline--fa.fa-w-19{width:1.1875em}.svg-inline--fa.fa-w-20{width:1.25em}.fa-lg{font-size:1.33333em;line-height:.75em;vertical-align:-.0667em}.fa-xs{font-size:.75em}.fa-sm{font-size:.875em}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-spin{animation:fa-spin 2s infinite linear}@keyframes fa-spin{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}

{# /* // Critical CSS Reset */ #}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym,
address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  vertical-align: baseline;
}

:focus {outline: 0;}
ol, ul {list-style: none;}
table {border-collapse: separate;border-spacing: 0;}
caption, th, td {text-align: left;font-weight: normal;}
b, strong{font-weight:bold;}
i, em, address {font-style:italic;}
pre {font-family:monospace;}
::selection {
background-color: #000;
color: #fff;
}

{#/*============================================================================
  #Critical path utilities classes
==============================================================================*/#}

{# /* Hidden general content until rest of styling loads */ #}

.visible-when-content-ready{
  visibility: hidden!important;
}
.display-when-content-ready{
  display: none!important;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Animations */ #}

.rotate{
  -webkit-animation: rotate 2s infinite linear;
  -moz-transform: rotate 2s infinite linear;
  -ms-transform: rotate 2s infinite linear;
  -o-transform: rotate 2s infinite linear;
  transform: rotate 2s infinite linear;
}
@-webkit-keyframes rotate {
  from {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  to {
    -webkit-transform: rotate(359deg);
    -moz-transform: rotate(359deg);
    -ms-transform: rotate(359deg);
    -o-transform: rotate(359deg);
    transform: rotate(359deg);
  }
}
.placeholder-shine{
  position: absolute;
  width: 100%;
  height: 100%;
  opacity: 0.3;
  -moz-animation: shine 1.5s infinite;
  -webkit-animation: shine 1.5s infinite;
  animation: shine 1.5s infinite;
    top: 0;
    left: -100%;
  /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,ffffff+41,ffffff+50,ffffff+60,7db9e8+100&0+0,0.63+41,1+50,0.45+60,0+100 */
  background: -moz-linear-gradient(left, rgba(30,87,153,0) 0%, rgba(255,255,255,0.63) 41%, rgba(255,255,255,1) 50%, rgba(255,255,255,0.45) 60%, rgba(125,185,232,0) 100%); /* FF3.6-15 */
  background: -webkit-linear-gradient(left, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(to right, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#001e5799', endColorstr='#007db9e8',GradientType=1 ); /* IE6-9 */
}
@keyframes shine {
  from {
    left: -100%;
  }
  to {
    left: 100%;
  }
}

.placeholder-fade{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.1;
  -moz-animation: placeholder-fade 1.5s infinite;
  -webkit-animation: placeholder-fade 1.5s infinite;
  animation: placeholder-fade 1.5s infinite;
}
@keyframes placeholder-fade {
  0%{
    opacity: 0.1;
  }
  50% {
    opacity: 0.2;
  }
  100% {
    opacity: 0.1;
  }
}

.transition-up {
  opacity: 0;
}

@-moz-keyframes spin {
  100% {
    -moz-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-webkit-keyframes spin {
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes spin {
  100% {
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

.fade-in-vertical {
  opacity: 0;
}

{# /* // Placeholders and preloaders */ #}

.page-loading-icon{
  height: 40px;
  width: 40px;
  margin: 40px auto;
}
.mobile-placeholder{
  display: none;
}
.slider-desktop-placeholder{
  height: 300px;
}
.blur-up {
  -webkit-filter: blur(1px);
  filter: blur(1px);
  -moz-filter: blur(1px);
  -ms-filter: blur(1px);
  -o-filter: blur(1px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up-big {
  -webkit-filter: blur(3px);
  filter: blur(3px);
  -moz-filter: blur(3px);
  -ms-filter: blur(3px);
  -o-filter: blur(3px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up-huge {
  -webkit-filter: blur(6px);
  filter: blur(6px);
  -moz-filter: blur(6px);
  -ms-filter: blur(6px);
  -o-filter: blur(6px);
  transition: filter .2s, -webkit-filter .2s;
}
.blur-up.lazyloaded,
.blur-up-big.lazyloaded,
.blur-up-huge.lazyloaded,
.blur-up.swiper-lazy-loaded,
.blur-up-big.swiper-lazy-loaded,
.blur-up-huge.swiper-lazy-loaded {
  -webkit-filter: blur(0);
  filter: blur(0);
  -moz-filter: blur(0);
  -ms-filter: blur(0);
  -o-filter: blur(0);
}
.fade-in {
  opacity: 0;
  transition: opacity .2s;
}
.fade-in.lazyloaded {
  opacity: 1;
}
.lazyloaded + .placeholder-shine,
.lazyloaded + .placeholder-fade{
  display: none;
}

.spinner-big {
  width: 60px;
  height: 60px;
  margin: 40px auto 20px auto;
  border-radius: 50%;
  -moz-animation: spin 0.7s linear infinite;
  -webkit-animation: spin 0.7s linear infinite;
  animation: spin 0.7s linear infinite;
}

{# /* // Images */ #}

/* Used for images that have a placeholder before it loads. The image container should have a padding-bottom inline with the result of (image height/ image width) * 100 */
.img-absolute {
  position: absolute;
  left: 0;
  width: 100%;
  height: auto;
  vertical-align: middle;
  text-indent: -9999px;
  z-index: 1;
}

.img-absolute-centered{
  left: 50%;
  transform: translate3d(-50%, 0, 0);
  -webkit-transform: translate3d(-50%, 0, 0);
  -ms-transform: translate3d(-50%, 0, 0);
}


.product-thumbnails-slider {
  position: relative;
  width: 100%;
  height: 450px;
  }
.product-thumbnails-slider .swiper-slide {
  width: 100%;
  height:auto;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}
.product-thumbnails-slider .swiper-slide .thumbnail-image {
  width: 100%;
  height:auto;
}

.product-thumbnails-slider .swiper-button-disabled {
  opacity: 0;
}

.card-img-square-container {
  position: relative;
  width: 100%;
  padding-top: 100%;
}
.card-img-square {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

{# /* // Breadcrumbs */ #}

.breadcrumb { 
  margin: 10px 0;
  padding: 0;
  background: transparent;
}
.breadcrumb-crumb {
  display: inline-block;
  font-size: 16px;
}
.breadcrumb-crumb.active{
  font-weight: strong;
  font-weight: bold;
}

{# /* // Pills */ #}

.pills-container ul{
  list-style: none;
}
.pill{
  display: inline-block;
  margin: 0 5px 10px 0;
}
.pill-link{
  display: block;
  padding: 5px 10px;
  font-size: 12px;
}

{# /* // Badge */ #}

.badge {
  position: absolute;
  top: 5px;
  right: 2px;
  min-width: 11px;
  padding: 1px 3px!important; /*Override Bootstrap helpers*/
  line-height: 15px!important; /*Override Bootstrap helpers*/
  font-weight: normal!important; /*Override Bootstrap helpers*/ 
  border-radius: 10px!important; /*Override Bootstrap helpers*/
}

.badge-small {
  width: 6px;
  height: 10px;
  min-width: auto;
}

.badge-top {
  top: 0;
  right: -15px;
}

{# /* // Tooltip */ #}

.tooltip {
  top: -60px;
  left: -130%;
  width: 290px;
  padding: 15px 10px;
  font-size: 12px!important; /*Override Bootstrap helpers*/
  text-align: center;
}

.tooltip-left {
  top: 30px;
  right: -30px;
  left: initial;
  width: 320px;
}

.tooltip-arrow {
  position: absolute;
  right: 40%;
  width: 0;
  height: 0;
  pointer-events: none;
}

.tooltip-left .tooltip-arrow{
  right: 34px;
}

.tooltip-bottom .tooltip-arrow {
  top: -8px;
}

.tooltip-top .tooltip-arrow {
  bottom: -8px;
  transform: rotate(180deg);
}

{# /* // Sliders */ #}

.slider {
  /* Fixes white flickering on Chrome */
  -webkit-perspective: 1000px;
}
.slide-img{
  width: 100%;
}
.home-slider .swiper-slide {
  max-height: 500px!important;
  overflow: hidden;
}
.swiper-pagination {
  position: relative;
  top: 0;
  height: 20px;
  margin: 12px 0;
}

.swiper-container-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet {
  width: 10px;
  height: 10px;
  margin: 0 5px;
}
.swiper-pagination-bullet {
  opacity: 0.6;
}
.swiper-pagination-bullet-active {
  opacity: 1;
}

.swiper-button-next, .swiper-button-prev {
  width: 28px;
  height: 28px;
  padding: 4px;
  background-color: #1b1b1bcf;
  border-radius: 50%;
  line-height: 28px;
}
.swiper-button-next svg, .swiper-button-prev svg {
  height: 28px;
  color: #ffffff80;
  fill: #ffffff80;
}
.swiper-button-next svg {
  margin-left: 2px;
}
.swiper-button-prev svg {
  margin-right: 2px;
}

.products-slider {
  margin: 0 -10px;
}

{# /* // Banners */ #}

.banner{
  margin:10px auto;
  text-align: center;
}
.banner img{
  width: 100%;
}

.textbanner {
  position: relative;
  margin-bottom: 30px;
  padding-top: 100%;
  overflow: hidden;
}

.textbanner-image {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.textbanner-image.overlay:after {
  position: absolute;
  top: 0;
  display: block;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: 0.3;
  content: '';
}

.textbanner-text {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 9;
  width: 100%;
  padding: 30px 20px;
  color: white;
  transform: translate(-50%, -50%);
  box-sizing: border-box;
}

.textbanner-image-background {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.textbanner-title {
  margin-bottom: 15px;
  font-size: 34px;
  font-weight: 700;
  line-height: 36px;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

.textbanner-paragraph {
  display: -webkit-box;
  margin-bottom: 20px;
  overflow: hidden;
  text-shadow: 1px 1px 3px rgba(0,0,0,.4);
  text-overflow: ellipsis;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}

.textbanner-text.dark {
  color: black;
}

.textbanner-text.dark .textbanner-title {
  text-shadow: 1px 1px 3px rgba(255, 255, 255, 0.2);
}

.textbanner-text.dark .textbanner-paragraph {
  text-shadow: 1px 1px 3px rgba(255, 255, 255, 0.4);
}

.textbanner-image.light:after {
  background: white;
}

.services{
  opacity: 0.8;
  padding: 20px 0px;
  margin-bottom: 20px;
  margin-top: 20px;
}
.service-item{
  width: 100%;
  margin: auto;
}
.service-item .service-icon-big {
  font-size: 32px;
}
.service-text{
  text-align: left;
}
.service-title{
  text-transform: uppercase;
}
.banner-services-footer .services{
  margin: 10px auto;
}

{# /* // Welcome message */ #}

.subtitle-container {
  padding:15px 10px;
  text-align: center;
  text-transform: uppercase;
}

.subtitle-paragraph {
  padding: 0 15px;
  display: -webkit-box;
  text-align: center;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
}

{# /* // Modules with image and text */ #}

.module-image img {
  width: 100%;
  display: block;
  margin: 0 auto;
}

{# /* // Notifications */ #}

.notification{
  padding: 10px;
  margin-bottom: 3px;
  box-sizing: border-box;
  text-align: center;
  font-size: 16px;
}
.notification-floating {
  position: absolute;
  left: 0;
  width: 100%;
  box-sizing: border-box;
}

.notification-floating .notification{
  margin: 10px;
}

.notification-fixed-bottom {
  position: fixed;
  bottom: -6px;
  left: 0;
  width: 100%;
  z-index: 1000;
}

.notification-centered {
  position: fixed;
  top: 50%;
  left: 35%;
  z-index: 999;
  width: 30%;
}

.notification-btn.btn {
  padding: 7px 10px;
}

.notification-close {
  position: absolute;
  top: 3px;
  right: 10px;
  padding: 10px;
}

{# /* // Video */ #}

.embed-responsive {
  position: relative;
  display: block;
  height: 0;
  padding: 0;
  overflow: hidden;
}

.embed-responsive.embed-responsive-16by9 {
  padding-bottom: 56.25%;
}

.embed-responsive .embed-responsive-item,
.embed-responsive  embed,
.embed-responsive  iframe,
.embed-responsive  object,
.embed-responsive  video {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: 0;
}

.player-container {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  width: 100%;
  height: 100%;    
  cursor: pointer;
}
.player-container .btn-primary {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 70px;
  height: 50px;
  margin: -25px 0 0 -35px;
  padding: 0;
  line-height: 50px;
  text-align: center;
}
.player-container .btn-small {
  width: 40px;
  height: 30px;
  margin: -20px 0 0 -20px;
  line-height: 32px;
}
.player-container .play-icon {
  margin-bottom: 2px;
  margin-left: 3px;
  vertical-align: middle;
}
.video-image {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 100%;
  height: auto;
  transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

{# /* // Forms */ #}

.form-toggle-eye {
  position: absolute;
  top: 50%;
  right: 2px;
  display: inline-block;
  margin-top: -6px;
  padding: 10px;
  background: none;
  border: 0;
}


{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Nav desktop */ #}

.desktop-nav {
  width: 100%;
  text-align: center;
}
.desktop-nav-item{
  position:relative;
  display: inline-block;
  text-transform: uppercase;
}
.desktop-nav-list {
  display: none;
}
.desktop-nav > .desktop-nav-item > .desktop-nav-link > .desktop-nav-arrow{
  display:none;
}
.desktop-nav-link {
  display: block;
  padding:12px 18px;
  text-transform: uppercase;
}

.theme-wide .desktop-nav {
  border: none;
}
.theme-full .desktop-nav {
  margin-bottom: 0;  
} 
.theme-wide .desktop-nav .desktop-nav-link {
  letter-spacing: 1px;
}
.theme-wide .desktop-nav-link {
  padding: 10px;
}

.head-container {
  position: relative;
  z-index: 1040;
}

.head-fix{
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1040;
  box-shadow: 0 1px 3px rgba(0,0,0,0.3);
}

.head-fix .logo-img{
  max-height: 70px;
  margin: 15px 0 5px;
}

{# /* // Nav mobile */ #}

.mobile-nav-search-row, 
.mobile-nav-second-row,
.pushy{
    display: none;
}
.mobile-nav-empty-cart{
  position: fixed;
  top: 120px;
  left: 5%;
  display: none;
  box-sizing:border-box;
  width: 90%;
}

{# /* // Search desktop */ #}

.btn-desktop-search{
  position: absolute;
  right: 0;
  top: 0;
  width: 40px;
  height: 100%;
  background: transparent;
}

.head-logo-left .btn-desktop-search {
  padding: 0;
  width: 32px;
}

.theme-wide .searchbox form {
  position: relative;
  max-width: 180px;
}
.theme-wide .searchbox input.header-input { 
  padding: 5px 0;
  border: none; 
}

{# /* // Logo */ #}

.search-logo-cart-container{
  display: flex;
  align-items: center;
  justify-content: center;
}

{# /* // Logo Left */ #}

.head-logo-left .logo-img {
  max-height: 60px;
  max-width: 400px;
  margin: 20px 10px;
  text-align: left;
}

.head-logo-left .desktop-nav,
.head-logo-left .desktop-nav-item { 
  margin-bottom: 0px;       
  background: transparent;
}

.logo-text{
  width: 100%;
  display:inline-block;
  margin:20px 0;
  text-transform: capitalize;
  font-weight: normal;
  line-height: 40px;
  text-align: center;
}
.logo-text a:hover {
  text-decoration: none;
}
.logo-img-container {
  max-width: 450px;
  margin: auto;
  text-align: center;
}
.logo-img{
  margin: 20px 0;
  vertical-align: middle;
  max-height: 170px;
}

.theme-wide .logo-img {
  margin: 15px 0;
  max-width: 260px;
}

{# /* // Cart widget desktop */ #}

.cart-summary {
  margin: 5px 0;
  padding: 4px 8px;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-align:center;
}
.cart-summary a:hover{
  text-decoration: none;
}

.theme-wide .cart-summary a {
  display: inline-block;
  padding-right: 12px;
}

{# /* // Account */ #}

.user-access {
  position: relative;
  display: inline-block;
  text-align: center;
  text-transform: uppercase;
}
.user-open {
  width: 30px;
  line-height: 36px;
}
.user-items {
  position: absolute;
  top: 34px;
  left: 50%;
  transform: translate(-50%, 0%);
  display: none;
  min-width: 130px;  
  padding: 10px 0;
  text-align: center;
  border-radius: 3px;
}
.user-items:before {
  position: absolute;
  top: -2px;
  height: 10px;
  width: 10px;
  margin-left: -5px;
  transform: rotate(45deg);
  content:""; 
}
.user-access:hover .user-items { 
  z-index: 2000;
  display: block;
}

{#/*============================================================================
  #Product grid
==============================================================================*/ #}

.grid-row{
  float: left;
  width: 100%;
  padding: 0 5px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
}

{# /* // Grid item */ #}

.item {
  text-align: center;
  text-transform: uppercase;
  padding: 10px 0;
  border-top: 1px solid #dcdcdc;
}
.item-image-container {
  position: relative;
  overflow: hidden;
  max-height: 300px;
}
.item-image{
  height: 100%;
  width: auto;
  max-height: 300px;
}
.item-colors {
  position: absolute;
  bottom: 0;
  z-index: 9;
  width: 100%;
  padding: 10px 0;
}
.item-colors-bullet {
  display: inline-block;
  min-width: 20px;
  height: 20px;
  margin: 0 3px;
  font-size: 10px;
  line-height: 18px;
  vertical-align: top;
  cursor: pointer;
  box-sizing: border-box;
  text-transform: uppercase;
  -webkit-transition: all 0.4s ease;
  -ms-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  transition: all 0.4s ease;
}
.item-colors-bullet:hover,
.item-colors-bullet.selected {
  opacity: 1;
}
.item-colors-bullet-square {
  display: block;
  width: 16px;
  height: 16px;
  margin: 1px;
}
.item-colors-bullet-text {
  width: fit-content;
  margin: 0 auto;
  padding: 0 5px;
}
.item-slide {
  margin: 0 10px;
}
.item-slide .item-image-container,
.item-slide .item-image {
  max-height: 500px;
}
.product-grid-labels{
	z-index: 2;
}
.product-label{
  display: inline-block;
  margin: 5px auto 0 auto;
	padding: 5px;
  z-index: 1;
	text-transform: uppercase;
  line-height: 14px;
  text-align: center;
  z-index: 99;
}
.label-bottom{
  position: absolute;
  width: 90%;
  bottom: 10px;
  right: 0;
  left:0;
}
.item-label.label-bottom{
  border: 0;
}
.label-bottom-double{
  bottom: 40px;
}
.label-shipping-icon .svg-truck-icon {
  width: 15px;
  height: 14px;
  display: inline;
  vertical-align: bottom;
}
.label-primary,
.label-accent{
  position: absolute;
  top: 5px;
  left: 0;
  z-index: 2;
  width: auto;
  margin: 0;
  text-align: center;
  letter-spacing: 0.5px;
  opacity: 0.9;
}
.label-secondary {
  position: absolute;
  top: 5px;
  right: 0;
  margin: 0;
  z-index: 9; 
}
.label-small{
  font-size: 65%;
  line-height: 175%;
  text-transform: lowercase;
}
.label-inline{
  position: relative;
  top: 0;
}
.label-line {
  padding: 5px 10px;
  margin-bottom: 5px; 
  border: 1px solid;
  font-size: 13px;
  text-transform: none;
}
.label-featured { 
  font-size: 15px;
  text-transform: uppercase;
}
.label-small{
  padding: 1px 4px;
  font-size: 10px;
  text-transform: uppercase;
}

.item-quickshop-link {
  position: absolute;
  bottom: 50%;
  left: 5%;
  width: 90%;
  display: none;
  padding: 5px 0;
  z-index: 99;
  text-decoration: none;
}
.item-quickshop-link:hover{
  text-decoration: none;
}
.item-image-container:hover .item-quickshop-link {
  display: block;
}
.item-price-compare{
  text-decoration: line-through;
  padding: 0 5px;
  margin-right: 5px;
}
.item-name{
  display: block;
  margin: 5px;
}


.theme-wide .item {
  border: none;
}
.theme-wide .item-name {
  font-size: 12px;
}
.theme-wide .item-price { 
  font-weight: 700;
}



{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.mobile-zoom-panel{
  display: none;
}
.product-single-image{
  height: 0;
}
.product-single-image img{
  left: 50%;
  transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
}
.product-slide{
  max-height: 550px;
}
.product-slider-image{
  height: 100%;
  max-height: 550px;
  width: auto;
}
.product-with-1-img img{
  margin: auto;
}
.product-form-container{
  width: 100%;
  float: left;
  padding-bottom:15px;
}
.product-slider{
  visibility: hidden;
  height: 0;
}

{# /* // Form and info */ #}

.product-form{
  height: 300px;
}
.product-name {
  font-weight: normal;
  text-transform: uppercase;
  line-height: initial;
}
.product-price-container {
  margin-top: 10px;
}
.product-price{
  font-size:32px;
  margin-top: 10px;
  position:relative;
  font-weight: bold;
  line-height: 30px;
}
.product-fixed-info{
  display: none;
}
.product-name-fixed{
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.price-compare {
  text-decoration: line-through;
  opacity: 0.8;
}
.product-detail-label.label-primary {
  z-index: 2;
}

{#/*============================================================================
  #Cart detail
==============================================================================*/#}

{# /* // Shipping Calculator */ #}

.free-shipping-title {
  position: relative;
  width: 100%;
  height: 60px;
  margin-top: 10px;
}
.shipping-calculator-head.with-zip {
  height: 35px;
}
.shipping-calculator-head.with-zip.with-free-shipping {
  height: 105px;
}
.shipping-calculator-head.with-form {
  height: 95px;
}
.shipping-calculator-head.with-error {
  height: 180px;
}

{#/*============================================================================
  #Media queries page
==============================================================================*/#}

{# /* // Min width 1200px */ #}

@media (min-width: 1200px) {

  .theme-wide .m-section{
    margin:80px auto !important; /*Override Bootstrap helpers*/
  }
  .theme-wide .m-section-top{
    margin-top:80px !important; /*Override Bootstrap helpers*/
  }
  .theme-wide .m-section-bottom{
    margin-bottom:80px !important; /*Override Bootstrap helpers*/
  }
  .theme-wide .m-section-half{
    margin:40px auto !important; /*Override Bootstrap helpers*/
  }
  .theme-wide .m-section-top-half{
    margin-top:40px !important; /*Override Bootstrap helpers*/
  }
  .theme-wide .m-section-bottom-half{
    margin-bottom:40px !important; /*Override Bootstrap helpers*/
  }
  
  {# /* Theme - wide */ #}

  .theme-wide .container{
    width: 1140px;
  }

  .theme-wide .searchbox {
    display: inline-block;
    position: relative;
    vertical-align: top;
  }


  {# /* Theme - full */ #}

  .theme-full .container{
    width: 100%;
  }
  .theme-full .home-slider .swiper-slide {
    max-height: 640px!important;
  }
  .theme-full .container-wide,
  .theme-full .smarthint {
    width: 1140px;
    margin-left: auto;
    margin-right: auto;
  }
  .theme-full .search-logo-cart-container{
    width: calc( 100% - 30px );
    margin: 0 15px;
  }

  .theme-full .footer,
  .theme-full .footer-legal {
    padding:  20px;
  }

  {# In the Full Width option, the height of the slider is increased to maintain the propulsion of the images it contains. #}

  .theme-full .head-logo-left.head-trasnparent.head-fix {
    position: fixed;
  }
}

{# /* // Max width 1199px Min width 770px */ #}

@media (max-width: 1199px) and (min-width: 770px) {
  .theme-wide .m-section{
    margin:40px 0;
  }
  .theme-wide .m-section-top{
    margin-top:40px;
  }
  .theme-wide .m-section-bottom{
    margin-bottom:40px;
  }
  .theme-wide .m-section-half{
    margin:20px 0;
  }
  .theme-wide .m-section-top-half{
    margin-top:20px;
  }
  .theme-wide .m-section-bottom-half{
    margin-bottom:20px;
  }
  .theme-full .container{
    width: 100%;
  }
  .theme-full .container-wide, 
  .theme-full .smarthint {
      width: 760px;
      margin-left: auto;
      margin-right: auto;
  }
  .theme-wide .searchbox {
    display: inline-block
  }
  .theme-wide .searchbox form {
    max-width: 130px;
  }
}

{# /* // Max width 979px */ #}

@media (max-width: 979px) {

  {# /* //// Banner services */ #}

  .service-item{
    width: 90%;
    margin: auto;
  }
}

{# /* // Max width 769px */ #}

@media (max-width: 769px) {

  {# /* //// Components */ #}

  {# /* Placeholders and preloaders */ #}

  .blur-up-big,
  .blur-up-huge {
    -webkit-filter: blur(2px);
    filter: blur(2px);
    -moz-filter: blur(2px);
    -ms-filter: blur(2px);
    -o-filter: blur(2px);
  }
  .mobile-placeholder{
    position: relative;
    display: block;
    box-sizing: border-box;
    overflow: hidden;
  } 
  .slider-desktop-placeholder{
    display: none;
  }
  .placeholder-figures-container{
    width: 100%;
    padding: 10%;
    box-sizing: border-box;
    overflow: hidden;
  }
  .placeholder-left-col{
    width: 30%;
  }
  .placeholder-right-col{
    width: 60%;
    margin-left: 10%;
  }
  .placeholder-square{
    width: 100%;
  }
  .placeholder-square:after{
    content: "";
    display: block;
    padding-bottom: 100%;
  }
  .placeholder-line{
    position: relative;
    overflow: hidden;
  }
  .placeholder-line:after{
    content: "";
    display: block;
    padding-top: 10%;
  }
  .placeholder-line-medium{
    position: relative;
    height: 20px;
  }
  .placeholder-pager{
    position: absolute;
    width: 100%;
    left: 0;
    bottom: 10px;
    text-align: center;
  }
  .theme-wide .placeholder-pager{
    position: relative;
    bottom: 0;
    margin: 10px 0;
  }
  .placeholder-circle{
    position: relative;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin:10px auto;
    overflow: hidden;
  }
  .placeholder-icon{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 20%;
    transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
  } 
  .product-placeholder-container{
    max-height: 300px;
  }
  .product-placeholder{
    max-width: 100%;
    left: 50%;
    transform: translateX(-50%);
    -webkit-transform: translateX(-50%);
    -ms-transform: translateX(-50%);
    max-height: 300px;
  }
    
  {# /* Animations */ #}

  .main-content{
    padding-top: 100px;
  }
  .has_store_bar_thin .main-content{
    padding-top: 65px;
  }
  .move-down{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,0,0);
    -moz-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    -o-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
  }
  .move-up{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,-50px,0);
    -moz-transform: translate3d(0,-50px,0);
    -ms-transform: translate3d(0,-50px,0);
    -o-transform: translate3d(0,-50px,0);
    transform: translate3d(0,-50px,0);
  }

  .modal-xs-right.modal.fade,
  .modal-xs-right-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(200%,0,0);
    -moz-transform: translate3d(200%,0,0);
    -ms-transform: translate3d(200%,0,0);
    -o-transform: translate3d(200%,0,0);
    transform: translate3d(200%,0,0);
  }

  .modal-xs-bottom.modal.fade,
  .modal-xs-bottom-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,100%,0);
    -moz-transform: translate3d(0,100%,0);
    -ms-transform: translate3d(0,100%,0);
    -o-transform: translate3d(0,100%,0);
    transform: translate3d(0,100%,0);
  }

  {# /* Notifications */ #}

  .notification-floating .notification {
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, .1), 0 2px 3px 0 rgba(0, 0, 0, .06);
  }

  .notification-centered {
    left: 5%;
    width: 90%;
  }

  {# /* Tooltips */ #}

  .tooltip-left {
    top: -60px;
    right: -20%;
  }

  .tooltip-left .tooltip-arrow{
    right: 20%;
  }

  {# /* Breadcrumbs */ #}

  .breadcrumb-crumb {
    font-size: 14px;
  }

  {# /* Sliders */ #}

  .swiper-button-next, .swiper-button-prev {
    display: none;
  }
  .swiper-pagination {
    height: 20px;
    margin: 4px 0;
  }
  .swiper-container-horizontal>.swiper-pagination-bullets .swiper-pagination-bullet {
    width: 8px;
    height: 8px;
  }

  .placeholder-page{
    opacity:0.5;
    border: none;
  }
  .placeholder-page.active{
    opacity:1;
  }

  .placeholder-page{
    width: 7px;
    height: 7px;
    margin: 0 3px;
    background: white;/* Not custom color to garantee contrast over any image*/
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    border-radius: 8px;
    border: 1px solid #aba8a8;/* Not custom color to garantee contrast over any image*/
  }
  .placeholder-page.active{
    background: #8c8b8b;/* Not custom color to garantee contrast over any image*/
  }

  {# /* Banners */ #}

  .services{
    margin-top: 0;
    margin-bottom: 10px;
    padding: 0;
  }
  .service-item .service-icon {
    font-size: 20px;
  }
  .service-item .service-icon-big {
    font-size: 22px;
  }
  .service-text{
    width: 100%;
    clear: both;
    text-align: center;
  }

  {# /* Welcome message */ #}

  .subtitle-paragraph {
    -webkit-line-clamp: 8;
  }

  {# /* //// Nav mobile */ #}

  .mobile-nav{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 4000;
  }
  .mobile-nav-first-row{
    height: 50px;
  }
  .mobile-nav-first-row-icon{
    width: 22px;
    height: 22px;
    padding: 12px 10px;
  }
  .right-panel{
    display: none;
  }

  {# /* Nav mobile title */ #}

  .mobile-nav-title{
    float: left;
    width: 70%;
    margin-left: 5px;
    margin-top: 14px;
    text-transform: uppercase;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  {# /* Nav mobile logo */ #}

  .logo-container{
    width: 80%;
    float: left;
  }
  .logo-text a{
    display: block;
    margin-top: 20px;
    margin: 20px auto 10px auto;
    width: 100%;
    font-size: 24px;
    line-height: normal;
  }
  .logo-img{
    margin: 0;
    max-height: 60px;
    max-width: 60%;
    margin-top: 15px;
    margin-bottom: 20px;
  }
  .mobile-logo-home .logo-img{
    max-height: 60px;
    max-width: 80%;
  }

  .theme-wide .logo-container {
    max-width: 50%;
  }
  .theme-wide .mobile-logo-home .logo-img {
    max-height: 40px;
    max-width: 85%;
    margin: 6px 0;
  }
  .theme-wide .main-content{
    padding-top: 0;
  }

  {# /* Nav mobile tabs */ #}

  .mobile-nav-second-row {
    display: block;
  }
  .mobile-nav-tab {
    position: relative;
    width: 33.33333333%;
    float: left;
    padding: 12px 0;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
  }
  .mobile-nav-tab:focus,
  .mobile-nav-tab:hover{
    text-decoration: none;
  }
  .mobile-nav-tab-half {
    width: 50%;
  }
  .mobile-nav-cart-amount {
    display: inline-block;
    margin: -1px 5px 0 3px;
    padding: 0 4px;
    font-weight: 700;
  }

  .head-box.head-fix{
    top: -80px;
  }
  .theme-wide .mobile-nav-tab {
    display: inline-block;
    float: none;
    width: auto;
    padding: 12px 15px;
  }
  .theme-wide .mobile-nav-first-row-icon {
    width: 70px;
    height: 25px;
    padding: 5px;
    font-size: 10px;
    text-transform: uppercase;
  }
  .theme-wide .head-logo-left .mobile-nav-first-row-icon {
    padding: 2px 4px;
  }
  .theme-wide .mobile-nav-first-row-icon svg {
    width: 20px;
    font-size: 22px;
    margin-right: 5px;
    margin-bottom: 2px;
    vertical-align: middle;
  }

  .theme-wide .cart-summary {
    margin-right: 5px;
    padding: 4px 2px;
  }
  .theme-wide .cart-summary a {
    display: inline-block;
    padding-right: 18px;
  }
  .theme-wide .search-fix form input.header-input {
    height: 50px;
  }
  .theme-wide .mobile-search-btn { 
    width: 28px;
    line-height: 30px;
  }

  .theme-wide .search-fix-tab {
    width: 50%;
  }

  .theme-wide .search-fix-tab input.header-input {
    height: 45px;
    padding: 5px 35px 5px 0;
    border: none;
  }
  .theme-wide .search-fix-tab .btn { 
    margin-right: 10px;
  }

  .theme-wide .searchbox form {
    max-width: 100%;
  }
  .theme-wide .mobile-nav-second-row {
     text-align: center;
  }
  .theme-wide .mobile-nav-tab { 
    display: inline-block;
    float: none;
    width: auto;
    padding: 12px 15px;
  }
  .theme-wide .mobile-nav-search-row .btn {
    padding: 8px;
  }
 
  {# /* //// Product grid */ #}

  .grid-row{
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
  }
  .label-max-width {
    max-width: 75px;
  }
  .label-max-width .label-small {
    line-height: 12px;
  }

  {# /* Sorty by and filters */ #}

  .category-controls-sticky-detector {
    height: 1px;
  }
  
  .category-controls {
    position: sticky;
    z-index: 100;
    float: left;
    width: 100%;
    padding: 15px 0;
  }

  .sort-by-container{
    float: left;
    width: 60%;
  }

  {# /* Grid item */ #}

  .item-container{
    width: 50%!important;/* !important necesary to override Bootstrap 2*/
    height: auto;
    padding-left: 5px;
    padding-right: 5px;
  }
  .products-slider {
    margin: 10px;
  }
  .products-slider .item-container {
    width: 100%!important;
    padding: 0;
  }
  .item-slide {
    margin: 0;
  }
  .item-name{
    text-overflow: ellipsis;
    overflow: hidden;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
  }

  .theme-wide .item-name {
    font-size: 12px;
    line-height: 15px;
  }
 .theme-wide .item-price { 
    font-size: 14px;
    font-weight: 700;
  } 
  .theme-wide .item-price-compare { 
    font-size: 12px;
  } 

  {# /* //// Product detail */ #}

  {# /* Image */ #}

  .product-detail-label.label-secondary {
    top: 45px;
  }
  .product-slider-container {
    position: relative;
    display: block;
    float: left;
    width: 100%;
    text-align: center;
  }
  .product-slider-image,
  .product-slide {
    max-height: 300px;
  }
  .product-slider-container{
    max-height: 300px!important;
    box-shadow: 0 0 5px #ccc;
    background: #fff;
  }
  .swiper-product-pagination {
    top: -30px;
  }
  .product-video-container {
    display: block;
    width: 100%;
    height: 100%;
  }
  .product-video {
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
  }
  .product-video .embed-responsive {
    width: 100%;
    height: 100%;
    padding-bottom: 0;
  }
  .product-video .video-image {
    width: auto;
    height: 100%;
    max-width: initial;
  }
}

{#/*============================================================================
  #Utilities classes
==============================================================================*/#}

{# /*CSS properties like margins, paddings and text align minified, to unminify it you have to copy the code and paste it here http://unminify.com/, after that paste the unminified code here */ #}

.row-flex{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-15px;margin-left:-15px}.align-items-center{-ms-flex-align:center!important;align-items:center!important}.col{-ms-flex-preferred-size:0;flex-basis:0;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-auto{-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.theme-full .overide-container-width{margin:0!important;}.overide-container-width{margin-left:-10px!important;margin-right:-10px!important}.text-danger{color:red}.input-error{border:1px solid #cc4845!important}.border-box{box-sizing:border-box}.d-table{display:table}.d-flex{display: flex;}.d-inline{display:inline}.d-block{display:block}.d-inline-block{display:inline-block}.p-relative{position:relative!important}.p-absolute{position:absolute!important}.p-fixed{position:fixed}.clear-both{clear:both!important}.opacity-80{opacity:.8!important}.opacity-50{opacity:.5!important}.opacity-10{opacity:.1!important}.full-height{height:100%!important}.full-width-container{float: left; width: 100%; clear: both;}.full-width{width:100%!important}.width-auto{width:auto}.m-top{margin-top:20px!important}.m-top-double{margin-top:40px!important}.m-top-half{margin-top:10px!important}.m-top-quarter{margin-top:5px!important}.m-top-none{margin-top:0!important}.m-right{margin-right:20px!important}.m-right-double{margin-right:40px!important}.m-right-half{margin-right:10px!important}.m-right-quarter{margin-right:5px!important}.m-right-none{margin-right:0!important}.m-bottom{margin-bottom:20px!important}.m-bottom-double{margin-bottom:40px!important}.m-bottom-half{margin-bottom:10px!important}.m-bottom-quarter{margin-bottom:5px!important}.m-bottom-none{margin-bottom:0!important}.m-left{margin-left:20px!important}.m-left-half{margin-left:10px!important}.m-left-quarter{margin-left:5px!important}.m-left-none{margin-left:0!important}.m-all{margin:20px!important}.m-all-half{margin:10px!important}.m-all-quarter{margin:5px!important}.m-auto{margin:auto!important}.m-none{margin:0!important}.p-top{padding-top:20px!important}.p-top-double{padding-top:40px!important}.p-top-half{padding-top:10px!important}.p-top-quarter{padding-top:5px!important}.p-top-none{padding-top:0!important}.p-right{padding-right:20px!important}.p-right-double{padding-right:40px!important}.p-right-half{padding-right:10px!important}.p-right-quarter{padding-right:5px!important}.p-right-none{padding-right:0!important}.p-bottom{padding-bottom:20px!important}.p-bottom-double{padding-bottom:40px!important}.p-bottom-half{padding-bottom:10px!important}.p-bottom-quarter{padding-bottom:5px!important}.p-bottom-none{padding-bottom:0!important}.p-left{padding-left:20px!important}.p-left-double{padding-left:40px!important}.p-left-half{padding-left:10px!important}.p-left-quarter{padding-left:5px!important}.p-none-left{padding-left:0!important}.p-all{padding:20px!important}.p-all-half{padding:10px!important}.p-all-quarter{padding:5px!important}.p-none{padding:0!important}.text-left{text-align:left!important}.text-right{text-align:right!important}.text-center{text-align:center!important}.text-justify{text-align:justify!important}.text-nowrap{white-space:nowrap!important}.text-lowercase{text-transform:lowercase!important}.text-uppercase{text-transform:uppercase!important}.text-capitalize{text-transform:capitalize!important}.text-undeline{text-decoration: underline!important}.text-wrap{-ms-word-break:break-all!important;word-wrap:break-word!important;-webkit-hyphens:auto!important;-moz-hyphens:auto!important;hyphens:auto!important}.line-height-initial{line-height:initial}.list-style-disc{list-style: disc}ul.list-style-none li{list-style:none!important}.overflow-none{overflow:hidden!important}.align-baseline{vertical-align:baseline!important}.align-top{vertical-align:top!important}.align-middle{vertical-align:middle!important}.align-bottom{vertical-align:bottom!important}.align-text-bottom{vertical-align:text-bottom!important}.align-text-top{vertical-align:text-top!important}.text-trim{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}

{# /* // Desktop helpers */ #}

@media (min-width: 770px) {
  .col-md-custom{float:left!important;margin-left:0!important}.col-md-3-custom{width:25%!important}.col-md-4-custom{width:33.33333333333333%!important}.col-md-6-custom{width:50%!important}.col-md-8-custom{width: 66.66666666666666%!important}.col-md-9-custom{width:75%!important} .no-border-md{border:0!important}
}

{# /* // Mobile helpers */ #}

@media (max-width: 769px) {
  .m-height-auto-xs{min-height: auto!important}.col-xs-custom{float:left!important;margin-left:0!important}.col-xs-1-custom{width: 8.33333333%!important}.col-xs-3-custom{width:25%!important}.col-xs-4-custom{width:33.33333333333333%!important}.col-xs-6-custom{width:50%!important}.col-xs-8-custom{width: 66.66666666666666%!important}.col-xs-9-custom{width:75%!important}.col-xs-11-custom{width: 91.66666667%!important}.overide-container-width{width:100vw!important}.clear-both-xs{clear:both!important}.pull-none-xs{float:none!important}.pull-left-xs{float:left!important}.pull-right-xs{float:right!important}.d-block-xs{display:block!important}.d-inline-block-xs{display:inline-block!important}.p-all-xs{padding:20px!important}.p-all-half-xs{padding:10px!important}.p-none-xs{padding:0!important}.p-top-xs{padding-top: 20px!important}.p-top-half-xs{padding-top:10px!important}.p-top-quarter-xs{padding-top:5px!important}.p-right-half-xs{padding-right:10px!important}.p-right-quarter-xs{padding-right:5px!important}.p-right-none-xs{padding-right:0!important}.p-bottom-xs{padding-bottom:20px!important}.p-bottom-double-xs{padding-bottom:40px!important}.p-bottom-half-xs{padding-bottom:10px!important}.p-left-half-xs{padding-left:10px!important}.p-left-quarter-xs{padding-left:5px!important}.p-none-left-xs{padding-left:0!important}.m-none-xs{margin:0!important}.m-top-xs{margin-top:20px!important}.m-top-half-xs{margin-top:10px!important}.m-top-quarter-xs{margin-top:5px!important}.m-top-none-xs{margin-top:0!important}.m-bottom-xs{margin-bottom:20px!important}.m-bottom-half-xs{margin-bottom:10px!important}.m-bottom-quarter-xs{margin-bottom:5px!important}.m-bottom-none-xs{margin-bottom:0!important}.m-left-quarter-xs{margin-left:5px!important}.m-all-half-xs{margin:10px!important}.border-none-xs{border:0!important}.text-center-xs{text-align:center!important}.text-left-xs{text-align:left!important}.text-right-xs{text-align:right!important}.border-top-none-xs{border-top:0!important}.border-bottom-none-xs{border-bottom:0!important}.full-width-xs{width:100%!important}.horizontal-container{overflow-y:hidden;overflow-x:scroll!important;width:100%;margin:0}.horizontal-container::-webkit-scrollbar{width:1px!important;height:0!important}.horizontal-container::-webkit-scrollbar-track{background:0 0!important;border-radius:10px!important}.horizontal-container::-webkit-scrollbar-thumb{border-radius:1px!important}.horizontal-container-item{float:none!important;display:inline-block}.horizontal-container ul,.horizontal-products-scroller{white-space:nowrap!important}.wrap-list-xs{width:50%;float:left;clear:none!important;padding:4px;box-sizing:border-box}
}
