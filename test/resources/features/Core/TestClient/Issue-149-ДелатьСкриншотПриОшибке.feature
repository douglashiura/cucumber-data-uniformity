
# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds



Функционал: Создание скриншота всех сеансов 1С при возникновении ошибки

Как разработчик
Я хочу чтобы при запуске сценария при возникновении ошибки были сделаны скриншоты всех окнон 1С
Чтобы потом эти скриншоты были приложены к отчету Allure

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Проверка изменения реквизита ТЧ

	Когда Я открываю VanessaBehavior в режиме TestClient
	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиРаботыСкриншотов"
	И     В открытой форме я перехожу к закладке с заголовком "Сервис"
	И     в поле каталог скриншотов я указываю путь к относительному каталогу "tools\ScreenShotsTest"
	И     В открытой форме я изменяю флаг "Формировать скриншот при ошибке"
	И     В открытой форме в поле с заголовком "Консольная команда создания скриншотов" я ввожу текст '"C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=1 /convert='
	И В открытой форме я нажимаю на кнопку "Перезагрузить сценарии"
	И Пауза 6
	И В открытой форме я нажимаю на кнопку с заголовком "Выполнить сценарии"
	И Пауза 12
	И в каталоге скриншотов появился хотя бы один скриншот
	