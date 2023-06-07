{% if store.allows_checkout_styling %}

{#/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/main-color.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$primary-brand-color: {{ settings.brand_color | default('rgb(77, 190, 207)' | raw ) }};
$secondary-brand-color: {{ settings.brand_color_secondary | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: {{ settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{# /* // Color variations */ #}

$background-dark-10: darken($background-color, 10%);
$background-light-10: lighten($background-color, 10%);
$background-opac-03: rgba($background-color, 0.3);
$primary-opac-03: rgba($primary-brand-color, 0.3);
$primary-opac-01: rgba($primary-brand-color, 0.1);
$foreground-light-100: lighten($foreground-color, 100%);

{# /* // Font */ #}

$logo-font: {{ settings.font_logo | default('Arvo') | raw }};
$heading-font: {{ settings.font_headings | default('Arvo') | raw }};
$body-font: {{ settings.font_rest | default('Arial') | raw }};
$button-font: {{ settings.font_buttons | default('Istok Web') | raw }};

{# /* // Box */ #}

$box-border-color: null;
$box-border-color: rgba($foreground-color, .3);

$box-radius: 0;
$box-background: lighten($background-color, 10%);
$box-shadow: none;

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}
 
// $box-border-color: darken($background-color, 10%); should we keep this or the above one?
$box-radius: 0;
$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: $background-color;
}
a {
  color: $primary-brand-color;
  text-decoration: none;

  &:hover, &:focus {
    color: darken($primary-brand-color, 20%);

    svg {
      fill: darken($primary-brand-color, 20%);
    }
  }

  svg {
    fill: $primary-brand-color;
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $primary-brand-color;
}

{# /* // Form */ #}

.form-control {
  color: $foreground-color;
  background: $background-color;
  border-color: $box-border-color;
  border-radius: $box-radius;

  &:focus {
    border-color: $primary-brand-color;
    outline: none;    
  }
}
.form-options-content {
  font-size: 12px;
  line-height: 20px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group-error .form-control {
  border-color: $base-red;

  &:focus {
    border-color: $base-red;
  }
}
.form-group input[type="radio"] + .form-options-content .unchecked {
  fill: darken($background-color, 10%);
}
.form-group input[type="radio"] + .form-options-content .checked {
  fill: $primary-brand-color;
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $primary-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $primary-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content .checked {
  fill: $foreground-color;
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content .unchecked {
  width: 13px;
  fill: $foreground-color;
}

{# /* // Input */ #}

.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
}

{# /* // Buttons */ #}

.btn-primary {
  color: $background-color;
  border-radius: $box-radius;
  background: $primary-brand-color;
  letter-spacing: 2px;

  &:hover,
  &:focus,
  &:active {
    color: $background-color;
    background: $primary-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  border-radius: $box-radius;
  background: darken($background-color, 5%);
  color: $foreground-color;
  border-color: darken($background-color, 12%);

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: $background-color;
    color: lighten($primary-brand-color, 15%);
    border-color: lighten($primary-brand-color, 15%);
  }
  &.btn-icon-right {
    fill: $foreground-color;
  }
}
.btn-transparent {
  color: $secondary-brand-color;
  text-decoration: underline;

  &:hover {
    color: $secondary-brand-color;
    
    .btn-icon-right {
      fill: $secondary-brand-color;
    }
  }

  .btn-icon-right {
    fill: $secondary-brand-color;
  }
}

.btn-link {
  color: $foreground-color;
  text-decoration: none;

  &:hover {
    color: $primary-brand-color;

    svg {
      fill: $primary-brand-color;
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 12px;
  text-align: left;
}

{# /* // Breadcrumb */ #}

.breadcrumb li .breadcrumb-step {
  margin: 0;
  font-size: 12px;
  color: rgba($foreground-color, .6);
  background: none;
  text-transform: none;

  &.active {
    color: $foreground-color;
    background: none;

    &:before,
    &:after {
      position: relative;
      margin: 0 10px;
      border: 0;
      content: "-";
      opacity: .6;
    }
  }

  &.visited {
    color: rgba($foreground-color, .6);
    background: none;
  }
}
.breadcrumb li:first-child .breadcrumb-step,
.breadcrumb li:last-child .breadcrumb-step {
  padding: 0;
}

{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  border-color: $box-border-color;
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);
  
  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary .box-discount-coupon-applied {
  background: $background-color;
  border-bottom: 1px solid rgba($foreground-color, .1);
}
.summary-details {
  background: $background-color;
}
.summary-container {
  background: darken($background-color, 5%);
  box-shadow: none;
}
.summary-total {
  padding: 2px 0;
  font-size: 16px;
  color: $primary-brand-color;
  background: none;
}
.summary-img-thumb {
  background: none;
  border-radius: $box-radius;
}
.summary-arrow-rounded {
  background: none;
  border: 1px solid $foreground-color;
  .summary-arrow-icon {
    fill: $foreground-color;
  }
}
.summary-title {
  color: $foreground-color;
}
.summary-coupon {
  padding-right: 0;
  padding-bottom: 0;
  padding-left: 0;
}

{# /* // Radio */ #}

.radio-group {
  border-radius: $box-radius;
}

.radio-group-accordion {
  border-color: $box-border-color;

  .radio {
    border-color: lighten($box-border-color, 2%);
    &.active {
      color: $primary-brand-color;
      background: darken($background-color, 5%);
      .label {
        padding-bottom: 15px;
        color: $primary-brand-color;
        border-bottom: 1px solid rgba($foreground-color, .1);
      }
      .description {
        color: rgba($foreground-color, .6);
      }
      & + .radio-content {
        padding-top: 5px;
        background: darken($background-color, 5%);
        border-bottom: 1px solid $box-border-color;
      }
      .payment-item-discount {
        color: $primary-brand-color;
      }
    }
    .label {
      font-size: 16px;
      font-weight: 700;
    }
    .description {
      width: calc(100% - 35px);
      margin-left: 35px;
      font-weight: 400;
    }
  }
  .radio-content:last-child {
    border-radius: $box-radius;
  }
}

.radio input:checked + .selector:before {
  background-image: radial-gradient(circle, $primary-brand-color 0%, $primary-brand-color 40%, transparent 50%, transparent 100%);
  border-color: $primary-brand-color;
}
.radio input:disabled:checked + .selector:before {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
}

.radio .selector:before {
  width: 20px;
  height: 20px;
  margin: 1px 15px 0 0;
  border: 2px solid rgba($foreground-color, 0.6);
}

.radio-content {
  background: $background-color;
  border: 0;
  box-shadow: none;
}
.shipping-option {
  margin-bottom: -1px;
  border-radius: $box-radius;
  border-color: rgba($box-border-color, 0.7);

  &.active {
    position: relative;
    z-index: 1;
    background: darken($background-color, 5%);
    border-color: $primary-brand-color;
    .shipping-method-item-desc,
    .shipping-method-item-price {
      color: $primary-brand-color;
    }
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: lighten($foreground-color, 8%);
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: $box-shadow;
  border: 0;
  &.panel-with-header {
    padding-top: 0;
    p {
      margin-top: 0;
    }
  }
  &.summary-details {
    background: $background-color;
  }
  .panel-subheader:before {
    display: inline-block;
    width: 20px;
    margin: 0 14px 0 2px;
    vertical-align: middle;
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M256 288c79.5 0 144-64.5 144-144S335.5 0 256 0 112 64.5 112 144s64.5 144 144 144zm128 32h-55.1c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16H128C57.3 320 0 377.3 0 448v16c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48v-16c0-70.7-57.3-128-128-128z"/></svg>');
  }
  .panel-submodule:last-child .panel-subheader:before,
  .shipping-options .panel-subheader:before {
    width: 18px;
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-ship:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M226.8 94.6H0V63.8h242.2c8.5 0 15.4 6.9 15.4 15.4v41.6h70.1c4.7 0 9.1 2.1 12 5.8l57 71.2c2.2 2.7 3.4 6.1 3.4 9.6v85.5c0 8.5-6.9 15.4-15.4 15.4h-30.1c-6.2 16.6-22.3 28.5-41.1 28.5-24.2 0-43.9-19.6-43.9-43.9 0-24.2 19.6-43.9 43.9-43.9 18.8 0 34.9 11.8 41.1 28.5h14.7v-64.7l-49-61.2h-62.7v141.3c0 8.5-6.9 15.4-15.4 15.4h-85.5v-30.8h70.1V94.6zm-70.1 56.9H28.5v-30.8h128.2v30.8zm-28.5 57H0v-30.8h128.2v30.8zm-42.7 71.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1zm-43.9 13.2c0-24.2 19.6-43.9 43.9-43.9s43.9 19.6 43.9 43.9c0 24.2-19.6 43.9-43.9 43.9s-43.9-19.7-43.9-43.9zm271.8-13.2c-7.2 0-13.1 5.9-13.1 13.1 0 7.2 5.9 13.1 13.1 13.1 7.2 0 13.1-5.9 13.1-13.1 0-7.2-5.9-13.1-13.1-13.1z"/></svg>');
  }
  .new-shipping-flow .panel-subheader-pickup:before {
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400" fill="%23{{ settings.text_color |trim('#') }}"><path d="M198.3 0c-82.5 0-150 67.5-150 150 0 60 20 77.5 135 242.5 3.8 5 9.4 7.5 15 7.5s11.3-2.5 15-7.5c115-165 135-182.5 135-242.5 0-82.5-67.5-150-150-150zm0 348.5c-11.3-16.1-21.5-30.6-30.8-43.7C93.9 200.4 85.8 187.7 85.8 150c0-62 50.5-112.5 112.5-112.5S310.8 88 310.8 150c0 37.7-8.1 50.4-81.7 154.8-9.3 13.1-19.5 27.6-30.8 43.7z"/></svg>');
  }

  .shipping-address-container .panel-subheader:before {
    display: none;
  }
}
.panel-header {
  margin: 0;
  font-size: 28px;
  color: $foreground-color;
  text-align: left;
  border: 0;
  text-shadow: none;
}
.panel-header-sticky {
  background-color: $background-color;
}
.panel-header-button {
  position: absolute;
  top: 9px;
  right: 0;
  z-index: 2;
  width: auto;
}
.panel-subheader {
  font-weight: 400;
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table-footer {
  display: block;
  margin-top: 15px;
  font-size: 22px;
  font-weight: 700;
  color: $primary-brand-color;
  border-top: 1px solid rgba($foreground-color, 0.1);

  .text-semi-bold {
    font-weight: 400;
  }
}

.table-subtotal {
  margin: 0;
  padding: 15px 15px 5px 15px;
  background: darken($background-color, 5%);
  border-color: rgba($foreground-color, 0.1);

  td {
    padding: 3px 0;
  }
  .table tr {
    display: block;
  }
  .table-footer td {
    padding: 15px 0;
  }
}

.table.table-scrollable {
  background: darken($background-color, 5%);
  padding: 0;

  tr {
    border-top: 1px solid rgba($foreground-color, 0.1);
  }
  td {
    padding: 15px 0;
    &:last-child {
      padding-right: 15px;
    }
  }
  .summary-img-wrap {
    padding-right: 15px;
    padding-left: 15px;
  }
  .table-price {
    padding-right: 15px;
  }
}
.table .table-discount-coupon,
.table .table-discount-promotion {
  border: 0;
  color: $primary-brand-color;
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .btn {
    margin: 0;
    margin-top: -1px;
    background: $background-color;
    border: 1px solid rgba($box-border-color, 0.2);
    border-radius: $box-radius;
  }
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: desaturate(lighten($foreground-color, 10%), 80%);
}

.shipping-method-item-price {
  float: right;
  font-size: 16px;
  color: $foreground-color;
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 14px;
  color: rgba($foreground-color, .6);
  text-align: right;
}

{# /* // Discount Coupon */ #}

.box-discount-coupon button {
  @if lightness($foreground-color) < 90% {
    color: lighten($foreground-color, 80%);
  } @else {
    color: $foreground-color;
  }
  background: $primary-brand-color;

  &:hover {
    background: lighten($primary-brand-color, 15%) radial-gradient(circle,transparent 1%, lighten($primary-brand-color, 15%) 1%) center/15000%;
  }
}

.box-discount-coupon-applied {
  color: $primary-brand-color;
  border-radius: $box-radius;

  .coupon-icon {
    fill: $foreground-color;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border: 1px solid $box-border-color;
}

{# /* // Destination */ #}

.destination {
  border-color: rgba($foreground-color, 0.1);
  &-icon svg {
    fill: $primary-brand-color;
  }
}

{# /* // User Detail */ #}

.user-detail-icon svg {
  fill: $primary-brand-color;
}

{# /* // History */ #}

.history-item-done .history-item-title {
  color: $foreground-color;
}
.history-item-failure .history-item-title {
  color: $base-red;
}
.history-item-progress-icon svg {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);  
  } @else {
    fill: $background-color;
  }
}
.history-item-progress-icon:after {
  @if lightness($background-color) > 50% {
    fill: darken($background-color, 10%);
    border-color: darken($background-color, 10%);
  } @else {
    fill: $background-color;
    border-color: $background-color;
  }
}
.history-item-progress-icon-failure svg {
  fill: $base-red;
}
.history-item-progress-icon-success svg {
  fill: $primary-brand-color;
}
.history-item-progress-icon-success:after {
  border-color: $primary-brand-color;
}

{# /* // History Canceled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon svg {
  fill: darken($background-color, 45%);
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

{# /* // Status */ #}

.status {
  border: 1px solid $box-border-color;
  padding: 25px 0;
  &-icon svg {
    fill: $primary-brand-color;
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form input, 
.whatsapp-form .input-group-addon {
  border-color: $primary-brand-color;
}

{# /* // Headbar */ #}

.headbar {
  background: $background-color;
  box-shadow: none;

  .row {
    -ms-flex-align: center;
    align-items: center;
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 80px;
}

.headbar-logo-text {
  float: none;
  font-family: $logo-font;
  font-size: 34px;
  font-weight: 700;
  color: $foreground-color;

  &:hover {
    color: $foreground-color;
    opacity: .8;
  }

  &:focus {
    color: $background-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  color: $primary-brand-color;
  &:hover,
  &:focus {
    color: $primary-brand-color;
    opacity: .8;

    .headbar-continue-icon {
      fill: $primary-brand-color;
    }
  }
  &-icon {
    margin-left: 5px;
    fill: $primary-brand-color;
  }
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-item-discount {
  color: $primary-brand-color;
}

{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker .unchecked {
  fill: $foreground-color;
}
.list-picker li {
  border-color: $box-border-color;
  background: lighten($background-color, 10%);

  &:hover {
    color: $primary-brand-color;
  }

  &.active {
    background: $background-color;
    color: $primary-brand-color;

    .checked {
      fill: $primary-brand-color;
    }
  }
}

.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
  border-radius: $box-radius;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $primary-brand-color;
}
.loading-spinner {
  color: $primary-brand-color;
}
.loading-skeleton-radio {
  margin: 0 0 -1px 0;
  border-color: rgba($foreground-color, .1);
  border-radius: 0;
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $primary-brand-color;
  border-left-color: darken($primary-brand-color, 5%);
  
  &:after {
    border-color: $primary-brand-color;
    border-left-color: darken($primary-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $primary-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  border: 1px solid $box-border-color;
  padding: 25px 0;
  &-icon svg {
    fill: $primary-brand-color;
  }
}

{# /* // Modal */ #}

.modal-dialog {
  background: $background-color;
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .1);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($primary-brand-color, 10%);

  &-bg {
    background: $primary-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($primary-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $primary-brand-color;
  }
}

{# /* // Alert */ #}

.alert-info {
  background-color: rgba($primary-brand-color, .15);
  border-color: rgba($primary-brand-color, .2);
  color: desaturate(darken($primary-brand-color, 10%), 30%);

  .alert-icon {
    fill: desaturate(darken($primary-brand-color, 10%), 20%);
  }
}

{# /* // Chip */ #}

.chip {
  background-color: rgba($primary-brand-color, .15);
  color: desaturate(darken($primary-brand-color, 10%), 30%);
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Review Block Detailed  */ #}
.price--display__free {
  color: $primary-brand-color;
}

.review-block-detailed-item {
  border-bottom: 1px solid $box-border-color;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  &:last-child{
    border-radius: 0 0 $box-radius $box-radius;
  }

}

.review-block-detailed {
  border: 1px solid $box-border-color;
  border-radius: $box-radius;
  background-color: $background-color;
}
{# /* // Tabs */ #}

.tabs-wrapper {
  margin-top: -20px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  background: darken($background-color, 5%);
  border-bottom-color: darken($background-color, 10%);
}

.tab-item.active {
  color: $primary-brand-color;
  font-weight: bold;
}

.tab-indicator {
  background-color: $primary-brand-color;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Max width 576px */ #}

@media (max-width: $sm) {

  .summary .panel {
    border: 0;
  }

  .panel.summary-details {
    box-shadow: -2px 3px 7px 3px rgba($foreground-color,0.03);
  }

  .panel-header {
    font-size: 22px;
  }

  .panel-subheader {
    font-size: 12px;
  }

  .orderstatus-footer {
    background: $background-color;
  }

  .headbar-logo-text {
    font-size: 24px;
  }

}

{# /* // Min width 768px */ #}

@media (min-width: $md) {

  .status,
  .signup {
    padding: 40px 0;
  }

}

{# /* // Max width 0px */ #}

@media (max-width: $xs) {

  .modal-xs {
    background: $background-color;
  }

}

{% endif %}
