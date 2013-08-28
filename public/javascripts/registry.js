
$(function() {
	$('form').submit(function(e) {
		e.preventDefault();
		var items = $('li[data-item-id]').map(function() {
			return $(this).data('item-id') + escape('=')  + $(this).find('select').val();
		});
		
		// Somewhat hacky way of making a real form submit
		$('<form>')
			.attr({
				'action': '/registry/update_reservations?item-counts=' + items.toArray().join('%2C'),
				'method': 'post'
			})
			.appendTo('body')
			.submit();
	});
});

