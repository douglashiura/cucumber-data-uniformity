

# language: ru



@IgnoreOnCIMainBuild


Функционал: Тестовая фича, проверяющая работу изменения статуса шага на failed
 

Сценарий: Изменение статуса шага
	Когда я прерываю выполнение шагов и подключаю таймер "СлужебныйТаймер"
	Тогда второй шаг не должен выполнится