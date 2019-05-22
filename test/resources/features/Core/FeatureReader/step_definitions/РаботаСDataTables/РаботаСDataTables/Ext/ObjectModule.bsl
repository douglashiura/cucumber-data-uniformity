﻿Перем Ванесса;


Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции


Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюШагСОбычнымПараметромИВПараметрыКоторогоПереданаТаблица(Парам01,ТабПарам)","ЯВыполняюШагСОбычнымПараметромИВПараметрыКоторогоПереданаТаблица","я выполняю шаг с обычным параметром ""ОбычныйПараметр"" и в параметры которого передана таблица:");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудeтЗначениеИзТаблицыТип(Парам01,Парам02)","ВПеременнойКонтекстБудeтЗначениеИзТаблицыТип","в переменной контекст будeт значение из таблицы 10 Тип ""ЧислоВТаблице""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудeтОбычноеЗначениеПереданногоПараметраТип(Парам01,Парам02)","ВПеременнойКонтекстБудeтОбычноеЗначениеПереданногоПараметраТип","в переменной контекст будeт Обычное значение переданного параметра ""ОбычныйПараметр"" Тип ""ОбычныйПараметрИзПроцедуры""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудeтЧислоМинусОдиннадцать()","ВПеременнойКонтекстБудeтЧислоМинусОдиннадцать","И     в переменной контекст будeт число минус одиннадцать");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюШагСВКоторомПередаётсяТаблицаСоСтрокойВКавычкахТоНеВозникаетОшибок(ТабПарам)","ЯВыполняюШагСВКоторомПередаётсяТаблицаСоСтрокойВКавычкахТоНеВозникаетОшибок","Когда я выполняю шаг с в котором передаётся таблица со строкой в кавычках то не возникает ошибок:");

	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


//я выполняю шаг с обычным параметром "ОбычныйПараметр" и в параметры которого передана таблица:
//@ЯВыполняюШагСОбычнымПараметромИВПараметрыКоторогоПереданаТаблица(Парам01,ТабПарам)

Процедура ЯВыполняюШагСОбычнымПараметромИВПараметрыКоторогоПереданаТаблица(ОбычныйПараметр,ТаблицаИзФичи) Экспорт
	Контекст.Вставить("ОбычныйПараметрИзПроцедуры",ОбычныйПараметр);
	Для каждого СтрТаблицаИзФичи Из ТаблицаИзФичи Цикл
		ЗначениеКолонка1 = СтрТаблицаИзФичи["Кол1"];
		ЗначениеКолонка2 = СтрТаблицаИзФичи["Кол2"];
		
		Контекст.Вставить(ЗначениеКолонка2,ЗначениеКолонка1);
		//Сообщить("" + ЗначениеКолонка1 + ": " + ЗначениеКолонка2);
	КонецЦикла;
КонецПроцедуры

//в переменной контекст будeт значение из таблицы 10 Тип "Число"
//@ВПеременнойКонтекстБудeтЗначениеИзТаблицыТип(Парам01,Парам02)

Процедура ВПеременнойКонтекстБудeтЗначениеИзТаблицыТип(Значение,Тип) Экспорт
	Зн = Контекст[Тип];
	Ванесса.ПроверитьРавенство(Значение,Зн,"Получили ожидаемый результат.");
КонецПроцедуры

//в переменной контекст будeт Обычное значение переданного параметра "ОбычныйПараметр" Тип "ОбычныйПараметрИзПроцедуры"
//@ВПеременнойКонтекстБудeтОбычноеЗначениеПереданногоПараметраТип(Парам01,Парам02)

Процедура ВПеременнойКонтекстБудeтОбычноеЗначениеПереданногоПараметраТип(Значение,ИмяПараметра) Экспорт
	Зн = Контекст[ИмяПараметра];
	Ванесса.ПроверитьРавенство(Значение,Зн,"Получили ожидаемый результат.");
КонецПроцедуры

//И     в переменной контекст будeт число минус одиннадцать
//@ВПеременнойКонтекстБудeтЧислоМинусОдиннадцать(Парам01,Парам02)

Процедура ВПеременнойКонтекстБудeтЧислоМинусОдиннадцать() Экспорт
	Нашли = Ложь;
	Для каждого Элем Из Контекст Цикл
		Если Элем.Значение = -11 Тогда
			Нашли = Истина;
		КонецЕсли;	 
	КонецЦикла;
	
	Если Не Нашли Тогда
		ВызватьИсключение "Не нашел -11 в переменной Контекст.";
	КонецЕсли;	 
КонецПроцедуры

//Когда я выполняю шаг с в котором передаётся таблица со строкой в кавычках то не возникает ошибок:
//@ЯВыполняюШагСВКоторомПередаётсяТаблицаСоСтрокойВКавычкахТоНеВозникаетОшибок(ТабПарам)
Процедура ЯВыполняюШагСВКоторомПередаётсяТаблицаСоСтрокойВКавычкахТоНеВозникаетОшибок(ТаблицаИзФичи) Экспорт
	Для каждого СтрТаблицаИзФичи Из ТаблицаИзФичи Цикл
		ЗначениеКолонка1 = СтрТаблицаИзФичи["Кол1"];
		ЗначениеКолонка2 = СтрТаблицаИзФичи["Кол2"];
		
		Контекст.Вставить(ЗначениеКолонка2,ЗначениеКолонка1);
		//Сообщить("" + ЗначениеКолонка1 + ": " + ЗначениеКолонка2);
	КонецЦикла;
КонецПроцедуры
