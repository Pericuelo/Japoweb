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
 
class JapowebViewOld extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$lastChapt = $model->getLastChapter();
		//$this->assign('lastChapter', $lastChapt);
		
		$chapters = array();
		
		for ($n_cap=1; $n_cap<=$lastChapt; $n_cap++) {
			$chapters[$n_cap] = $model->getKanjisFromChapter($n_cap);
		}
		
		$this->assignRef('chapters',$chapters);
		
		$kanjis = $model->getKanjis();
		$this->assignRef('kanjis', $kanjis);
		
		/*foreach($kanjis as $kanji) {
			$vocabulary[$kanji['id']] = $model->getVocabulary($kanji['id']);
		}*/
 
        parent::display($tpl);
    }
}

