<?
if(is_numeric($_GET['cuantas'])){
	if($_GET['cuantas'] > 100 || $_GET['cuantas'] < 0) $_GET['cuantas'] = 20;
	include ('getGoogleImages.php');
	
	$result = getGoogleImg($_GET['q'], $_GET['cuantas']);
	echo getImagesDiv($result);
}
?>