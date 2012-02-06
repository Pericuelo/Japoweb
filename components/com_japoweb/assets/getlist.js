window.addEvent('domready', function () {
	$$("input[name=formato]").each(function(item, i) {
		item.addEvent('click', function() {
			var src = $("format_preview").src;
			var pos = src.indexOf('cols.png');
			if(pos == -1)
				pos = src.indexOf('grid.png');
		
			$("format_preview").src = src.slice(0,pos)+this.value+".png";
		});
	});
});

function addFormat(anchor) {
	var categorias = '&categorias=';
	$$("input[name=categoria]:checked").each(function(item, i) {
	   // Id categoria = item.value
	   categorias += item.value+"|";
	});
	
	var catJoin = "&catJoin=";
	$$("input[name=catJoin]:checked").each(function(item, i) {
	   // Id categoria = item.value
	   catJoin += item.value+"|";
	});
	
	var format = '&formato=';
	$$("input[name=formato]:checked").each(function(item, i) {
	   // Id categoria = item.value
	   format += item.value+"|";
	});
	
	var info = '&info=';
	$$("input[name=info]:checked").each(function(item, i) {
	   // Id categoria = item.value
	   info += item.value+"|";
	});
	
	href = anchor.href+categorias+format+info+catJoin;
	
	newwindow = window.open(href,'target=_blank');
	if (window.focus) {newwindow.focus()}
	
	return false;
}
