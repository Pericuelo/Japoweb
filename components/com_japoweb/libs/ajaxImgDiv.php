<?
include ('getGoogleImages.php');

$result = getGoogleImg($_GET['q'], 20);
echo getImagesDiv($result);
?>