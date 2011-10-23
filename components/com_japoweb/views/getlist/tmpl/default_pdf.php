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

<div style="position: absolute; top: 0; left: 0; display: none;" id="print_div">
	<!-- Web2PDF Converter Button BEGIN -->
	<script type="text/javascript">
		var pdfbuttonlabel="Guardar en PDF"
	</script>
	<script src="http://www.web2pdfconvert.com/pdfbutton2.js" id="Web2PDF" type="text/javascript"></script>
	<!-- Web2PDF Converter Button END -->
</div>

<div onmouseover="document.getElementById('print_div').style.display = 'block'">
	<?php echo $this->loadTemplate('pdf_'.$this->formato); ?>
</div>
