/**
 * @author Pere Fonolleda
 */
function ordenar(ord) {
	var req = new Request({
		method: 'get',
		url: 'index.php?option=com_japoweb&view=test&format=categorias&order='+ord,
		data: { 'do' : '1' },
	    onComplete: function(response) { cargarCategorias(response); }
	}).send();
}

function cargarCategorias(response) {
	var container = $('cat_selector');
	var categories = JSON.decode(response);
	var selected = new Array();
	var i = 0;
	
	// Guardem les categories ja sel·leccionades
	$$('div.categoria input').each(function(item) {
		if(item.checked) {
			selected[i] = item.id;
			i++;
		}
	});
	
	container.set('html','');
	
	Array.each(categories, function(cat, index) {
		var div = new Element('div', { "class": "categoria" });
		var input = new Element('input', { type: "checkbox", name: "categoria[]", value: cat.id, id: cat.id });
		var label = new Element('label', { "class": "checkbox_label", "for": cat.id, html: "&nbsp;"+cat.nombre });
		div.grab(input);
		div.grab(label);
		
		container.grab(div);
	});
	
	// Volvemos a poner los items que ya estaban seleccionados
	selected.each(function(item) {
		$(item).checked = true;
	});
}