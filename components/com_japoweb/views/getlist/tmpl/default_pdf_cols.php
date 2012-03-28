<?php 
// No direct access
defined('_JEXEC') or die('Restricted access'); ?>

<?php
	$cols = 3;
	
	$totalTerms = count($this->terminos);
	$termsCol = ceil($totalTerms / $cols);
		
	$fields = intval($this->img)+intval($this->kana)+intval($this->kanji)+intval($this->sign);
	$totalCols = $fields*$cols;
	$perCent = floor(100/($totalCols/$cols));
?>

<table class="cols">
	<tr>
		<td colspan="<?php echo $fields+1; ?>" width="33%">&nbsp;</td>
		<td colspan="<?php echo $fields+1; ?>" width="33%">&nbsp;</td>
		<td colspan="<?php echo $fields+1; ?>" width="33%">&nbsp;</td>
	</tr>
	<?php for($i = 0; $i < $termsCol; $i ++): ?>
		<?php
			$terminoLeft = $this->terminos[$i];
			$terminoCenter = $this->terminos[$i+$termsCol];
			$terminoRight = $this->terminos[$i+$termsCol+$termsCol];
		?>
		<tr>
			<?php foreach($this->ordenedArray as $field):
				switch($field) {
					case "img":
						echo $this->displayImage($terminoLeft->img, true);
						break;
					case "kana":
						echo '<td class="kana"><span>'.$terminoLeft->kana.'</span></td>';
						break;
					case "kanji":
						echo '<td class="kana"><span>'.$terminoLeft->kanji.'</span></td>';
						break;
					case "romaji":
						echo '<td class="kana romaji"><span class="romaji_word" id="'.$i.'">'.$terminoLeft->kana.'</span></td>';
						break;
					case "sign":
						echo '<td><span>'.$terminoLeft->significado.'</span></td>';
						break;
				}
				endforeach;
			?>
			<td class="col_spacer"></td>
			
			<?php foreach($this->ordenedArray as $field):
				switch($field) {
					case "img":
						echo $this->displayImage($terminoCenter->img, true);
						break;
					case "kana":
						echo '<td class="kana"><span>'.$terminoCenter->kana.'</span></td>';
						break;
					case "kanji":
						echo '<td class="kana"><span>'.$terminoCenter->kanji.'</span></td>';
						break;
					case "romaji":
						echo '<td class="kana romaji"><span class="romaji_word" id="'.$i.'">'.$terminoCenter->kana.'</span></td>';
						break;
					case "sign":
						echo '<td><span>'.$terminoCenter->significado.'</span></td>';
						break;
				}
				endforeach;
			?>
			<td class="col_spacer"></td>
			
			<?php foreach($this->ordenedArray as $field):
				switch($field) {
					case "img":
						echo $this->displayImage($terminoRight->img, true);
						break;
					case "kana":
						echo '<td class="kana"><span>'.$terminoRight->kana.'</span></td>';
						break;
					case "kanji":
						echo '<td class="kana"><span>'.$terminoRight->kanji.'</span></td>';
						break;
					case "romaji":
						echo '<td class="kana romaji"><span class="romaji_word" id="'.$i.'">'.$terminoRight->kana.'</span></td>';
						break;
					case "sign":
						echo '<td><span>'.$terminoRight->significado.'</span></td>';
						break;
				}
				endforeach;
			?>
	<?php endfor; ?>
<table>
