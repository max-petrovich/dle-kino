			<div class="filter-wrap" id="filter-wrap">
				<div class="filter-header icon-left"><span class="fa fa-filter"></span>Фильтр по параметрам</div>
				<div class="filter-box">
					<div class="fb-sect-name">Тип медиа</div>
					<div class="fb-sect flex-row flex-2 fb-checks">
						<div class="fb-check">
							<input id="film" name="cat" value="1" type="checkbox">
							<label for="film">Фильмы </label>
						</div>
						<div class="fb-check">
							<input id="ser" name="cat" value="3" type="checkbox">
							<label for="ser">Сериалы </label>
						</div>
						<div class="fb-check">
							<input id="mult" name="cat" value="2" type="checkbox">
							<label for="mult">Мультфильмы </label>
						</div>
						<div class="fb-check">
							<input id="anime" name="cat" value="4" type="checkbox">
							<label for="anime">Аниме </label>
						</div>
					</div>
					<div class="fb-sect-name">Выберите поджанр</div>
					<div class="fb-sect fb-sel">
						<select name="sel-multi" multiple data-placeholder="Выберите поджанр">
							<option>Боевик</option>
							<option>Комедия</option>
							<option>Ужасы</option>
							<option>Триллер</option>
							<option>Мелодрама</option>
						</select>
					</div>
					<div class="fb-sect-name">Выбрать что-то</div>
					<div class="fb-sect fb-sel">
						<select name="sel" data-placeholder="Выбрать что-то">
							<option></option>
							<option>Пункт 1</option>
							<option>Пункт 2</option>
							<option>Пункт 3</option>
						</select>
					</div>
					<div class="fb-sect-name">Выбрать диапазон</div>
					<div class="fb-sect flex-row flex-2">
						<select name="sel" data-placeholder="от">
							<option></option>
							<option>Пункт 1</option>
							<option>Пункт 2</option>
							<option>Пункт 3</option>
						</select>
						<select name="sel" data-placeholder="до">
							<option></option>
							<option>Пункт 1</option>
							<option>Пункт 2</option>
							<option>Пункт 3</option>
						</select>
					</div>
					<div class="fb-sect-name">Выбрать диапазон слайдером</div>
					<div class="fb-sect">
						<input type="text" name="r-film_year" id="year" />
					</div>
					<div class="fb-sect">
						<input type="text" placeholder="Введите ключевое слово" />
					</div>
					<div class="fb-submit flex-row flex-2">
						<input type="button" data-fieldsearch="submit" value="Поиск">
						<input type="button" data-fieldsearch="reset" value="Очистить">
					</div>
				</div>
			</div>