<?php defined('_JEXEC') or die('Restricted access'); // no direct access ?>

<?php //JHTML::stylesheet("modulos.css", "components/com_japoweb/assets/"); ?>
<?php
$document =& JFactory::getDocument();
$document->addStyleDeclaration("ol { list-style: cjk-ideographic; }");
?>

<div>
	<ol>
	    <?php foreach ($items as $key => $item) { ?>
	    <li>
	        <?php
	        	if($item->kanji != "") { echo $item->kanji.", "; }
				if($item->kana != "") { echo $item->kana.", "; }
				if($item->significado != "") { echo $item->significado; }
			?>
	    </li>
	    <?php } ?>
	</ol>
</div>


