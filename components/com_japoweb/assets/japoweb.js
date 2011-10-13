window.addEvent( 'domready', function() {
	$$('.categoria').each(function(item, index) {
		item.addEvent('click', function() {
			var span = this.getChildren('span');
			var currentSpan = span[0];
			$('cat_text_field').value += currentSpan.get('text')+", ";
			$('categorias').value += currentSpan.id+"|";
		});
	});
	
	$('ajax-get-images').addEvent('click', function(event) {
		//prevent the page from changing
		event.stop();
		//make the ajax call, get DIV with images
		var req = new Request.HTML({
			method: 'get',
			url: 'components/com_japoweb/libs/ajaxImgDiv.php?q='+$('q').get('value'),
			data: { 'do' : '1' },
			//onRequest: /*Change class to loading*/,
			update: $('google_imgs'),
			//onComplete: function(response) { alert('Request completed successfully.'); $('message-here').setStyle('background','#fffea1');}
		}).send();
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

function select_img(id){
	$('selected_image').set('html','<img src="'+$('goo_img'+id).get('value')+'">');
}

