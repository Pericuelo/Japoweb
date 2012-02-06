<?php
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$filenameJs = 'jisho.js';
$filenameCss = 'japoweb.css';
// Add the path parameter if the path is different than 'media/system/js/'
$path = 'components/com_japoweb/assets/';
$pathKB = $path.'virtualkeyboard/';

JHTML::script($filenameJs, $path,  true);
JHTML::script('vk_loader.js', $pathKB, true);
JHTML::stylesheet($filenameCss, $path);
?>
<div id="keyboard"></div>
<div class="componentbody">
	<div>
		<form method="post" action="index.php">
			<input type="text" id="keyword" name="keyword" autocomplete="off" value="検索　（けんさく）。。。" class="keyboardInput" onfocus="VirtualKeyboard.attachInput(this)"/>
			<input type="submit" name="submit" value="Buscar" />
			<span class="nota"><input type="checkbox" name="use_keyboard" id="use_keyboard" />Usar teclado japonés</span>
			<input type="hidden" name="option" value="com_japoweb" />
			<input type="hidden" name="view" value="jisho" />
			<input type="hidden" name="Itemid" value="<?php echo JRequest::getVar('Itemid'); ?>" />
			<input type="hidden" name="option" value="com_japoweb" />
		</form>
	</div>
	
	<div class="results">
		<p>Resultados para <strong><?php echo $this->searched; ?></strong></p>
		<?php foreach($this->results as $result): ?>
			<div class="result">
				<div class="kanji">
					<?php echo $result->kanji; ?>
				</div>
				<div class="kana">
					<?php echo $result->kana; ?>
				</div>
				<div class="sign">
					<?php echo $result->significado; ?>
				</div>
				<div class="clr"></div>
			</div>
		<?php endforeach; ?>
	</div>
</div>
