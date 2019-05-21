
# language: ru

@IgnoreOnLinux

Функционал: Проверка перегенерации EPF в режиме обычных форм
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность на основании фичи перегенерировать epf файлы
 
Контекст:
	Дано Очищены временные файлы результатов прошлых генераций

	Сценарий: Перегенерация EPF

	Когда я открыл форму VanessaBehavoir в режиме самотестирования
	И я загрузил специальную тестовую фичу "ФичаДляПроверкиПерегенерацииEPF"
	И я перешел на закладку генератор EPF
	И ожидаемый файл epf уже существует
	И в ожидаемом файле уже есть реализованные шаги
	И в фиче есть шаги, которых нет в ожидаемом epf файле
	И я нажал на кнопку "СоздатьШаблоныОбработок"
	Тогда я получил сгенерированный epf файл в ожидаемом каталоге
	И сгенерированный epf прошел проверку на корректность после перегенерации

