$(function(){
	$('li').mouseover(function(e) {
        $(this).siblings().stop().fadeTo(500,0.4);
    });
	$('li').mouseout(function(e) {
        $(this).siblings().stop().fadeTo(500,1);
    });
})

