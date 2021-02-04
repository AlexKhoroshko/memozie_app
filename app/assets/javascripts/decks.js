$(document).on('turbolinks:load', function(){
	$(".dropdown-trigger").dropdown();
	
	var nodes = Array.prototype.slice.call( document.getElementsByClassName('carousel-item'));
	$('.carousel').carousel({
		fullWidth: true,
		indicators: false,
		numVisible: 1,
		noWrap: true,
		duration: 0,
		onCycleTo: function (ele) {		
			console.log($(ele).parent())	
			if ($(ele).index() == nodes.length - 1)
				$('.moveNextCarousel').click(function(e){
					$.ajax({
						url:  "/decks",
						type: "get",
						success: function(data) {
							window.location = '/'
							alert("Review of the deck finished!")						
						}
					});
				});
		  }
	 });

	 $('.moveNextCarousel').click(function(e){
		e.preventDefault();
		e.stopPropagation();
		$('.carousel').carousel('next');
	 });

});