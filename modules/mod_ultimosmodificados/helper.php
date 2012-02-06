<?php
defined('_JEXEC') or die('Direct Access to this location is not allowed.');
 
class ModUltimosmodificadosHelper
{
    /**
     * Returns a list of post items
    */
    public function getTerminos($termCount)
    {
        // get a reference to the database
        $db = &JFactory::getDBO();
 
        // get a list of $userCount randomly ordered users 
        $query = 'SELECT DISTINCT m.termino_id, t.kanji, t.kana, t.significado, u.name, m.fecha FROM `#__jw_termino` AS t 
        				LEFT JOIN #__jw_modificacion AS m ON t.id = m.termino_id
        				LEFT JOIN #__users AS u ON u.id = m.user_id
        				ORDER BY m.fecha DESC LIMIT ' . $termCount  . '';
 
        $db->setQuery($query);
        $items = ($items = $db->loadObjectList())?$items:array();
 
        return $items;
    } //end getItems
 
}
?>


