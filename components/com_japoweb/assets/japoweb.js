window.addEvent( 'domready', function() {
	$$('.categoria').each(function(item, index) {
		item.addEvent('click', function() {
			var span = this.getChildren('span');
			var currentSpan = span[0];
			$('cat_text_field').value += currentSpan.get('text')+", ";
			$('categorias').value += currentSpan.id+"|";
		});
	});
	var textBo = new TextboxList('cat_text_field', {unique: true, plugins: {autocomplete: {
		minLength: 2,
		queryRemote: true,
		remote: {url: 'index.php?option=com_japoweb&view=addtermino&format=raw'}
	}}});
});

function clearCategorias() {
	$('cat_text_field').value = '';
	$('categorias').value = '';
}
