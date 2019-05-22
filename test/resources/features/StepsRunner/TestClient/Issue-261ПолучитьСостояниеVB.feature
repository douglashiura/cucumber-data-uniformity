
# language: ru

#https://github.com/silverbulleters/vanessa-behavior/issues/261

@IgnoreOn82Builds
@IgnoreOnOFBuilds

@tree

Функционал: Проверка работы получения состояния Vanessa-Behavior
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность получить состояние vanessa-behavior
	Чтобы я мог использовать эти данные в своих сценариях
 

	Сценарий: Проверка работы получения состояния Vanessa-Behavior

		Когда Я открываю VanessaBehavior в режиме TestClient	
		
		И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ПолучениеСостоянияVanessaBehavior"
		И я прервал в VanessaBehavoir в TestClient я нажал на кнопку "ВыполнитьСценарии"
				И В открытой форме я нажимаю на кнопку "Перезагрузить сценарии"
				И Пауза 4
				И В открытой форме я нажимаю на кнопку с заголовком "Выполнить сценарии"
				И Пауза 4
				
		Тогда в VanessaBehavoir в TestClient снипет заполнился верно
			И     таблица формы с именем "ДеревоТестов" стала равной:
				| 'Статус'  |
				| ''        |
				| ''        |
				| 'Success' |
				| 'Success' |
						