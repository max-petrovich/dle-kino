<article class="full-page"> 

	<div class="page-cols clearfix mc-article">

		<div class="page-col-right" id="mc-right">
		
			<h1>{title}</h1>
			
			<div class="m-ratings ignore-select">
				<div class="pcr-item">
				[rating]
						<div class="full-rating">
						[rating-type-1]<div class="frating-stars">{rating}</div>[/rating-type-1]
						[rating-type-2]
						<div class="full-rating2">
						[rating-plus]<i class="fa fa-thumbs-o-up"></i> {rating}[/rating-plus]
						</div>
						[/rating-type-2]
						[rating-type-3]
						<div class="full-rating3 clearfix">
						[rating-plus]<i class="fa fa-thumbs-o-up"></i>[/rating-plus]
						[rating-minus]<i class="fa fa-thumbs-o-down"></i>[/rating-minus]
						{rating}
						</div>
						[/rating-type-3]
						</div>
				[/rating]
				</div>
				<div class="pcr-item">
					<div class="social-likes ignore-select">
									<div class="vkontakte" title="Поделиться ссылкой во Вконтакте"></div>
									<div class="facebook" title="Поделиться ссылкой на Фейсбуке"></div>
									<div class="twitter" title="Поделиться ссылкой в Твиттере"></div>
									<div class="odnoklassniki" title="Поделиться ссылкой в Одноклассниках"></div>
									<div class="plusone" title="Поделиться ссылкой в Гугл-плюсе"></div>
					</div>
				</div>
				<div class="pcr-item">[edit]<i class="fa fa-cog"></i>[/edit]</div>
			</div>
			
			<div class="m-desc full-text clearfix">
				{full-story}
			</div>
			
			[not-group=5]
			<div class="m-buttons">
				[add-favorites]<div class="but"><i class="fa fa-heart-o"></i> Добавить в закладки</div>[/add-favorites]
				[del-favorites]<div class="but"><i class="fa fa-heart"></i> Убрать из закладок</div>[/del-favorites] 
			</div>
			[/not-group]
			
	{poll}
	[tags]
	<div class="full-taglist">
		<div class="full-taglist-t">Теги:</div>
		{tags}
	</div>
	[/tags] 
	
			<div class="section related">
				<div class="section-title"><h2>Смотрите также:</h2></div>
				<div class="rel-box" id="owl-rel">
					{related-news}
				</div>
			</div>
			
		</div>
		
	</div>
	
		<div class="rkl-box">
			<img src="{theme}/images/rkl1.jpg" alt="" />
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