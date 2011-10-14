window.addEvent( 'domready', function() {
	//VirtualKeyboard.toggle('kana', 'keyboard');
	textBo = new TextboxList('cat_text_field', {unique: true, plugins: {autocomplete: {
		minLength: 2,
		queryRemote: true,
		remote: {url: 'index.php?option=com_japoweb&view=addtermino&format=categorias'}
	}}});

	$$('.categoria').each(function(item, index) {
		item.addEvent('click', function() {
			var span = this.getChildren('span');
			var currentSpan = span[0];
			textBo.add(currentSpan.get('text'),currentSpan.id);
		});
	});		
});

function clearCategorias() {
	$('cat_text_field').value = '';
	$('categorias').value = '';
}

function actualizarCategorias(){
	cat_ids = textBo.getValues();
	$('categorias').value = '';
	$('categorias_nombres').value = '';
	for(i=0; i<cat_ids.length; i++) {
		$('categorias').value += cat_ids[i][0]+"|";
		$('categorias_nombres').value += cat_ids[i][1]+"|";
	}
	$('categorias').value = $('categorias').value.slice(0, -1);
	$('categorias_nombres').value = $('categorias_nombres').value.slice(0, -1);
}

function buscarImagenesSiNoSeleccionada(query_source){
	if ($('google_image').get('value') == "") buscarImagenes(query_source, 20);
}

function buscarImagenes(query_source, cuantas) {
	//make the ajax call, get DIV with images
	if($(query_source).get('value') != ""){
		var req = new Request.HTML({
			method: 'get',
			url: 'components/com_japoweb/libs/ajaxImgDiv.php?q='+$(query_source).get('value')+'&cuantas='+cuantas,
			data: { 'do' : '1' },
			onRequest: $('google_imgs').set('html','Buscando imagenes con "'+$(query_source).get('value')+'"'),
			update: $('google_imgs'),
			//onComplete: function(response) { alert('Request completed successfully.'); $('message-here').setStyle('background','#fffea1');}
		}).send();
	}
}
 	
function select_img(id){
	$('google_image').set('value',$('goo_img'+id).get('value'));
	$('original_image').set('value',$('orig_img'+id).get('value'));
	
	$('selected_image').set('html','<img src="'+$('goo_img'+id).get('value')+'">');
}

function eliminar_imagen(){
	$('google_image').set('value','');
	$('original_image').set('value','');
	
	$('selected_image').set('html','Sin Imagen');
}