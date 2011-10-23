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
			<?php if($this->img): ?>
				<td class="image">
				<?php if(is_file("images/img_vocabulario/peques/".$terminoLeft->img)): ?>
					<span><img src="images/img_vocabulario/peques/<?php echo $terminoLeft->img ?>"/></span>
				<?php endif; ?>
				</td>
			<?php endif; ?>
			<?php if($this->kana): ?>
				<td class="kana"><span><?php echo $terminoLeft->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->kanji): ?>
				<td class="kana"><span><?php echo $terminoLeft->kanji ?></span></td>
			<?php endif; ?>
			<?php if($this->romaji): ?>
				<td class="kana romaji"><span class="romaji_word" id="<?php echo $i; ?>"><?php echo $terminoLeft->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->sign): ?>
				<td><span><?php echo $terminoLeft->significado ?></span></td>
			<?php endif; ?>
			<td class="col_spacer"></td>
			
			<?php if($this->img): ?>
				<td class="image">
				<?php if(is_file("images/img_vocabulario/peques/".$terminoCenter->img)): ?>
					<span><img src="images/img_vocabulario/peques/<?php echo $terminoCenter->img ?>"/></span>
				<?php endif; ?>
				</td>
			<?php endif; ?>
			<?php if($this->kana): ?>
				<td class="kana"><span><?php echo $terminoCenter->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->kanji): ?>
				<td class="kana"><span><?php echo $terminoCenter->kanji ?></span></td>
			<?php endif; ?>
			<?php if($this->romaji): ?>
				<td class="kana romaji"><span class="romaji_word" id="<?php echo $i+$termsCol; ?>"><?php echo $terminoCenter->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->sign): ?>
				<td><span><?php echo $terminoCenter->significado ?></span></td>
			<?php endif; ?>
			<td class="col_spacer"></td>
			
			<?php if($this->img): ?>
				<?php if(is_file("images/img_vocabulario/peques/".$terminoRight->img)): ?>
					<td><span><img src="images/img_vocabulario/peques/<?php echo $terminoRight->img ?>"/></span></td>
				<?php else: ?>
					<td></td>
				<?php endif; ?>
			<?php endif; ?>
			<?php if($this->kana): ?>
				<td class="kana"><span><?php echo $terminoRight->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->kanji): ?>
				<td class="kana"><span><?php echo $terminoRight->kanji ?></span></td>
			<?php endif; ?>
			<?php if($this->romaji): ?>
				<td class="kana romaji"><span class="romaji_word" id="<?php echo $i+$termsCol*2; ?>"><?php echo $terminoRight->kana ?></span></td>
			<?php endif; ?>
			<?php if($this->sign): ?>
				<td><span><?php echo $terminoRight->significado ?></span></td>
			<?php endif; ?>
	<?php endfor; ?>
<table>
