
# language: ru

@IgnoreOnCIMainBuild
@Proposal
@WindowsOnly

Функционал: Добавление посветки активных элементов
	Как пользователь vanessa-behavior
	я хочу в автоматизированно создаваемой документации
	подсветку активного элемента, который нажимается в данном шаге
	
Контекст:
    Дано: установлена программа для работы со скриншотами InfanView
	
	
Сценарий: Добавление красной подсветки
	Когда я запускаю TestClient в режиме формирования HTML документации
	И когда проходит шаг ```Я нажимаю кнопку раздела "Тестовый раздел"```
	Тогда возникает img файл соответвующий шагу
	И раздел ```Тестовый раздел``` выделен красным прямоугольником


