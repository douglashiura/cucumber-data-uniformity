
# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds



Функционал: Проверка выборка типа элемента из составного списка

Как разработчик
Я хочу чтобы корректно происходил парсинг фичи с включенным тегом tree, когда используется вертикальная черта в шагах
Чтобы я мог ипользовать этот тег в своих фичах

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Проверка парсинга фичи, когда используется вертикальная черта
	Когда Я открываю VanessaBehavior в режиме TestClient
	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиРаботыВертикальнойЧерты_Тег_tree"
	И В открытой форме я нажимаю на кнопку "Перезагрузить сценарии"
	И Пауза 6
	И     таблица формы с именем "ДеревоТестов" стала равной:
		| 'Наименование'                                            | 
		| 'ФичаДляПроверкиРаботыВертикальнойЧерты_Тег_tree.feature' |
		| 'ФичаДляПроверкиРаботыВертикальнойЧерты_Тег_tree'         |
		| 'Переход  к строке таблицы'                               |
		| 'Когда Шаг один'                                          |
		| 'И Шаг два'                                               |
	
	