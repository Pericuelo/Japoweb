<?php
/**
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_1
 * @license    GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewAddtermino extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$categorias = $model->getCategorias();
		
		foreach($categorias as $categoria) {
			$return[] = array($categoria->id, $categoria->nombre, null, null,$categoria->nombre);
		}
		
		echo json_encode($return);
		
        //parent::display($tpl);
    }
}

