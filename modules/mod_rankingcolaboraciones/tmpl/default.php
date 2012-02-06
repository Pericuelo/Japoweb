<?php defined('_JEXEC') or die('Restricted access'); // no direct access ?>

<?php //JHTML::stylesheet("modulos.css", "components/com_japoweb/assets/"); ?>
<?php
	$document =& JFactory::getDocument();
	$document->addStyleDeclaration("ol { list-style: cjk-ideographic; } .nota { font-size: 90%; color: #a2a2a2; font-style: italic; }");
?>

<div>
	<ol>
	    <?php for($i=0; $i<$usersCount; $i++) { ?>
	    <li>
	        <?php
	        	$item = $items[$i];
				if($i == 0) echo "<strong>";
	        	echo $item->name." <span class='nota'>(".$item->points." puntos)</span>";
				if($i == 0) echo "</strong>";
			?>
	    </li>
	    <?php } ?>
	</ol>
	<div class="nota">Se cuentan 3 puntos por cada palabra añadida y 1 por cada modificación</div>
</div>



