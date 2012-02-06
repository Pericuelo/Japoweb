<?php
defined('_JEXEC') or die('Direct Access to this location is not allowed.');
 
class ModRankingcolaboracionesHelper
{
    /**
     * Como se cuentan las colaboraciones:
	 * Introducir termino +3 puntos.
	 * Modificar termino +1 punto.
    */
    public function getColaboraciones()
    {
        // get a reference to the database
        $db = &JFactory::getDBO();
		
		$query = "SELECT id, name FROM #__users";
		$db->setQuery($query);
		$users = $db->loadObjectList();
		
		foreach($users as &$user) {
			$query = 'SELECT COUNT(*) FROM `#__jw_termino` WHERE id_user = '.$user->id;
			$db->setQuery($query);
			$new = $db->loadResult();
			$user->points = $new*3;
			// echo "User: {$user->name}, id: {$user->id}, points: {$user->points}<br/>";
			
			$query = 'SELECT COUNT(*) FROM `#__jw_modificacion` WHERE user_id = '.$user->id;
			$db->setQuery($query);
			$mod = $db->loadResult();
			$user->points += $mod;
			// echo "User: {$user->name}, id: {$user->id}, points: {$user->points}<br/>";
		}
		
		foreach ($users as $key => $user) {
		    $dates[$key]  = $user->points; 
		    // of course, replace 0 with whatever is the date field's index
		}
		
		array_multisort($dates, SORT_DESC, $users);
		
		return $users;
    } //end getItems
 
}
?>


