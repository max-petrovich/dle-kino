<article class="full-page">

	<div class="page-cols clearfix">
	
		<div class="page-col-right" id="mc-right">
		
			<h1>{title}[group=1] [edit]<i class="fa fa-cog"></i>[/edit][/group]</h1>
			
			<div class="rates ignore-select">
				
					<div class="m-buttons">
				<div class="but to-view"><i class="fa fa-arrow-down"></i> Anschauen</div>
				[add-favorites]<div class="but"><i class="fa fa-heart-o"></i> Zu den Favoriten hinzufügen</div>[/add-favorites]
				[del-favorites]<div class="but"><i class="fa fa-heart"></i> Von den Favoriten entfernen</div>[/del-favorites] 
			
				</div>
				
			</div>
			
			<div class="m-info">
				<div class="mi-item clearfix">
					<span><i class="fa fa-calendar-o"></i>Jahr:</span> [xfvalue_year] 
				</div>
				<div class="mi-item clearfix">
					<span><i class="fa fa-film"></i>Genre:</span> {link-category}
				</div>
				<div class="mi-item clearfix">
					<span><i class="fa fa-bullhorn"></i>Regie:</span> [xfvalue_regie] 
				</div>
				<div class="mi-item clearfix long">
					<span><i class="fa fa-users"></i>Schauspieler:</span> [xfvalue_akter]
				</div>
			</div>
            <div class="m-desc full-text clearfix slice-this">
				{full-story}
			</div>
			
		</div>
		
		<div class="page-col-left ignore-select">
		
			<div class="m-img">
				<img src="{image-1}" alt="{title}" />
				<div class="info-i new-s-mark">
				</div>
				<div class="info-i hd-mark">HD</div>
			</div>
			
			
		</div>
		
	</div>

			
	<div class="player-section">
				<ul class="tabs nowrap">
					<li class="current">{title} - HD STREAM</li>
				</ul>
				
		<div class="player-drop visible full-text">
					<iframe class="embed-responsive-item" id="embeded-video" width="700" height="430" frameborder="0" mozallowfullscreen="true" webkitallowfullscreen="true" allowfullscreen="true" scrolling="no" src="[xfvalue_openload]"></iframe>
					<!-- это трейлер, заменяем своим полем. this is trailer, replace this youtube frame by your xfield or code. -->
		</div>
					
	</div>
	
    <div class="section related">
				<div class="section-title"><h2>Empfohlene Kinofilme:</h2></div>
				<div class="rel-box" id="owl-rel">
					{related-news}
				</div>
			</div>
</article>


		<div class="full-comms">
			{addcomments}
			[comments]
			<div class="comments-items">
				{comments}
				{navigation}
			</div>
			[/comments]
		</div>