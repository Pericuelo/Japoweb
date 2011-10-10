<?php
 
// No direct access
 
defined('_JEXEC') or die('Restricted access'); 

$capitulo_actual = 0;

?>
<style type="text/css">
body{
	font-family:Geneva, Verdana, sans-serif;
}
.link_capitulo a{
	text-decoration:none;
	color: blue;
	background-color: white;
}
.cabecera_capitulo{
	color: white;
	background-color: red;
	text-align:center;
	padding:3px;
}
.leyenda tr{
	background-color:#06F;
}
.leyenda td{
	color:#000;
	padding-left:4px;
}
.kanji_indice{
	padding-left:10px;
}
.kanji_indice a{
	color:#000;
	text-decoration:none;
	font-size:large;
}
.kanji_row{
	background-color:#9FF;
}
.kanji_cell{
	font-size:xx-large;
	padding:8px;
}
.kunyomi_cell{
	font-size:medium;
	padding:4px;
	padding-left:10px;
}
.onyomi_cell{
	font-size:medium;
	padding:4px;
}
.significado_cell{
	font-size:medium;
	padding:4px;
}
.kanji_links_cell{
	padding:4px;
}
.kanji_links_cell a{
	text-decoration:none;
}
.vocabulario_par{
	background-color:#CCC;
}
.vocabulario_par td{
	padding:2px;
}
.vocabulario_impar{
	background-color:#FFF;
}
.vocabulario_impar td{
	padding:2px;
}
.vocabulario_kanji{
	float:left;
}
.vocabulario_hiragana{
	float:left;
	padding-left:15px;
}
.vocabulario_significado{
	float:left;
	font-weight:bold;
	padding-left:15px;
}
</style>


<h1>Title</h1>
<table cellpadding="0" cellspacing="0">
<?php foreach ($this->chapters as $n_cap => $chapter): ?>
	<tr class="link_capitulo">
    	<td>
        	<a href="#capitulo<?=$n_cap?>">Capitulo <?=$n_cap?></a>
        </td>
        <td class="kanji_indice">
        <?php foreach($chapter as $kanji): ?>
			<a href="#kanji<?php echo $kanji['id']?>"><?php echo $kanji['kanji']?></a>
		<?php endforeach; ?>
        </td>
	</tr>
<?php endforeach; ?>
</table>
<br/>
<table cellpadding="0" cellspacing="0">
<? foreach($this->kanjis as $kanji) {
	//Cabecera Capitulo
	if($capitulo_actual < $kanji['capitulo']){
		$capitulo_actual++;
		?>
	    <tr>
        	<td class="cabecera_capitulo" colspan="5">
            	<a name="capitulo<?=$capitulo_actual?>">Capitulo <?=$capitulo_actual?></a>&nbsp;&nbsp;&nbsp;<a href="#top">/\</a>
            </td>
        </tr>
        <tr class="leyenda" bgcolor="#00CCFF">
            <td>&nbsp;</td>
            <td>Kun</td>
            <td>On</td>
            <td>SIGN.</td>
            <td>LINKS</td>
        </tr>
        <?
	}
	?>
    <tr class="kanji_row">
        <td class="kanji_cell">
            <a name="kanji<?=$kanji['id']?>"/>
            <?=$kanji['kanji'] ?>
        </td>
        <td class="kunyomi_cell"><?=str_replace("、", "<br>", $kanji['kunyomi'] ) ?></td>
        <td class="onyomi_cell"><?=str_replace("、", "<br>", $kanji['onyomi'] ) ?></td>
        <td class="significado_cell"><?=str_replace(",", "<br>", $kanji['significado']) ?></td>
        <td class="kanji_links_cell">
            <a href="http://en.wiktionary.org/wiki/<?=$kanji['kanji'] ?>">[DICCIO]</a>&nbsp;
            <a href="http://kanji.sljfaq.org/kanjivg/makepng-noscript.cgi?kanji=<?=$kanji['kanji'] ?>&s=3&l=3">[TRAZOS]</a>
        </td>
    </tr>
    <?
    //Vocabulario
	/*$sql = "SELECT kanji, kana, significado FROM termino WHERE kana <> '' AND kanji LIKE '%".$kanji['kanji']."%' AND capitulo <= ".$kanji['capitulo']." ORDER BY id";
	$result_voc = mysql_query($sql);
	$i = 0;
	while($row_voc = mysql_fetch_array($result_voc)){ ?>
	    <tr class="<?=($i++%2)?'vocabulario_par':'vocabulario_impar'; ?>">
        	<td colspan="5">
                <div class="vocabulario_kanji"><?=$row_voc['kanji']?></div>
                <div class="vocabulario_hiragana">[ <?=$row_voc['kana']?> ]</div>
                <div class="vocabulario_significado"><?=$row_voc['significado']?></div>
            </td>
        </tr>
    <? }*/
} ?>
</table>