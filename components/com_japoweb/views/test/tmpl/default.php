<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';

JHTML::stylesheet($filenameCss, $path);
?>

<?php
	$user =& JFactory::getUser();
	if(!($userId = $user->id)) {
		// Redirect. No hay usuario logueado
	}
?>


<h1 class="componentheading"><?php echo JText::_('Test'); ?></h1>
<div class="componentbody">
	<div>
		<div>
			<h2>Como funciona</h2>
			<p>Para hacer tests solo tienes que seleccionar:
				<ul>
					<li><strong>Categoria</strong> En esta primera versión, solo se puede seleccionar una categoria cada vez.</li>
					<li><strong>Número de preguntas</strong> Si no hay suficientes términos en la categoria seleccionada, se limitarán las preguntas al número de palabras.</li>
					<li><strong>Se mostrará</strong> Lo que se mostrará al preguntar</li>
					<li><strong>Se preguntará</strong> La respuesta que se espera en el campo de texto</li>
				</ul>
			</p>
			<p class="nota">
				<strong>Nota:</strong> Actualmente se guardan tus resultados al final del test. De este modo, al seleccionar las palabras se tiene en cuenta cuales has visto y
				cuales de las que ya has hecho eran incorrectas.
				De modo que primero te pregunta palabras que no han salido, después las palabras que más has fallado, y finalmente (si hay suficientes preguntas) las palabras que más te sabes.
			</p>
		</div>
	</div>
	<!-- div con el formulario -->
	<!-- Todos los elementos de la clase "test_config" para poder hacerlos no editables cuando empieze el ajax -->
	<form method="post" action="index.php?option=com_japoweb&view=test&layout=test">
		<div>
			<div>
				<label for="categoria">Categoria:</label>
				<div id="cat_selector">
					<?php foreach($this->categorias as $categoria): ?>
						<div class="categoria">
							<input type="radio" name="categoria" value="<?php echo $categoria->id; ?>" id="<?php echo $categoria->id; ?>" />
							<label class="checkbox_label" for="<?php echo $categoria->id; ?>"><?php echo $categoria->nombre; ?></label>
						</div>
					<?php endforeach; ?>
				</div>
			</div>
			<div>
				<label for="num_preg">Nº de preguntas:</label>
				<input type="text" size="4" name="num_preg" id="num_preg" value="20" />
			</div>
			<div>
				<div class="label">Se mostrará:</div>
				<div class="right_label">
					<input type="checkbox" name="info[]" value="img" /> Image<br/>
					<input type="checkbox" name="info[]" value="kana" checked="checked"/> Kana<br/>
					<input type="checkbox" name="info[]" value="romaji" /> Romaji<br/>
					<input type="checkbox" name="info[]" value="kanji" /> Kanji<br/>
					<input type="checkbox" name="info[]" value="sign" /> Significado<br/>
				</div>
			</div>
			<div>
				<div class="label">Se preguntará:</div>
				<div class="right_label">
					<input type="radio" name="resp" value="kana" /> Kana<br/>
					<!-- <input type="radio" name="resp" value="kanji" /> Kanji<br/> -->
					<input type="radio" name="resp" value="significado" checked="checked"/> Significado<br/>
				</div>
			</div>
			<div>
				<input type="submit" value="Empezar test" name="submit" />
			</div>
		</div>
	</form>
</div>
