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
 
class JapowebViewOrdencategorias extends JView {
    	
    function display()
    {

        $model =& $this->getModel();
		
		$result = $model->ordenarCategoria(JRequest::getVar('cat_id'), JRequest::getVar('sort_order'));


    }
}