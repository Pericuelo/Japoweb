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
			<?php if($img): ?>
				<img src="<?php echo $termino->img ?>"/><br/>
			<?php endif; ?>
			<?php if($kana): ?>
				<?php echo $termino->kana ?><br/>
			<?php endif; ?>
			<?php if($kanji): ?>
				<?php echo $termino->kanji ?><br/>
			<?php endif; ?>
			<?php if($sign): ?>
				<?php echo $termino->significado ?><br/>
			<?php endif; ?>
		</span></td>
		<?php if($count % 5 == 0): ?>
			</tr>
		<?php endif; ?>
		<?php $count++; ?> 
	<?php endforeach; ?>
	<?php if($count%5 != 1) echo "</tr>" ?>
<table>
