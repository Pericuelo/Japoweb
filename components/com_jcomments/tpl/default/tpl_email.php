<?php
// no direct access
(defined('_VALID_MOS') OR defined('_JEXEC')) or die('Restricted access');
/*
 *
 * E-mail notification for users 
 *
 */
class jtt_tpl_email extends JoomlaTuneTemplate
{
	function render() 
	{
		$comment = $this->getVar('comment');
		
		$object_title = $this->getVar('comment-object_title');
		$object_link =  $this->getVar('comment-object_link');
		$hash =  $this->getVar('hash');

		$link = '<a href="' . $object_link . '" target="_blank">' . $object_title . '</a>';
		$unsubscribeMessage = JText::sprintf('NOTIFICATION_COMMENT_UNSUBSCRIBE', $link);
		$unsubscribeLink = JCommentsFactory::getUnsubscribeLink($hash);

		// add inline styles for quotes to default comment html layout
		$comment->comment = str_replace('<blockquote>', '<blockquote style="border-left: 2px solid #ccc; padding-left: 5px; margin-left: 10px;">', $comment->comment);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta content="text/html; charset=<?php echo $this->getVar('charset'); ?>" http-equiv="content-type" />
  <meta name="Generator" content="JComments" />
</head>
<body>
<a style="color: #777;" href="<?php echo $object_link ?>#comment-<?php echo $comment->id; ?>" target="_blank">#</a>&nbsp;
<?php
		if ($comment->title != '') {
?>
<span style="color: #b01625;font: bold 1em Verdana, Arial, Sans-Serif;"><?php echo $comment->title; ?></span> &mdash; 
<?php
		}
		if ($comment->homepage != '') {
?>
<a style="color: #3c452d;font: bold 1em Verdana, Arial, Sans-Serif;" href="<?php echo $comment->homepage; ?>" target="_blank"><?php echo $comment->name; ?></a>
<?php
		} else {
?>
<span style="color: #3c452d;font: bold 1em Verdana, Arial, Sans-Serif;"><?php echo $comment->name; ?></span>
<?php
		}
?> &mdash; <span style="font-size: 11px; color: #999;"><?php echo JCommentsText::formatDate($comment->datetime, JText::_('DATETIME_FORMAT')); ?></span>
<div style="border: 1px solid #ccc; padding: 10px 5px; margin: 5px 0; font: normal 1em Verdana, Arial, Sans-Serif;"><?php echo $comment->comment; ?></div>

<p style="border-top: 1px solid #ccc; margin: 10px 0 0 0; color: #555;"><?php echo $unsubscribeMessage; ?>:<br /><a href="<?php echo $unsubscribeLink; ?>" target="_blank"><?php echo JText::_('Unsubscribe');?></a></p>
</body>
</html>
<?php
	}
}
?>