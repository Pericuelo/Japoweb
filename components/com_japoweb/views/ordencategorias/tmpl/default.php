<?php
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filenameJs = 'japoweb.js';
$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
// MooTools will load if it is not already loaded
//JHTML::script($filenameJs, $path,  true);
JHTML::script('ordenCategorias.js', $path,  true);


JHTML::stylesheet($filenameCss, $path);

//Modal windows
JHTML::_('behavior.modal'); 
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
			<li><span id="info_message_text"></span></li>
		</ul>
	</dd>
	</dl>
</div>
<div class="componentbody">
	<p>Selecciona una categoría de la caja. Después arrastra las palabras para ordenarlas. Por ultimo pulsa guardad.</p><br>
	<? /* <p><button onclick="VirtualKeyboard.toggle('kana', 'keyboard');">Teclado Japonés</button></p> */ ?>
	<div>
		<label for="categoria">Categorias:</label>
		<div id="cat_selector">
			<?php foreach($this->categorias as $categoria): ?>
				<div class="categoria"><? echo '('.$categoria->num_palabras.') '; ?><span id="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre ?></span></div>
			<?php endforeach; ?>
		</div>
		<!-- En realidad guardamos aquí los id's de las categorias de la forma "1|34|6|28|"... -->
		<input type="hidden" name="categorias" id="categorias" value=""/>
	</div>
	<div id="tablaDragDropOrder" style="position:relative">
	</div>
</div>
<span id="guardar_orden" onclick="guardarOrden();">Guardar Orden</span>
