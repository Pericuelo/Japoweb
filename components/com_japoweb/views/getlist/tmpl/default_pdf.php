<?php 
// No direct access
defined('_JEXEC') or die('Restricted access'); ?>

<!-- Usaré este tmpl común para los estilos, cabezeras y demás -->
<style>
	table { border-collapse: collapse; width: 100%; }
	table td { /*width: 100px;*/ }
	table td.kana { white-space: nowrap; }
	table td span { display: inline-block; margin: 5px;}
	.image { width: 150px; height: 150px; text-align: center; }
	.image img { vertical-align: bottom; }
	div.image { line-height: 150px; }
	.col_spacer { border-right: 1px solid #000000; width: auto; }
</style>

<?
	$this->assign('img',false); $this->assign('kana',false); $this->assign('kanji',false); $this->assign('sign',false); $this->assign('romaji',false); 
	if(in_array('img', $this->info))
		$this->assign('img',true);
	if(in_array('kana', $this->info))
		$this->assign('kana',true);
	if(in_array('kanji', $this->info))
		$this->assign('kanji',true);
	if(in_array('sign', $this->info))
		$this->assign('sign',true);
	if(in_array('romaji', $this->info))
		$this->assign('romaji',true);
?>

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

<?php if($this->romaji): ?>
	<script type="text/javascript" src="components/com_japoweb/assets/kana_romaji.js"></script>
	<script type="text/javascript">
		allKana2romaji('romaji_word');
	</script>
<?php endif; ?>
