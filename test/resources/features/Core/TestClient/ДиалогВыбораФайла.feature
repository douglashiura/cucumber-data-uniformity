# encoding: utf-8
# language: ru

@IgnoreOnCIMainBuild




Функционал: Проверка работы диалога выбора файла

Как разработчик
Я хочу чтобы можно было в режиме TestClient выбирать файлы через объект ДиалогВыбораФайла
Чтобы я мог эмулировать интерактивный выбор файлов


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Интерактивное открытие файла
	Когда В панели разделов я выбираю "Основная"
	И     В панели функций я выбираю "Справочник3"
	Тогда открылось окно "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     Я буду выбирать внешний файл "c:\temp\333.epf"
	И     В открытой форме я нажимаю на кнопку с заголовком "Открыть файл"