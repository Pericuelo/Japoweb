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
 
class JapowebViewTest extends JView {
    	
    function display($tpl = null)
    {
        $model =& $this->getModel();
		
		if(JRequest::getVar('layout') == 'test') { // Layout para responder las preguntas
			// Recoger datos del formulario
			$categoria = JRequest::getVar('categoria','','post'); // String
			$numPreg = JRequest::getVar('num_preg','','post'); // String
			$info = JRequest::getVar('info','','post'); // Array
			$resp = JRequest::getVar('resp','','post'); // String
			
			$user =& JFactory::getUser();
			$userId = $user->id;
			
			$preguntas = $model->getPreguntas($userId, $categoria, $numPreg);
			
			// Hay que avisar al usuario si no hay suficientes preguntas en la categoria seleccionada
			if(count($preguntas) < $numPreg) {
				$this->assign('maxPreg', count($preguntas));
			} else {
				$this->assign('maxPreg', $numPreg);
			}
			
			$this->assignRef('preguntas', $preguntas);
			$this->assign('info', $info);
			$this->assign('resp', $resp);
			$this->assign('numPreg', $numPreg);
			
		} elseif(JRequest::getVar('layout') == 'results') { // Layout para mostrar los resultados
			$preguntas = JRequest::getVar('pregunta');
			$respuestas = JRequest::getVar('respuesta');
			$resp = JRequest::getVar('resp');
			
			$user =& JFactory::getUser();
			
			$resultadosKo = $model->procesarRespuestas($user->id, $preguntas, $respuestas, $resp);
			
			$this->assign('total',count($preguntas));
			$this->assign('total_ko',count($resultadosKo));
			$this->assignRef('resultadosKo',$resultadosKo);
			
		} else { // Layout por defecto. Simplemente muestra el formulario de entrada a los tests.
			$categorias = $model->getCategorias();
			$this->assignRef('categorias', $categorias);
		}
		
        parent::display($tpl);
    }
}

