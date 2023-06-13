$(document).ready(function () {
    const filter_btn = $(".filter-product").hide();
    const price_btn = $(".dropdown-price")
    $(".filter-btn").click(function () {
        filter_btn.toggle(300);
        price_btn.hide(300);
    })
    $(".price-btn").click(function () {
        price_btn.toggle(300);
        filter_btn.hide(300);
    })

});