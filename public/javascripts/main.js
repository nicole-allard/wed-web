

$(function() {
	var $window = $(window);
	
	var FADE_AFTER_SCROLL_TOP = 400;
	var FIXED_POSITION_AFTER_SCROLL_TOP = 640;
	var inFixedMode = false;
   		
	var headerHeight = $('.header').height();
	
	$window.bind('scroll', function() {
   		
   		var scrollTop = $(this).scrollTop();
   		
   		
   		var relativeScrollTop = scrollTop - FADE_AFTER_SCROLL_TOP;
   		
		$('.tree').css({
			opacity : 1 - relativeScrollTop/140
		});
		
		if (scrollTop > FADE_AFTER_SCROLL_TOP) {
			$('.navigation-hack').css('background-color', '#white');
		} else {
			$('.navigation-hack').css('background-color', '');	
		}
		
			
		if(scrollTop > FIXED_POSITION_AFTER_SCROLL_TOP) {
			
			var height = $('.navigation-hack').outerHeight();
			
			
			$('.navigation-hack').css({
				position: 'fixed',
				top:'0px',
				paddingTop: '20px'
			});
			
			$('.main-container').css('margin-top', height + 'px');
			
		} else {
			$('.navigation-hack').css({
				position: '',
				top:'',
				paddingTop: ''
			});
			$('.main-container').css('margin-top', '');
		}
	});
	
	
	if($('body').hasClass('visited')) {
		$window.scrollTop(FIXED_POSITION_AFTER_SCROLL_TOP);
	}
	
	
});
