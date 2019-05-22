
# language: ru



Функционал: Проверка существования элементов
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность проверить существование элементов в базе
 

Сценарий: Работа со справочниками

	Когда в метаданных есть Справочник "Справочник1"
	И я удаляю все элементы Справочника "Справочник1"
	И в базе нет элементов Справочника "Справочник1"
	И я создаю сам один элемент справочника "Справочник1"
	Тогда В базе появился хотя бы один элемент справочника "Справочник1"

