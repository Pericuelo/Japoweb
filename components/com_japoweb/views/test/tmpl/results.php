<?php
// No direct access
defined('_JEXEC') or die('Restricted access'); 

$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';

JHTML::stylesheet($filenameCss, $path);
?>

<h1 class="componentheading">Resultados</h1>
<div>
	<h2>Has hecho bien <?php echo ($this->total - $this->total_ko); ?> preguntas de <?php echo $this->total; ?>.</h2>
	<div>
		<h3>Las que has hecho mal son las siguientes</h3>
		<div>
			<ul>
				<?php foreach ($this->resultadosKo as $rKo): ?>
					<li>En el termino: <span class="correct"><?php echo $rKo->kana; ?>,
						<?php if($rKo->kanji != ""): ?>
							 <?php echo $rKo->kanji; ?>,
						<?php endif; ?>
						<?php echo $rKo->significado; ?></span>
						
						<?php if($rKo->respuestaKo != ""): ?>
							has puesto <span class="wrong"><?php echo $rKo->respuestaKo; ?></span>.
						<?php else: ?>
							no has escrito una respuesta.
						<?php endif; ?>
						
					</li>
				<?php endforeach; ?>
			</ul>
		</div>
	</div>
</div>
