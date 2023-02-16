
$(document).ready(function () {
    const desc = $(".desc").hide();
    const order = $(".order").hide();
    $(".btn-more").click(function () {
        desc.toggle(300);
        order.hide(300);
    });
    $(".btn-more-order").click(function () {
        order.toggle(300);
        desc.hide(300);
    });
});
