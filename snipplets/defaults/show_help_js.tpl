<script type="text/javascript">
    $(document).ready(function(){ 
        {# 404 handling to show the example product #}
        if ( window.location.pathname === "/product/example/" ) {
            document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
            $("#404").hide();
            $("#product-example").show();
        } else {
            $("#product-example").hide();
        }
    });
</script>