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
 
class JapowebViewJisho extends JView {
    	
    function display() {
        	
        $model =& $this->getModel();
		
		$results = $model->search();
		$this->assignRef('results', $results);
		
		$this->assign('searched',JRequest::getVar('keyword'));
 
        parent::display($tpl);
    }
}

