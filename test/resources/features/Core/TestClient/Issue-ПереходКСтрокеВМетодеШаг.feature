
# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds



Функционал: Проверка работы метода шаг при переходе к строке

Как разработчик
Я хочу чтобы корректно работал метод шаг при переходе к строке
Чтобы я мог использовать метод шаг для перехода к строке ТЧ

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Проверка метода шаг для перехода к строке ТЧ
	Когда я удаляю все элементы Справочника "Справочник1"
	Когда я создаю fixtures по макету "Макет"
	И     В панели разделов я выбираю "Основная"
	И     В панели функций я выбираю "Справочник1"
	Когда я выполняю метод Шаг с переходом к элемету Тестовый Элемент Два
