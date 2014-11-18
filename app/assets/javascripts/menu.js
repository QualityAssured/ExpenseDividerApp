$(document).ready(function() {
    $('.menu-opener').click(function() {
        $(this).toggleClass('menu-open');
        $('#menu').toggleClass('menu-open');
        $('#main-content').toggleClass('menu-open');
    })
});
