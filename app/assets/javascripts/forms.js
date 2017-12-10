
// some JQuery to animate rows when hovered over

$(document).ready(function() {
    $('.row').on('mouseenter', function(){
        $(this).animate({ fontSize: "+=10px", opacity: '0.5'}, "fast");
    });
    $('.row').on('mouseleave', function(){
        $(this).animate({ fontSize: "-=10px", opacity: '1'}, "fast");
    });
});