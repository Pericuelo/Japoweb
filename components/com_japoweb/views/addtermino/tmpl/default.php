<?php
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filenameJs = 'japoweb.js';
$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
$pathTbl = $path.'textboxlist/';
$pathKB = $path.'virtualkeyboard/';
// MooTools will load if it is not already loaded
//JHTML::script($filenameJs, $path,  true);
JHTML::script('anadirTermino.js', $path,  true);
JHTML::script('kana_romaji.js', $path,  true);

// TextBoxList
JHTML::script('TextboxList.js', $pathTbl,  true);
JHTML::script('TextboxList.Autocomplete.js', $pathTbl,  true);
JHTML::script('TextboxList.Autocomplete.Binary.js', $pathTbl,  true);
JHTML::script('GrowingInput.js', $pathTbl,  true);
//VirtualKeyboard
JHTML::script('vk_loader.js', $pathKB, true);

JHTML::stylesheet('TextboxList.css', $pathTbl);
JHTML::stylesheet('TextboxList.Autocomplete.css', $pathTbl);
JHTML::stylesheet($filenameCss, $path);

//Modal windows
JHTML::_('behavior.modal'); 

//Validation
JHTML::_('behavior.formvalidation');
?>

<?php
	$user =& JFactory::getUser();
	if(!($userId = $user->id)) {
		// Redirect. No hay usuario logueado
	}
?>


<? /* <h1 class="componentheading"><?php echo JText::_('Añadir término'); ?></h1> */ ?>
<div id="info_message" class="invisible">
	<dl id="system-message">
	<dt class="message">Message</dt>
	<dd class="message message fade">
		<ul>
			<li><span><span  id="info_message_text"></span> <span id="cancelar_modificacion" onclick="limpiarForm()">Dejala como está. No quiero modificar esta palábra</span></li>
		</ul>
	</dd>
	</dl>
</div>
<div class="componentbody">
	<? /* <p><button onclick="VirtualKeyboard.toggle('kana', 'keyboard');">Teclado Japonés</button></p> */ ?>
	<div id="keyboard"></div>
	<form id="WV-form" method="post" enctype="multipart/form-data"  class="form-validate" onSubmit="return myValidate(this);">
		<div>
			<label for="kana">Kana:</label>
			<input class="required keyboardInput" type="text" name="kana" id="kana" onchange="" onblur="buscarTerminos($('kana').value); kana2romaji('kana','romaji',false);"
				 onfocus="VirtualKeyboard.attachInput(this)" value="<?php echo JRequest::getVar('kana', '', 'post'); ?>"/>
			<input type="text" name="romaji" id="romaji" disabled="true">

		</div>
		<div>
			<label for="kanji">Kanji:</label>
			<input class="keyboardInput" type="text" name="kanji" id="kanji" 
				onfocus="VirtualKeyboard.attachInput(this)" value="<?php echo $this->termino->kanji; ?>"/>
		</div>
		<div>
			<label for="significado">Significado:</label>
			<input class="required" type="text" name="significado" id="significado" onblur="buscarImagenesSiNoSeleccionada('significado');" value="<?php echo $this->termino->significado; ?>"/>
		</div>
		<div>
			<label for="categoria">Categorias:</label>
			<input id="cat_text_field" type="text" value="<?php echo $this->termino->categorias; ?>"/><span id="limpiar" onclick="textBo.clear()">Limpiar</span>
			<div id="cat_selector">
				<?php foreach($this->categorias as $categoria): ?>
					<div class="categoria"><span id="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre; ?><span></div>
				<?php endforeach; ?>
			</div>
			<!-- En realidad guardamos aquí los id's de las categorias de la forma "1|34|6|28|"... -->
			<input type="hidden" name="categorias" id="categorias" value=""/>
			<input type="hidden" name="categorias_nombres" id="categorias_nombres" value=""/>
		</div>
		<div>
			<label for="imagen">Imágen:</label>
			<span id="eliminar_imagen" onclick="eliminar_imagen();">Eliminar Imágen</span>
			<div id="selected_image">Sin Imagen</div>
			<input type="hidden" name="google_image" id="google_image" value=""/>
			<input type="hidden" name="original_image" id="original_image" value=""/>
		</div>
		<div>
			<div>
				<label for="buscar_imagenes">Buscar Imágenes:</label>
				<input id="image_query" type="text" value=""/>
				<span id="buscar_imagenes" onclick="buscarImagenes('image_query', 20);">Buscar Imágenes</span>
				<span id="buscar_imagenes" onclick="buscarImagenes('image_query',100);">Buscar Muuuchas Imágenes</span>
			</div>
			<div id="google_imgs"></div>
		</div>
		<div>
			<input id="submit" type="submit" name="submit" value="Guardar"/>
			<input type="hidden" id="old" name="old" value="0"/>
			<input type="hidden" name="option" value="com_japoweb"/>
			<input type="hidden" name="task" value="save"/>
			<input type="hidden" name="view" value="addtermino"/>
			<input type="hidden" name="id" value="<?php echo $this->termino->id; ?>"/>
			<input type="hidden" name="id_user" value="<?php echo $userId ?>"/>
		</div>
	</form>
</div>
