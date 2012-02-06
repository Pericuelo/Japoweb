window.addEvent('domready', function () {
	var langs = [];
	langs.push("JP");
	VirtualKeyboard.setVisibleLayoutCodes(langs)
	
	$('keyword').addEvents({
		'focus' : function() {
			if (this.get('value') == this.defaultValue) {
				this.set('value', '');
			}
			if($('use_keyboard').checked) {
				VirtualKeyboard.toggle('keyword', 'keyboard');
			}
		},
		
		'blur' : function() {
			if (this.get('value') == '') {
				this.set('value', (this.defaultValue));
			}
			if($('use_keyboard').checked) {
				VirtualKeyboard.toggle('keyword', 'keyboard');
			}
		}
	});
});