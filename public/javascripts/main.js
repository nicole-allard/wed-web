

$(function() {
	var $window = $(window);
	var FADE_AFTER_SCROLL_TOP = 400;
	var FIXED_POSITION_AFTER_SCROLL_TOP = 660;
	var inFixedMode = false;
   		
	var headerHeight = $('.header').height();
	
	$window.on('scroll', function() {
   		
   		var scrollTop = $(this).scrollTop();
   		
   		
   		var relativeScrollTop = scrollTop - FADE_AFTER_SCROLL_TOP;
   		
		$('.tree').css({
			opacity : 1 - relativeScrollTop/100
		});
		
		
		
		if (scrollTop > FADE_AFTER_SCROLL_TOP) {
			$('.navigation-hack').css('background-color', '#F1F1F1');
		} else {
			$('.navigation-hack').css('background-color', '');	
		}
		
			
		if(scrollTop > FIXED_POSITION_AFTER_SCROLL_TOP) {
			$('.navigation-hack').css({
				position: 'fixed',
				top:0,
			});
			
			var height = $('.navigation-hack').height();
			$('.main-container').css('margin-top', height);
		} else {
			$('.navigation-hack').css({
				position: '',
				top:'',
			});
			$('.main-container').css('margin-top', '');
		}
	});
	
});
