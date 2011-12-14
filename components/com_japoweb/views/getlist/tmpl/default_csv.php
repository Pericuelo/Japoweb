<?php $separator = ";"; $newField = "<br/>" ?>
"column: card level";"column: due date";"column: state";"column: side type front side";"column: text front side";"column: side type back side";"column: text back side";
<?php

for($i=0;$i<count($this->terminos); $i++) {
	echo $newField;
	echo ($i+1).$separator;
	echo date(Ymd).$separator;
	echo "0".$separator;
	echo "0".$separator;
	echo '"'.$this->terminos[$i]->significado.'"'.$separator;
	echo "0".$separator;
	echo '"'.$this->terminos[$i]->kana.'"'.$separator;
}

?>
	