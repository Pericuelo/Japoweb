<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access');

$filenameJs = 'getlist.js';
$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
$path = 'components/com_japoweb/assets/';

JHTML::script($filenameJs, $path,  true);
JHTML::script('japoweb.js', $path,  true);
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
					<input type="checkbox" name="categoria[]" value="<?php echo $categoria->id; ?>" id="<?php echo $categoria->id; ?>">
					<label class="checkbox_label" for="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre; ?></label>
				</div>
			<?php endforeach; ?>
		</div>
		<div class="right_label">
			<p>Orden:
				<a href="javascript:ordenar('alf');">Alfabetico</a> |
				<a href="javascript:ordenar('masP');">Más palabras</a> |
				<a href="javascript:ordenar('menosP');">Menos palabras</a>
			</p>
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
			<p style="margin-left: 120px;">Ejemplo de formato: </p>
			<img class="right_label" id="format_preview" src="<?php echo JURI::base()."components/com_japoweb/assets/img/cols.png"; ?>"/>
		</div>
		<div class="clr"></div>
	</div>
	
	<div>
		<label for="informacion">Información:</label>
		<div class="right_label">
			<ul id="sortable-list">
				<li id="1"><input type="checkbox" name="info" value="img"> Imagen</li>
				<li id="2"><input type="checkbox" name="info" value="kana"> Kana</li>
				<li id="3"><input type="checkbox" name="info" value="romaji"> Romaji</li>
				<li id="4"><input type="checkbox" name="info" value="kanji"> Kanji</li>
				<li id="5"><input type="checkbox" name="info" value="sign"> Significado</li>
			</ul>
		</div>
		<input type="hidden" id="order" value="1,2,3,4,5" />
	</div>
	
	<div>
		<a onclick="return addFormat(this);" href="index.php?option=com_japoweb&view=getlist&format=raw">Haz clic aquí para generar la lista</span>
	</div>
	<div>
		<a onclick="return addFormat(this);" href="index.php?option=com_japoweb&view=getlist&format=raw&out=csv">Haz clic aquí para generar un CSV</span>
	</div>
</div>
