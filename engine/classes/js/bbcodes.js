var uagent=navigator.userAgent.toLowerCase(),is_ie=0<=uagent.indexOf("msie")?!0:!1,is_ie9=0<=uagent.indexOf("msie 9.0")?!0:!1,ie_range_cache="",list_open_tag="",list_close_tag="",listitems="",bbtags=[],rus_lr2="\u0415\u0435\u041e\u043e\u0401\u0401\u0401\u0401\u0416\u0416\u0427\u0427\u0428\u0428\u0429\u0429\u042a\u042c\u042d\u042d\u042e\u042e\u042f\u042f\u042f\u042f\u0451\u0451\u0436\u0447\u0448\u0449\u044d\u044e\u044f\u044f".split(""),lat_lr2=("/E-/e-/O-/o-\u042bO-\u042bo-\u0419O-\u0419o-\u0417H-\u0417h-\u0426H-\u0426h-\u0421H-\u0421h-\u0428H-\u0428h-\u044a"+
String.fromCharCode(35)+"-\u044c"+String.fromCharCode(39)+"-\u0419E-\u0419e-\u0419U-\u0419u-\u0419A-\u0419a-\u042bA-\u042ba-\u044bo-\u0439o-\u0437h-\u0446h-\u0441h-\u0448h-\u0439e-\u0439u-\u0439a-\u044ba").split("-"),rus_lr1="\u0410\u0411\u0412\u0413\u0414\u0415\u0417\u0418\u0419\u041a\u041b\u041c\u041d\u041e\u041f\u0420\u0421\u0422\u0423\u0424\u0425\u0425\u0426\u0429\u042b\u042f\u0430\u0431\u0432\u0433\u0434\u0435\u0437\u0438\u0439\u043a\u043b\u043c\u043d\u043e\u043f\u0440\u0441\u0442\u0443\u0444\u0445\u0445\u0446\u0449\u044a\u044b\u044c\u044c\u044f".split(""),
lat_lr1=("A-B-V-G-D-E-Z-I-J-K-L-M-N-O-P-R-S-T-U-F-H-X-C-W-Y-Q-a-b-v-g-d-e-z-i-j-k-l-m-n-o-p-r-s-t-u-f-h-x-c-w-"+String.fromCharCode(35)+"-y-"+String.fromCharCode(39)+"-"+String.fromCharCode(96)+"-q").split("-");function setFieldName(a){a!=selField&&(selField=a)}function emoticon(a){doInsert(" "+a+" ","",!1)}function pagebreak(){doInsert("{PAGEBREAK}","",!1)}function simpletag(a){doInsert("["+a+"]","[/"+a+"]",!0)}
function DLEimagePrompt(a,c){var d={},b="",e="";-1!=a.indexOf("http://")||-1!=a.indexOf("https://")?(b=a,e=""):(b="http://",e=a);d[dle_act_lang[3]]=function(){$(this).dialog("close")};d[dle_act_lang[2]]=function(){if(1>$("#dle-promt-text").val().length)$("#dle-promt-text").addClass("ui-state-error");else{var a=$("#dle-promt-text").val(),b=$("#dle-image-alt").val(),d=$("#dleimagealign").val();$(this).dialog("close");$("#dlepopup").remove();c&&c(a,b,d)}};$("#dlepopup").remove();$("body").append("<div id='dlepopup' title='"+
dle_prompt+"' style='display:none'>"+text_enter_image+"<br /><input type='text' name='dle-promt-text' id='dle-promt-text' class='ui-widget-content ui-corner-all' style='width:97%; padding: .4em;' value='"+b+"'/><br /><br />"+text_alt_image+"<br /><input type='text' name='dle-image-alt' id='dle-image-alt' class='ui-widget-content ui-corner-all' style='width:97%; padding: .4em;' value='"+e+"'/><br /><br />"+img_align+"&nbsp;"+img_align_sel+"</div>");$("#dlepopup").dialog({autoOpen:!0,width:500,resizable:!1,
buttons:d})}
function DLEurlPrompt(a,c){var d={},b="",e="",b=-1!=a.indexOf("http://")||-1!=a.indexOf("https://")||-1!=a.indexOf("ftp://")?a:"http://",e=a;d[dle_act_lang[3]]=function(){$(this).dialog("close")};d[dle_act_lang[2]]=function(){if(1>$("#dle-promt-url").val().length)$("#dle-promt-url").addClass("ui-state-error");else if(1>$("#dle-promt-title").val().length)$("#dle-promt-title").addClass("ui-state-error");else{var a=$("#dle-promt-url").val(),b=$("#dle-promt-title").val();$(this).dialog("close");$("#dlepopup").remove();
c&&c(a,b)}};$("#dlepopup").remove();$("body").append("<div id='dlepopup' title='"+dle_prompt+"' style='display:none'>"+text_enter_url+"<br /><input type='text' name='dle-promt-url' id='dle-promt-url' class='ui-widget-content ui-corner-all' style='width:97%; padding: .4em;' value='"+b+"'/><br /><br />"+text_enter_url_name+"<br /><input type='text' name='dle-promt-title' id='dle-promt-title' class='ui-widget-content ui-corner-all' style='width:97%; padding: .4em;' value='"+e+"'/></div>");$("#dlepopup").dialog({autoOpen:!0,
width:500,resizable:!1,buttons:d})}function tag_url(){var a=get_sel(eval("fombj."+selField));a||(a="My Webpage");DLEurlPrompt(a,function(a,d){doInsert("[url="+a+"]"+d+"[/url]","",!1);ie_range_cache=null})}function tag_leech(){var a=get_sel(eval("fombj."+selField));a||(a="My Webpage");DLEurlPrompt(a,function(a,d){doInsert("[leech="+a+"]"+d+"[/leech]","",!1);ie_range_cache=null})}
function tag_youtube(){var a=get_sel(eval("fombj."+selField));a||(a="http://");DLEprompt(text_enter_url,a,dle_prompt,function(a){doInsert("[media="+a+"]","",!1);ie_range_cache=null})}function tag_flash(){var a=get_sel(eval("fombj."+selField));a||(a="http://");DLEprompt(text_enter_flash,a,dle_prompt,function(a){DLEprompt(text_enter_size,"425,264",dle_prompt,function(d){doInsert("[flash="+d+"]"+a+"[/flash]","",!1);ie_range_cache=null})})}
function tag_list(a){list_open_tag="ol"==a?"[ol=1]\n":"[list]\n";list_close_tag="ol"==a?"[/ol]":"[/list]";listitems="";(a=get_sel(eval("fombj."+selField)))||(a="");insert_list(a)}function insert_list(a){DLEprompt(text_enter_list,a,dle_prompt,function(a){""!=a?(listitems+="[*]"+a+"\n",insert_list("")):listitems&&(doInsert(list_open_tag+listitems+list_close_tag,"",!1),ie_range_cache=null)},!0)}
function tag_image(){var a=get_sel(eval("fombj."+selField));a||(a="http://");DLEimagePrompt(a,function(a,d,b){var e="";""!=d&&(e="|"+d);""!=b&&"center"!=b&&(e=b+e);""!=e&&(e="="+e);"center"==b?doInsert("[center][img"+e+"]"+a+"[/img][/center]","",!1):doInsert("[img"+e+"]"+a+"[/img]","",!1);ie_range_cache=null})}function tag_video(){var a=get_sel(eval("fombj."+selField));a||(a="http://");DLEprompt(text_enter_url,a,dle_prompt,function(a){doInsert("[video="+a+"]","",!1);ie_range_cache=null})}
function tag_audio(){var a=get_sel(eval("fombj."+selField));a||(a="http://");DLEprompt(text_enter_url,a,dle_prompt,function(a){doInsert("[audio="+a+"]","",!1);ie_range_cache=null})}function tag_email(){var a=get_sel(eval("fombj."+selField));a||(a="");DLEprompt(email_title,a,dle_prompt,function(a){doInsert("[email="+a+"]"+a+"[/email]","",!1);ie_range_cache=null})}
function doInsert(a,c,d){var b=eval("fombj."+selField);b.focus();if(is_ie){if(b.isTextEdit){var b=document.selection,e=ie_range_cache?ie_range_cache:b.createRange();e.colapse;"Text"!=b.type&&"None"!=b.type||null==e||(""!=c&&0<e.text.length?a+=e.text+c:d&&(a+=e.text+c),e.text=a)}else b.value+=a+c;e.select();ie_range_cache=null}else if(null!=b.selectionEnd){var h=b.selectionStart,e=b.scrollTop,g=b.selectionEnd,k=b.value.substring(0,h),f=b.value.substring(h,g),g=b.value.substring(g,b.textLength);d||
(f="");f=a+f+c;b.value=k+f+g;a=h+f.length;b.selectionStart=a;b.selectionEnd=a;b.scrollTop=e}else b.value+=a+c;return!1}
function ins_color(a){document.getElementById(selField).focus();is_ie&&(document.getElementById(selField).focus(),ie_range_cache=document.selection.createRange());$("#cp").remove();$("body").append("<div id='cp' title='"+bb_t_col+'\' style=\'display:none\'><iframe width="100%" height="104" src="'+dle_root+"templates/"+dle_skin+'/bbcodes/color.html" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>');$("#cp").dialog({autoOpen:!0,dialogClass:"modalfixed",resizable:!1,width:200});
$(".modalfixed.ui-dialog").css({position:"fixed"});$("#cp").dialog("option","position",["0","0"])}function setColor(a){doInsert("[color="+a+"]","[/color]",!0);$("#cp").dialog("close")}
function ins_emo(a){document.getElementById(selField).focus();is_ie&&(ie_range_cache=document.selection.createRange());$("#dle_emo").remove();$("body").append("<div id='dle_emo' title='"+bb_t_emo+"' style='display:none'>"+document.getElementById("dle_emos").innerHTML+"</div>");a="300";var c="auto";450<=$("#dle_emos").width()&&($("#dle_emos").width(450),a="505");300<=$("#dle_emos").height()&&($("#dle_emos").height(300),c="340");$("#dle_emo").dialog({autoOpen:!0,dialogClass:"modalfixed",width:a,resizable:!1,
height:c});$(".modalfixed.ui-dialog").css({position:"fixed"});$("#dle_emo").dialog("option","position",["0","0"])}function dle_smiley(a){doInsert(" "+a+" ","",!1);$("#dle_emo").dialog("close");ie_range_cache=null}function pagelink(){var a=get_sel(eval("fombj."+selField));a||(a=text_pages);DLEprompt(text_enter_page,"1",dle_prompt,function(c){DLEprompt(text_enter_page_name,a,dle_prompt,function(a){doInsert("[page="+c+"]"+a+"[/page]","",!1);ie_range_cache=null})})}
function translit(){var a=eval("fombj."+selField);if(is_ie)if(a.isTextEdit){a.focus();var c=document.selection,d=c.createRange();d.colapse;"Text"!=c.type&&"None"!=c.type||null==d||(d.text=dotranslate(d.text))}else a.value=dotranslate(a.value);else a.value=dotranslate(a.value);a.focus()}
function dotranslate(a){var c="",d=0,d="",b=1;for(kk=0;kk<a.length;kk++){d=a.substr(kk,1);if("["==d||"<"==d)b=0;if("]"==d||">"==d)b=1;d=b?transsymbtocyr(c.substr(c.length-1,1),d):c.substr(c.length-1,1)+d;c=c.substr(0,c.length-1)+d}return c}function transsymbtocyr(a,c){var d=a+c,b=c.charCodeAt(0);if(!(65<=b&&123>=b||35==b||39==b))return d;for(b=0;b<lat_lr2.length;b++)if(lat_lr2[b]==d)return rus_lr2[b];for(b=0;b<lat_lr1.length;b++)if(lat_lr1[b]==c)return a+rus_lr1[b];return d}
function insert_font(a,c){0!=a&&(doInsert("["+c+"="+a+"]","[/"+c+"]",!0),fombj.bbfont.selectedIndex=0,fombj.bbsize.selectedIndex=0)}function get_sel(a){if(document.selection){if(is_ie&&(document.getElementById(selField).focus(),ie_range_cache=document.selection.createRange()),a=document.selection.createRange(),a.text)return a.text}else if("number"==typeof a.selectionStart&&a.selectionStart!=a.selectionEnd){var c=a.selectionStart;return a.value.substr(c,a.selectionEnd-c)}return!1}
function dle_image_upload(a,c){document.getElementById(selField).focus();is_ie&&(ie_range_cache=document.selection.createRange());$("#dle_emo").remove();$("#cp").remove();$("#dlepopup").remove();media_upload(selField,a,c,"no")}function tag_typograf(){ShowLoading("");$.post(dle_root+"engine/ajax/typograf.php",{txt:document.getElementById(selField).value},function(a){HideLoading("");$("#"+selField).val(a)})};