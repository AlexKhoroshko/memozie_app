$(document).on('turbolinks:load', function(){
	$(".dropdown-trigger").dropdown();

	$('.carousel').carousel({
		fullWidth: true,
		indicators: false,
		numVisible: 1,
		noWrap: true,
		duration: 0
	 });
});