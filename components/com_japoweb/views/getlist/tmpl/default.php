<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access');

$filenameJs = 'getlist.js';
$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
$path = 'components/com_japoweb/assets/';

JHTML::script($filenameJs, $path,  true);
JHTML::stylesheet($filenameCss, $path);
?>

<h1 class="componentheading"><?php echo JText::_('Crear lista'); ?></h1>
<div class="componentbody">
	<!-- Haremos llamada via Ajax y devolveremos directo el pdf --> 
	<div>
		<label for="categoria">Categorias:</label>
		<div id="cat_selector">
			<?php foreach($this->categorias as $categoria): ?>
				<div class="categoria">
					<input type="checkbox" name="categoria" value="<?php echo $categoria->id; ?>">
					<label class="checkbox_label" for="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre; ?></label>
				</div>
			<?php endforeach; ?>
		</div>
		<div class="right_label">
			<div>
				<input checked="checked" type="radio" name="catJoin" value="union" />
				Todos los terminos de todas las categorias seleccionadas:
				<img src="images/union.png" alt="union" />
			</div>
			<div>
				<input type="radio" name="catJoin" value="inters" />
				Solo los terminos que coinciden con todas las categorias seleccionadas:
				<img src="images/intersection.png" alt="interseccion" />
			</div>
		</div>
	</div>
	
	<div>
		<label for="format">Formato:</label>
		<div>
			<input checked="checked" type="radio" name="formato" value="cols"> Columnas
			<input type="radio" name="formato" value="grid"> Cuadricula
			<p style="margin-left: 120px; ">Ejemplo de formato: </p>
			<img class="right_label" id="format_preview" src="<?php echo JURI::base()."components/com_japoweb/assets/img/cols.png"; ?>"/>
		</div>
		<div class="clr"></div>
	</div>
	
	<div>
		<label for="informacion">Información:</label>
		<div>
			<input type="checkbox" name="info" value="img"> Image
			<input type="checkbox" name="info" value="kana"> Kana
			<input type="checkbox" name="info" value="romaji"> Romaji
			<input type="checkbox" name="info" value="kanji"> Kanji
			<input type="checkbox" name="info" value="sign"> Significado
		</div>
	</div>
	
	<div>
		<a onclick="addFormat(this)" target="_blank" href="index.php?option=com_japoweb&view=getlist&format=raw">Haz clic aquí para generar la lista</span>
	</div>
</div>
