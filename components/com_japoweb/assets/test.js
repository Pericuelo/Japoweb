/**
 * @author Pere Fonolleda
 */
window.addEvent('domready', function() {
	$('bloque_'+currentId).setStyle('display','block');
	
	$('anterior').set('disabled','disabled');
	
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
			
			$('siguiente').disabled = '';
			
			if(currentId == 0) {
				$('anterior').set('disabled','disabled');
			}
			
			if(teclado)
				VirtualKeyboard.toggle('respuesta_'+currentId, 'keyboard');
		}
	});
	
	$('siguiente').addEvent('click', function() {
		if(currentId < max-1) {
			$('bloque_'+currentId).setStyle('display','none');
			currentId++;
			$('bloque_'+currentId).setStyle('display','block');
			
			$('anterior').disabled = '';
			
			if(currentId == max-1) {
				$('siguiente').set('disabled','disabled');
			}
			
			if(teclado)
				VirtualKeyboard.toggle('respuesta_'+currentId, 'keyboard');
		}
	});
});
