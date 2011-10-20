<?php 
// No direct access
defined('_JEXEC') or die('Restricted access'); ?>

<!-- Usaré este tmpl común para los estilos, cabezeras y demás -->
<style>
	table { border-collapse: collapse; width: 100%; }
	table td span { display: inline-block; margin: 5px; }
	.image { width: 150px; height: 150px; text-align: center; }
	.image img { vertical-align: bottom; }
	div.image { line-height: 150px; }
	.col_spacer { border-right: 1px solid #000000; }
</style>

<?php echo $this->loadTemplate('pdf_'.$this->formato); ?>

