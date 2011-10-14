/**
 *  $Id: vk_loader.js 753 2011-05-05 20:35:49Z wingedfox $
 *
 *  Keyboard loader
 *
 *  This software is protected by patent No.2009611147 issued on 20.02.2009 by Russian Federal Service for Intellectual Property Patents and Trademarks.
 *
 *  @author Ilya Lebedev
 *  @copyright 2006-2011 Ilya Lebedev <ilya@lebedev.net>
 *  @version $Rev: 753 $
 *  @lastchange $Author: wingedfox $ $Date: 2011-05-06 00:35:49 +0400 (Птн, 06 Май 2011) $
 */
VirtualKeyboard=new function(){var i=this,I=null;i.show=i.hide=i.toggle=i.attachInput=function(){window.status='VirtualKeyboard is not loaded yet.';if(!I)setTimeout(function(){window.status=''},1000);};i.isOpen=function(){return false}};(function(){var i=(function(Q){var _=document.getElementsByTagName('script'),c=new RegExp('^(.*/|)('+Q+')([#?]|$)');for(var l=0,C=_.length;l<C;l++){var e=String(_[l].src).match(c);if(e){if(!e[1])e[1]="";if(e[1].match(/^((https?|file)\:\/{2,}|\w:[\\])/))return e[1];if(e[1].indexOf("/")==0)return e[1];b=document.getElementsByTagName('base');if(b[0]&&b[0].href)return b[0].href+e[1];return(document.location.href.match(/(.*[\/\\])/)[0]+e[1]).replace(/^\/+/,"");}}return null})('vk_loader.js');var I=["extensions/e.js"];for(var l=0,o=I.length;l<o;l++)I[l]=i+I[l];I[l++]=i+'virtualkeyboard.js';I[l]=i+'layouts/layouts.js';if(window.ScriptQueue){ScriptQueue.queue(I);}else{if(!(window.ScriptQueueIncludes instanceof Array))window.ScriptQueueIncludes=[];window.ScriptQueueIncludes=window.ScriptQueueIncludes.concat(I);if(document.body){s=document.createElement('script');s.type="text/javascript";s.src=i+'extensions/scriptqueue.js';var O=document.getElementsByTagName("head")[0];O.appendChild(s);}else{document.write("<scr"+"ipt type=\"text/javascript\" src=\""+i+'extensions/scriptqueue.js'+"\"></scr"+"ipt>");}}})();
