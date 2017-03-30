<div class="search-page">
	<header class="sub-title"><h1>Поиск по сайту</h1></header>
	<div class="searchtable" id="searchtable" name="searchtable">{searchtable}</div>
</br>
	[searchmsg]<div class="berrors"><b>Информация</b><br />{searchmsg}</div>[/searchmsg]
</div>
<!-- Оформление поиска нагло скоммуниздено у yoobe.ru. Всего ему доброго, хорошего настроения и здоровья. -->
<style>
#searchinput {margin-bottom:20px !important;}
#fullsearch:after {content: '';display: table;clear: both;}
#fullsearch .options {position: relative;border: solid 1px #eee;}
#fullsearch .options:last-of-type {margin: 0 0 10px 0;}
#fullsearch .options > div {position: relative;border-top: solid 1px #eee;background: #f9f9f9;max-height: 50px;overflow: hidden;
padding: 0 20px 20px 20px;transition: max-height 0.5s;}
#fullsearch .options > div:first-child {border: 0;}
#fullsearch .options > div.active {max-height: 1000px;}
#fullsearch .options > div.word-option b:before {
  content: 'Только точное совпадение всех слов запроса';
}
#fullsearch .options > div.where-option b:before {
  content: 'Выбрать область поиска';
}
#fullsearch .options > div.category-option b:before {
  content: 'Выбрать категорию публикаций';
}
#fullsearch .options > div.userfield-option b:before {
  content: 'Поиск по автору публикаций';
}
#fullsearch .options > div.period-option b:before {
  content: 'Указать период';
}
#fullsearch .options > div.sort-option b:before {
  content: 'Указать сортировку результатов';
}
#fullsearch .options > div.comments-option b:before {
  content: 'Поиск по количеству комментариев';
}
#fullsearch .options > div.short-option b:before {
  content: 'В результате поиска только заголовок публикации';
}
#fullsearch .options > div .title {
  position: relative;
  display: block;
  font-size: 16px;
  font-weight: 400;
  height: 50px;
  line-height: 50px;
  margin: 0 -20px 20px -20px;
  padding: 0 30px 20px 20px;
  background: #fff;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
