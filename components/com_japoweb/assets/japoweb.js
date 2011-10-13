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

function buscarImagenesSiNoSeleccionada(query_source){
	if ($('google_image').get('value') == "") buscarImagenes(query_source);
}

function buscarImagenes(query_source) {
	//make the ajax call, get DIV with images
	var req = new Request.HTML({
		method: 'get',
		url: 'components/com_japoweb/libs/ajaxImgDiv.php?q='+$(query_source).get('value'),
		data: { 'do' : '1' },
		//onRequest: /*Change class to loading*/,
		update: $('google_imgs'),
		//onComplete: function(response) { alert('Request completed successfully.'); $('message-here').setStyle('background','#fffea1');}
	}).send();
}
 	
function select_img(id){
	$('google_image').set('value',$('goo_img'+id).get('value'));
	$('original_image').set('value',$('orig_img'+id).get('value'));
	
	$('selected_image').set('html','<img src="'+$('goo_img'+id).get('value')+'">');
}

