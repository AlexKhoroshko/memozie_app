$( document ).on('turbolinks:load', function() {

	$('body').on('click', '.content_toggle', function(){

		$('.content_block').slideToggle(300);      

		return false;

	});

});