#fullsearch .options > div select {margin: 0 7px 0 0;}
#fullsearch .options > div select:not(#replyless) {margin: 7px 0 0 0;width: 100%;}
#fullsearch .options > div select[multiple="multiple"] {height: 140px;padding:10px;}
#fullsearch .options > div #replylimit {width: 60px;text-align: center;display:inline-block;}
#fullsearch .options > div#userfield br,
#fullsearch .options > div#userfield label,
#fullsearch .options > div #rb_showposts_0,
#fullsearch .options > div select[multiple] {display: none;}
#fullsearch .options > div.switch .title {padding-right: 120px;}
#fullsearch .options > div.switch label {
  position: absolute;
  top: 50%;
  right: 20px;
  width: 50px;
  height: 26px;
  margin-top: -13px;
  font-size: 0;
  cursor: pointer;
}
#fullsearch .options > div.switch label input {display: none;}
#fullsearch .options > div.switch label span {
  position: relative;
  background: #ddd;
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 4px;
}
#fullsearch .options > div.switch label span:before {
  content: 'Нет';
  position: absolute;
  top: 0;
  right: 100%;
  height: 26px;
  line-height: 26px;
  margin: 0 7px 0 0;
  color: #999;
  text-transform: uppercase;
  font-size: 11px;
}
#fullsearch .options > div.switch label span:after {
  content: '';
  position: absolute;
  top: 2px;
  right: 2px;
  width: 22px;
  height: 22px;
  background: #fff;
  opacity: 0.8;
  border-radius: 3px;
  z-index: 7;
  transition: right 0.4s , opacity 0.4s;
}
#dofullsearch {display: none;}
#fullsearch .options > div.switch label span:hover:after {opacity: 0.95 !important;}
#fullsearch .options > div.switch label input:not(#rb_showposts_0):checked ~ span {background: #5eaf6c;}
#fullsearch .options > div.switch label input:not(#rb_showposts_0):checked ~ span:before {content: 'Да';}
#fullsearch .options > div.switch label input:not(#rb_showposts_0):checked ~ span:after {right: 26px;opacity: 0.6;}
#fullsearch .options > div:not(.switch):after {content: '';position: absolute;top: 22px;right: 10px;width: 0;height: 0;
border: solid 6px transparent;border-top-color: #ddd;transition: border 0.4s;}
#fullsearch .options > div:not(.switch).active:after {border-color: transparent;}
#fullsearch .options > div:not(.switch).active select[multiple] {margin: 0;width: 100%;display: block;}
#fullsearch .options > div:not(.switch) .title {cursor: pointer;}
#fullsearch .options > div:not(.switch) .title:hover {background: #f9f9f9;}
#fullsearch .options > div:not(.switch) .title:after {content: '';position: absolute;bottom: 0;right: 0;left: 0;height: 1px;background: #eee;}
#fullsearch .options #doclear {position: absolute;top: -30px;right: 17px;height: 20px;line-height: 20px;
font-size: 12px;color: #fff;text-transform: uppercase;cursor: pointer;}
#fullsearch:not(.fullsearch) #searchinput {width: 100%;display: block;max-width: 600px;margin: 0 0 7px 0;}
#fullsearch:not(.fullsearch) #dosearch {margin: 0 7px 0 0;}
#fullsearch.fullsearch #searchinput {width: 100%;display: block;margin: 0 0 7px 0;}
@media all and (min-width: 479px) {
  #fullsearch.fullsearch #searchinput {width: 68% !important;float: left;margin: 0 2% 0 0;}
  #fullsearch.fullsearch #dosearch {width: 30%;float: left;font-size: 16px !important;height:40px !important;line-height:40px !important;}
  #fullsearch .options > div .title {padding: 0 60px 20px 20px;}
  #fullsearch .options > div:not(.switch):after {right: 40px;}
}
@media all and (min-width: 579px) {
  #fullsearch .options > div select {margin: 0 7px 0 0;}
  #fullsearch .options > div select:not(#replyless):not([multiple="multiple"]) {margin: 0 7px 0 0;width: auto;}
}
</style>
<script>
$(document).ready(function() {
$("#searchinput").attr("placeholder","Поиск по сайту");
$("#dosearch").attr("value","Найти");
$("#fullsearch").each(function(){

    var a,b,d,g,e,id,clear;

    a=$(this);
    id=a.find('#full_search').attr('value');
    clear=a.find('#doclear');

    a.find('#result_from').after(a.find('#searchinput').attr('style',''),a.find('#dosearch').attr('style',''),a.find('#dofullsearch'));

    if(id>0) {

        a.addClass('fullsearch');
        b=$('<div class=\"options\" />');
        a.find('#result_from').after(b);
        a.find('label[for=all_word_seach]').append('<span />').appendTo(b).wrap('<div class=\"word-option switch\" />');
        a.find('label[for=rb_showposts_1]').append('<span />').appendTo(b).wrap('<div class=\"short-option switch\" />');
        a.find('#rb_showposts_0').prependTo(b.find('.short-option label')); 
        a.find('#rb_showposts_1').attr('type','checkbox');
        a.find('#titleonly').appendTo(b).wrap('<div class=\"where-option\" />');
        a.find('select[multiple]').attr('style','').attr('size','5').appendTo(b).wrap('<div class=\"category-option\" />');
        a.find('#userfield').addClass('userfield-option').appendTo(b);
        a.find('#searchuser').attr('placeholder','имя');
        d=$('<div class=\"period-option\"/>').appendTo(b);
        g=$('<div class=\"sort-option\"/>').appendTo(b);
        e=$('<div class=\"comments-option\"/>').appendTo(b);
        a.find('#searchdate,#beforeafter').attr('style','').appendTo(d);
        a.find('#sortby,#resorder').attr('style','').appendTo(g);
        a.find('#replyless,#replylimit').attr('style','').appendTo(e);
        clear.attr('style','').attr('class','').attr('value','Сбросить все').appendTo(b);
        clear.on('click', function() { a.find('#rb_showposts_1').prop('checked', false) });
        b.children('div').prepend('<b class=\"title\"></b>');
    }

    $(".options > div:not(.switch) .title").click(function(){$(this).parent().toggleClass("active");}); 
    a.find('table').remove();
});

});
</script>