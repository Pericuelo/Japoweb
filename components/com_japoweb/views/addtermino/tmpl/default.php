<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filename = 'japoweb.js';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
// MooTools will load if it is not already loaded
JHTML::script($filename, $path, true);

?>

<?php
	$user =& JFactory::getUser();
	if(!($userId = $user->id)) {
		// Redirect. No ha usuario logueado
	}
?>


<h1 class="componentheading"><?php echo JText::_('Añadir término'); ?></h1>
<div class="componentbody">
	<form method="post" enctype="multipart/form-data" action="<?php echo JRoute::_('index.php');?>">
		<div>
			<label for="kana">Kana:</label>
			<input type="text" name="kana" value="<?php echo $this->termino->kana; ?>"/>
		</div>
		<div>
			<label for="kanji">Kanji:</label>
			<input type="text" name="kanji" value="<?php echo $this->termino->kanji; ?>"/>
		</div>
		<div>
			<label for="significado">Significado:</label>
			<input type="text" name="significado" value="<?php echo $this->termino->significado; ?>"/>
		</div>
		<div>
			<label for="categoria">Categorias:</label>
			<input id="cat_text_field" type="text" value="<?php echo $this->termino->categorias; ?>"/><span id="limpiar" onclick="clearCategorias()">Limpiar</span>
			<div id="cat_selector">
				<?php foreach($this->categorias as $categoria): ?>
					<div class="categoria"><span id="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre; ?><span></div>
				<?php endforeach; ?>
			</div>
			<!-- En realidad guardamos aquí los id's de las categorias de la forma "1|34|6|28|"... -->
			<input type="hidden" name="categorias" id="categorias" value=""/>
		</div>
		<div>
			<div>Imagen:</div>
			<div id="google_imgs"></div>
		</div>
		<div>
			<input type="submit" name="submit" value="Guardar"/>
			<input type="hidden" name="option" value="com_japoweb"/>
			<input type="hidden" name="task" value="save"/>
			<input type="hidden" name="view" value="addtermino"/>
			<input type="hidden" name="id" value="<?php echo $this->termino->id; ?>"/>
			<input type="hidden" name="id_user" value="<?php echo $userId ?>"/>
		</div>
	</form>
</div>
