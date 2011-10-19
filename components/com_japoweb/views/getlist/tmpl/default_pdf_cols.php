<?php 
// No direct access
defined('_JEXEC') or die('Restricted access'); ?>

<?php
	$totalTerms = count($this->terminos);
	$termsCol = ceil($totalTerms / 2);
	
	$img = false; $kana = false; $kanji = false; $sign = false; 
	if(in_array('img', $this->info))
		$img = true;
	if(in_array('kana', $this->info))
		$kana = true;
	if(in_array('kanji', $this->info))
		$kanji = true;
	if(in_array('sign', $this->info))
		$sign = true;
		
	$totalCols = (intval($img)+intval($kana)+intval($kanji)+intval($sign))*2;
	$perCent = floor(100/$totalCols);
	
	echo "<style>table td { width: $perCent%; }</style>";
?>

<table class="cols">
	<?php for($i = 0; $i < $termsCol; $i ++): ?>
		<?php $terminoLeft = $this->terminos[$i]; $terminoRight = $this->terminos[$i+$termsCol]; ?>
		<tr>
			<?php if($img): ?>
				<?php if(is_file("images/img_vocabulario/peques/".$terminoLeft->img)): ?>
					<td><span><img src="images/img_vocabulario/peques/<?php echo $terminoLeft->img ?>"/></span></td>
				<?php else: ?>
					<td></td>
				<?php endif; ?>
			<?php endif; ?>
			<?php if($kana): ?>
				<td><span><?php echo $terminoLeft->kana ?></span></td>
			<?php endif; ?>
			<?php if($kanji): ?>
				<td><span><?php echo $terminoLeft->kanji ?></span></td>
			<?php endif; ?>
			<?php if($sign): ?>
				<td class="col_spacer"><span><?php echo $terminoLeft->significado ?></span></td>
			<?php endif; ?>
			
			<?php if($img): ?>
				<?php if(is_file("images/img_vocabulario/peques/".$terminoRight->img)): ?>
					<td><span><img src="images/img_vocabulario/peques/<?php echo $terminoRight->img ?>"/></span></td>
				<?php else: ?>
					<td></td>
				<?php endif; ?>
			<?php endif; ?>
			<?php if($kana): ?>
				<td><span><?php echo $terminoRight->kana ?></span></td>
			<?php endif; ?>
			<?php if($kanji): ?>
				<td><span><?php echo $terminoRight->kanji ?></span></td>
			<?php endif; ?>
			<?php if($sign): ?>
				<td><span><?php echo $terminoRight->significado ?></span></td>
			<?php endif; ?>
	<?php endfor; ?>
<table>
