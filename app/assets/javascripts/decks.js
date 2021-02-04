$(document).on('turbolinks:load', function(){
	$(".dropdown-trigger").dropdown();

	$('.carousel').carousel({
		fullWidth: true,
		indicators: false,
		numVisible: 1,
		noWrap: true,
		duration: 0
	 });

	 $('.moveNextCarousel').click(function(e){
		e.preventDefault();
		e.stopPropagation();
		$('.carousel').carousel('next');
	 });

});