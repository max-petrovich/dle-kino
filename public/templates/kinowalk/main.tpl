<!DOCTYPE html>
<html lang="de">
<head>
{headers}
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="{THEME}/images/favicon.png" />
  <link href="{THEME}/style/styles.css" type="text/css" rel="stylesheet" />
  <link href="{THEME}/style/engine.css" type="text/css" rel="stylesheet" />
  <!--[if lt IE 9]><script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700,400italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
</head>

<body>

	 <header class="head center clearfix">
		<a href="/" class="logotype" title="zur Startseite"></a>
		<div class="search-wrap">
			<form id="quicksearch" method="post">
				<input type="hidden" name="do" value="search" />
				<input type="hidden" name="subaction" value="search" />
				<div class="search-box">
					<input id="story" name="story" placeholder="Suche..." type="text" />
					<button type="submit" title="Suchen"><i class="fa fa-search"></i></button>
				</div>
			</form>
		</div>
		<div class="login-buts">
			<a href="/index.php?do=favorites" class="my-fav icon-left icon-dark button"><i class="fa fa-star-o"></i>Meine Favoriten</a>
			<div class="show-login icon-left" id="show-login">[group=5]<i class="fa fa-sign-in"></i>Anmelden[/group][not-group=5]<i class="fa fa-cog"></i>Mein Account[/not-group]</div>
			[group=5]<div class="to-reg"> oder <a href="/regestrierung">Registrieren</a></div>[/group]
		</div>
	</header>
	
	 <div class="wrap center">
	 

		<div class="cols clearfix" id="cols-r">
		
			<div class="col-cont">
			
				{info}
				
				[not-aviable=main|cat|favorites]
				<div class="page clearfix">
						{content}
				</div>
				[/not-aviable]
				
				[aviable=main|cat|favorites]<div class="section">[/aviable]
					[aviable=main]<div class="section-title clearfix">
						<h2>Neue Kinofilme</h2>
					</div>[/aviable]
                    [aviable=cat]<div class="section-title clearfix">
                        <h2>{category-title}</h2>
					</div>[/aviable]
					[aviable=cat|favorites]<div class="movies clearfix grid grid-thumb" data-view="grid-thumb" id="grid">
						{content}
					</div>
				</div>
				[/aviable]
                [aviable=main]<div class="movies clearfix grid grid-thumb" data-view="grid-thumb" id="grid">
						{custom category="1-100000"  template="shortstory" available="global" navigation="no" from="0" limit="15" sort="desc" cache="yes"}
                </div>
                
                <div class="section-title clearfix">
						<h2>Neue Trickfilme</h2>
					</div>
                <div class="movies clearfix grid grid-thumb" data-view="grid-thumb" id="grid">
                {custom category="14"  template="shortstory" available="global" navigation="no" from="0" limit="10"sort="desc" cache="yes"}
					</div>
				</div>
				[/aviable]
				
				
				
				{include file="main-seo.tpl"}
			
			</div>
			
			<aside class="col-side">
			
			
				<div class="side-item side-bg">
					<div class="side-title icon-left icon-dark"><i class="fa fa-film"></i>Genres</div>
					<div class="side-cont clearfix">
						<ul class="menu-2col navi">
            <li><a href="/abenteuer">Abenteuer</a></li>
            <li><a href="/action">Action</a></li>
            <li><a href="/biographie">Biographie</a></li>
            <li><a href="/drama">Drama</a></li>
            <li><a href="/familie">Familie</a></li>
            <li><a href="/fantasy/">Fantasy</a></li>
            <li><a href="/horror">Horror</a></li>
            <li><a href="/komoedie/">Komödie</a></li>
            <li><a href="/krimi">Krimi</a></li>
            <li><a href="/romantik">Romantik</a></li>
            <li><a href="/sci-fi">Sci-Fi</a></li>
            <li><a href="/thriller">Thriller</a></li>
            <li><a href="/trickfilm">Trickfilm</a></li>
            <li><a href="/western">Western</a></li>
            <li><a href="/krieg">Krieg</a></li>
            <li><a href="/sport">Sport</a></li>	
                        </ul>
					</div>
					<div class="side-title icon-left icon-dark"><i class="fa fa-calendar-o"></i>Filme nach Erscheinungsjahr</div>
					<div class="side-cont clearfix">
						<ul class="menu-2col menu-4col">
<li><a href="/xfsearch/2017">2017</a></li>							
<li><a href="/xfsearch/2016">2016</a></li>
							<li><a href="/xfsearch/2015">2015</a></li>
							<li><a href="/xfsearch/2014">2014</a></li>
							<li><a href="/xfsearch/2013">2013</a></li>
							<li><a href="/xfsearch/2012">2012</a></li>
							<li><a href="/xfsearch/2011">2011</a></li>
							<li><a href="/xfsearch/2010">2010</a></li>
							<li><a href="/xfsearch/2009">2009</a></li>
<li><a href="/xfsearch/2008">2008</a></li>
<li><a href="/xfsearch/2007">2007</a></li>
<li><a href="/xfsearch/2006">2006</a></li>
<li><a href="/xfsearch/2005">2005</a></li>
<li><a href="/xfsearch/2004">2004</a></li>
<li><a href="/xfsearch/2003">2003</a></li>
<li><a href="/xfsearch/2002">2002</a></li>

						</ul>
					</div>
				</div>
				<div class="side-item">
					<div class="side-title icon-left"><i class="fa fa-bookmark-o"></i>Top-Filme der Woche</div>
					<div class="side-conts clearfix">
						{topnews}
					</div>
				</div>
				<div class="side-item">
					<div class="side-title icon-left"><i class="fa fa-question-circle"></i>Umfrage</div>
					<div class="side-cont clearfix">
						{vote}
					</div>
				</div>
			</aside>
		</div>	
		
			<footer class="foot-line clearfix">
				<div class="copyr">
                    © 2015-2017 FelixKino - All rights reserved<br/>
				</div>
                <a href="/dmca.html">DMCA</a>
                <a href="/privacy-policy.html">Privacy Policy</a>
                <a href="/terms.html">Terms of Use</a>
                <a href="/index.php?do=feedback">Support</a>
         </footer>
	 </div>

<!-- end wrapper -->

{login}
<script src="{THEME}/js/libs.js"></script>
<link href="{THEME}/style/filter-xf.css" type="text/css" rel="stylesheet" />
<script src="{THEME}/js/filter-xf.js"></script>
<script>
window.onload=function() {
  window.frames["printf"].focus();
  window.frames["printf"].print();
}
</script>
{AJAX}  

</body>
</html>
