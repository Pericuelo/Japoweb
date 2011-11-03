/**
 * @author Pere Fonolleda
 */
window.addEvent('domready', function() {
	$('bloque_'+currentId).setStyle('display','block');
	
	if(teclado) {
		var langs = [];
		langs.push("JP");
		VirtualKeyboard.setVisibleLayoutCodes(langs);
		VirtualKeyboard.toggle('respuesta_'+currentId, 'keyboard');
	}
	
	$('anterior').addEvent('click', function() {
		if(currentId > 0) {
			$('bloque_'+currentId).setStyle('display','none');
			currentId--;
			$('bloque_'+currentId).setStyle('display','block');
			
			if(teclado)
				VirtualKeyboard.toggle('respuesta_'+currentId, 'keyboard');
		}
	});
	
	$('siguiente').addEvent('click', function() {
		if(currentId < max-1) {
			$('bloque_'+currentId).setStyle('display','none');
			currentId++;
			$('bloque_'+currentId).setStyle('display','block');
			
			if(teclado)
				VirtualKeyboard.toggle('respuesta_'+currentId, 'keyboard');
		}
	});
});
