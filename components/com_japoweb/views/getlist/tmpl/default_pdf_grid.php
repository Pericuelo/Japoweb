<?php 
// No direct access
defined('_JEXEC') or die('Restricted access'); ?>

<?php
	$img = false; $kana = false; $kanji = false; $sign = false; 
	if(in_array('img', $this->info))
		$img = true;
	if(in_array('kana', $this->info))
		$kana = true;
	if(in_array('kanji', $this->info))
		$kanji = true;
	if(in_array('sign', $this->info))
		$sign = true;
	
	echo "<style>table td { width: 20%; text-align: center; }</style>";
?>

<?php $count = 1; ?>

<table class="grid">
	<?php foreach($this->terminos as $termino): ?>
		<?php if($count % 5 == 1): ?>
			<tr>
		<?php endif; ?>
		<td><span>
			
			<?php foreach($this->ordenedArray as $field):
				switch($field) {
					case "img":
						echo $this->displayImage($termino->img, false);
						break;
					case "kana":
						echo '<div>'.$termino->kana.'</div>';
						break;
					case "kanji":
						echo '<div>'.$termino->kanji.'</div>';
						break;
					case "romaji":
						echo '<div class="romaji_word" id="'.$count.'">'.$termino->kana.'</div>';
						break;
					case "sign":
						echo '<div>'.$termino->significado.'</div>';
						break;
				}
				endforeach;
			?>
		</span></td>
		<?php if($count % 5 == 0): ?>
			</tr>
		<?php endif; ?>
		<?php $count++; ?> 
	<?php endforeach; ?>
	<?php if($count%5 != 1) echo "</tr>" ?>
<table>
