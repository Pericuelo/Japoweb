<?php
/**
 * @package    	Joomla Japoweb
 * @subpackage 	Component
 * @autor		Jose L. Rodríguez
 * @license    	GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewAddtermino extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$terminos = $model->getTablaTerminos(JRequest::getVar('kana'));
		
		if(sizeof($terminos['terminos']) > 0){
			echo '<table class="terminos_parecidos_popup">';		
			echo '<tr><td>Hemos encontrado palábras con el mismo kana.<br>
				¿Quieres modificar alguna de las siguientes palabras?</tr></td>';
			foreach($terminos['terminos'] as $termino) {
				echo '<tr class="clicable"><td onclick="obtenerTermino('.$termino->id.')">';
				$imagen = ($terminos['imagenes'][$termino->id])?$terminos['imagenes'][$termino->id]:'NoPhoto.jpg';
				echo '<img src="images/img_vocabulario/peques/'.$imagen.'"> ';
				echo '<span> ';
				echo $termino->kana;
				if($termino->kanji) echo '(<strong>'.$termino->kanji.'</strong>)';
				echo ' -> '.$termino->significado;
				echo '</span>';
				echo '</td></tr>';
			}
			echo '<tr class="clicable"><td onclick="SqueezeBox.close();">No quiero modificar ninguna de estas palábras, quiero seguir introduciendo una palábra nueva.</td></tr>';
			echo '</table>';
		}
    }
}