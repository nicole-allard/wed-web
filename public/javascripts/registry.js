
$(function() {
	$('button.submit').click(function(e) {
		var items = $('li[data-item-id]').map(function() {
			return $(this).data('item-id') + '=' + $(this).find('select').val();
		});
		
		$('form input[name=item-counts]').val(items.toArray().join(','));
		$('form').submit();
	});
});

