
# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds



Функционал: Проверка что в таблице на форме Testclient можно активизировать колонку

Как разработчик
Я хочу чтобы можно было активизировать нужную мне колонку ТЧ
Чтобы отработали обрабочики формы при активизации колонки


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Активизация колонки ТЧ
	Когда В панели разделов я выбираю "Основная"
	И     В панели функций я выбираю "Справочник1"
	Тогда открылось окно "Справочник1"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник1 (создание)"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку с заголовком "Добавить"
	И     В форме "Справочник1 (создание)" в ТЧ "ТабличнаяЧасть1" я завершаю редактирование строки
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я активизирую поле "Реквизит дата"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"
