window.addEvent( 'domready', function() {
	$$('.categoria').each(function(item, index) {
		item.addEvent('click', function() {
			var span = this.getChildren('span');
			var currentSpan = span[0];
			obtenerPalabras(currentSpan.id);
		});
	});
	
  	var sortInput;
  	var submit;
  	var messageBox;
  	var list;
	var request;

});

function guardarOrden(){	
	/* store values */
	if ($('cat_id') == null){
		alert('Escoje una categoría')
	}else{
		var sortOrder = [];
		list.getElements('li').each(function(li) {
		  sortOrder.push(li.get('title'));
		});
		$('sort_order').set('value', sortOrder.join(','));
		request.send('cat_id=' + $('cat_id').get('value') + '&sort_order=' + $('sort_order').get('value') + '&do_submit=1');
	}
} 

function obtenerPalabras(id){
	$('info_message').addClass('invisible');
	var req = new Request({
		method: 'get',
		url: 'index.php?option=com_japoweb&view=ordencategorias&format=listaPalabras&id='+id,
	    data: { 'do' : '1' },
	    onComplete: function(response) { 
	    	$('tablaDragDropOrder').set('html', response);
	    	/* grab important elements */
	    	sortInput = document.id('sort_order');
	    	submit = document.id('autoSubmit');
	    	messageBox = document.id('message-box');
	    	list = document.id('sortable-list');
		  
			/* get the request object ready;  re-use the same Request */
			request = new Request({
				url: 'index.php?option=com_japoweb&view=ordencategorias&format=ordenarCategorias',
				link: 'cancel',
				method: 'post',
			    data: { 'do' : '1' },
				onRequest: function() {
					//messageBox.set('text','Updating the sort order in the database.');
				},
				onComplete: function(response) {
					$('info_message').removeClass('invisible');
					$('info_message_text').set('html', 'La categoría se ha ordenado.');
				}
			});
		 
			/* sortables that also *may* */
			new Sortables(list,{
				constrain: true,
				clone: true,
				revert: true,
			});		  
	    }
	}).send();
}
