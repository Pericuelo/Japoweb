<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filenameJs = 'japoweb.js';
$filenameCss = 'japoweb.css';
$path = 'components/com_japoweb/assets/';
$pathKB = $path.'virtualkeyboard/';
// MooTools will load if it is not already loaded
JHTML::script('test.js', $path,  true);
JHTML::script('kana_romaji.js', $path,  true);

//VirtualKeyboard
JHTML::script('vk_loader.js', $pathKB, true);

JHTML::stylesheet($filenameCss, $path);
$count = 0;

$teclado = ($this->resp == "kana" || $this->resp == "kanji");
?>

<script type="text/javascript">
	// Pasamos las variables
	var currentId = 0;
	var max = <?php echo $this->maxPreg; ?>;
	var teclado = <?php var_export($teclado); ?>;
</script>

<?php if($this->numPreg > $this->maxPreg): ?>
	<div>
		No hay suficientes términos en la categoria seleccionada. Se harán <?php echo $this->maxPreg; ?> preguntas.
	</div>
<?php endif; ?>
<div id="keyboard"></div>
<div>
	<form action="index.php?option=com_japoweb&view=test&layout=results" method="post">
		<?php foreach($this->preguntas as $pregunta): ?>
			<div class="preg_bloque" id="bloque_<?php echo $count; ?>">
				<!-- Pregunta -->
				<div class="pregunta">
					<div class="pregunta_num">
						Pregunta <?php echo $count+1; ?> de <?php echo $this->maxPreg; ?>.
					</div>
					<?php if(in_array('img', $this->info)): ?>
						<div class="image">
						<?php if(is_file("images/img_vocabulario/peques/".$pregunta->img)): ?>
							<img src="images/img_vocabulario/peques/<?php echo $pregunta->img ?>" alt="<?php echo $pregunta->significado ?>"/>
						<?php else: ?>
							<div class="no_image"><?php echo $pregunta->significado ?></div>
						<?php endif; ?>
						</div>
					<?php endif; ?>
					<?php if(in_array('kana', $this->info)): ?>
						<?php echo $pregunta->kana ?><br/>
					<?php endif; ?>
					<?php if(in_array('kanji', $this->info)): ?>
						<?php echo $pregunta->kanji ?><br/>
					<?php endif; ?>
					<?php if(in_array('romaji', $this->info)): ?>
						<div class="romaji_word" id="<?php echo $count; ?>"><?php echo $pregunta->kana ?></div>
					<?php endif; ?>
					<?php if(in_array('sign', $this->info)): ?>
						<?php echo $pregunta->significado ?><br/>
					<?php endif; ?>
					<input type="hidden" name="pregunta[<?php echo $count; ?>]" id="pregunta_<?php echo $count; ?>" value="<?php echo $pregunta->id; ?>">
				</div>
				
				<!-- Respuesta -->
				<div class="respuesta">
					<!-- A posar si es necesita el kana: -->
					<input type="text" autocomplete="off" <?php if($teclado) { echo 'class="keyboardInput"'; }  ?>
						name="respuesta[<?php echo $count; ?>]" id="respuesta_<?php echo $count; ?>" onfocus="VirtualKeyboard.attachInput(this)" />
					<div class="nota">La respuesta debe ser <?php if($this->resp == "significado") echo "el"; else echo "en"; ?> <?php echo $this->resp; ?></div>
				</div>
			</div>
			<?php $count++ ?>
		<?php endforeach; ?>
		<!-- Botones -->
		<div class="botones">
			<input type="button" id="anterior" value="Anterior" />
			<input type="button" id="siguiente" value="Siguiente" />
		</div>
		<div class="finalizar">
			<input type="submit" id="finalizar" value="Finalizar">
			<input type="hidden" name="resp" value="<?php echo $this->resp; ?>">
		</div>
	</form>
</div>
<!--<div>
	<div>Más info</div>
	<div id="mas_info">
		<div>Categorias seleccionadas: <?php foreach($this->categorias as $cat) { echo $cat.", "; } ?></div>
		<div>Palabras por categoria:
			<ul>
			</ul>
		</div>
		<div>Total posibles palabras:</div>
	</div>
</div>-->
