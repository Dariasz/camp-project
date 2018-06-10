$(document).ready(function(){
	$("#apply").hide();

$(function() {
	$('ul.nav a').bind('click',function(event){
		var $anchor = $(this);
		/*
		if you want to use one of the easing effects:
		$('html, body').stop().animate({
			scrollLeft: $($anchor.attr('href')).offset().left
		}, 1500,'easeInOutExpo');
		 */
		$('html, body').stop().animate({
			scrollTop: $($anchor.attr('href')).offset().left
		}, 300);
		event.preventDefault();
	});
});

$(window).scroll( function() {

 var sv = $(document).scrollTop().valueOf();
 var section = [];
 for( var i = 0; i <= 5; i++ ){
	 section[i]=$("#section" + i).offset().top - 250;
 }
 var banner = $("#banner").html();
 	if(sv < section[1]){
	 $("#banner").html("");
	 return;
 	}
 	if(sv < section[2]){
		$("#banner").html("COMMUNITY");
		return;
	}
	if(sv < section[3]){

		$("#banner").html("MATHS");
		return;
	}
	if(sv < section[4]){

		$("#banner").html("FUN");
		return;
	}
	if(sv < section[5]){

		$("#banner").html("NATURE");
		return;
	}else{
		$("#banner").html("JOIN US!");

		return;
	}
});

$(".slider").click(function(){
	var t = $(this);
	$('html, body').stop().animate({
		scrollTop: ($(t.attr('href')).offset().top - 200)
	}, 2000);
	event.preventDefault();
	});

$(".slidering").hover(function(){
	$(this).css("background-color","#b9b9b9")
},
function(){
	$(this).css("background-color","white")
});

$(".lastSlider").click(function(){
	$("html, body").animate({ scrollTop: $(document).height() }, 2000);
});

});
