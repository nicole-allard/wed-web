

$(function() {
	var $window = $(window);
	var FADE_AFTER_SCROLL_TOP = 400;
	var FIXED_POSITION_AFTER_SCROLL_TOP = 660;
	
	$window.on('scroll', function() {
   		
   		var scrollTop = $(this).scrollTop();
   		
   		var hackDiv = $('div.hackDiv').hide();
   		hackDiv.appendTo('body');
   		
   		hackDiv.css({
   			height: $('.header').height()	
   		})
   		
   		var relativeScrollTop = scrollTop - FADE_AFTER_SCROLL_TOP;
   		
   			$('.tree').css({
   				opacity : 1 - relativeScrollTop/100
   			});
   		
   			if(scrollTop > FIXED_POSITION_AFTER_SCROLL_TOP) {
   				$('.header').css({
   					position: 'fixed',
   					top: '-669px'
   				});
   				hackDiv.show();
   			} else {
   				$('.header').css({
   					position: '',
   					top: ''
   				})
   				hackDiv.hide();
   			}
   		
	});
	
});
