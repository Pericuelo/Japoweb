window.addEvent( 'domready', function() {
	$$('.categoria').each(function(item, index) {
		item.addEvent('click', function() {
			var span = this.getChildren('span');
			var currentSpan = span[0];
			$('cat_text_field').value += currentSpan.get('text')+", ";
			$('categorias').value += currentSpan.id+"|";
		});
	});
});

function clearCategorias() {
	$('cat_text_field').value = '';
	$('categorias').value = '';
}
