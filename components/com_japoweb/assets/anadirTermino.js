window.addEvent( 'domready', function() {
	VirtualKeyboard.toggle('kana', 'keyboard');
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

function buscarTerminos(kana) {
	//make the ajax call, get DIV with images
	if(kana != ""){
		var req = new Request({
			method: 'get',
			url: 'index.php?option=com_japoweb&view=addtermino&format=terminos_table&kana='+kana,
      data: { 'do' : '1' },
      onComplete: function(response) { mostrarPopupTerminos(response); }
		}).send();
	}
}

function mostrarPopupTerminos(response){
	if(response != ""){
		options = {size: {x: 300, y: 250}};
		SqueezeBox.initialize(options);
		SqueezeBox.setContent('string',response);			
	}
}

function obtenerTermino(id){
	SqueezeBox.close();
	var req = new Request({
		method: 'get',
		url: 'index.php?option=com_japoweb&view=addtermino&format=termino&id='+id,
	    data: { 'do' : '1' },
	    onComplete: function(response) { cargarTermino(response, id); }
	}).send();
}

function cargarTermino(termino, id){
	limpiarForm();
	term = JSON.decode(termino);

	$('old').set('value', id);
	$('kana').set('value',term[0].kana);
	if (term[0].kanji != null)
		$('kanji').set('value',term[0].kanji);
	$('significado').set('value',term[0].significado);
	if (term.imagen[0] != null)
		$('selected_image').set('html','<img src="images/img_vocabulario/peques/'+term.imagen[0].fichero+'">');
	Array.each(term.categorias, function(cat, index){
		textBo.add(cat.nombre,cat.id);
	});	
}

function limpiarForm(){
	$('old').set('value', 0);
	$('kana').set('value','');
	$('kanji').set('value','');
	$('significado').set('value','');
	eliminar_imagen();
	textBo.clear();	
}

function select_img(id){
	$('google_image').set('value',$('goo_img'+id).get('value'));
	$('original_image').set('value',$('orig_img'+id).get('value'));
	
	$('selected_image').set('html','<img src="'+$('goo_img'+id).get('value')+'">');
}

function eliminar_imagen(){
	$('selected_image').set('html','Sin Imagen');

	$('google_image').set('value','');
	$('original_image').set('value','');	
}

function myValidate(f) {
	actualizarCategorias();
   	if (document.formvalidator.isValid(f)) {
    	f.check.value='<?php echo JUtility::getToken(); ?>'; //send token
		return true; 
   	}
   	else {
      /*
      var msg = 'Some values are not acceptable.  Please retry.';
 
      //Example on how to test specific fields
      //if($('email').hasClass('invalid')){msg += '\n\n\t* Invalid E-Mail Address';}
 
      alert(msg);
      */
   	}
	window.scroll(0,0);
   	return false;
}