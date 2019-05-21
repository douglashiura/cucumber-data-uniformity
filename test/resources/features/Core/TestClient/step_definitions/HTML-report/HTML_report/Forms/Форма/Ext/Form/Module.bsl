﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Служебная функция.
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

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ВПолеКаталогОтчетаHTMLЯУказываюПутьКОтносительномуКаталогу(Парам01)","ВПолеКаталогОтчетаHTMLЯУказываюПутьКОтносительномуКаталогу","И     в поле каталог отчета HTML я указываю путь к относительному каталогу ""tools\HTML""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВКаталогеHTMLПоявилсяФайлHtml(Парам01)","ВКаталогеHTMLПоявилсяФайлHtml","И в каталоге HTML появился 1 файл html");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВФайлеИнструкцииНетСтроки(Парам01,Парам02)","ВФайлеИнструкцииНетСтроки","И в Файле инструкции ""Instr_ФичаДляПроверкиОтчетаHTML.HTML"" нет строки ""я выполняю простой шаг контекста""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И     в поле каталог отчета HTML я указываю путь к относительному каталогу "tools\HTML"
//@ВПолеКаталогОтчетаHTMLЯУказываюПутьКОтносительномуКаталогу(Парам01)
Процедура ВПолеКаталогОтчетаHTMLЯУказываюПутьКОтносительномуКаталогу(ЧастьПути) Экспорт
	Каталог = Ванесса.Объект.КаталогИнструментов + "\" + ЧастьПути;
	Контекст.Вставить("КаталогHTML",Каталог);
	
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(Каталог) Тогда
		Ванесса.СоздатьКаталогКомандаСистемы(Каталог);
	Иначе
		Ванесса.УдалитьКаталогКомандаСистемы(Каталог);
		Ванесса.СоздатьКаталогКомандаСистемы(Каталог);
	КонецЕсли;	 
	
	Ванесса.Шаг("И В открытой форме в поле с именем ""КаталогOutputИнструкцияHTML"" я ввожу текст """ + Каталог + """");
КонецПроцедуры

&НаКлиенте
//И в каталоге HTML появился 1 файл html
//@ВКаталогеHTMLПоявилсяФайлHtml(Парам01)
Процедура ВКаталогеHTMLПоявилсяФайлHtml(ДолжноБытьФайлов) Экспорт
	ЛогФайл = ПолучитьИмяВременногоФайла("txt");
	Команда = "DIR " + Контекст.КаталогHTML + " > " + ЛогФайл;
	
	КомандаСистемы(Команда);
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ЛогФайл,"Windows-1251");
	
	КолФайлов = 0;
	
	БылФайлAllure = Ложь;
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;
		
		Стр = НРег(Стр);
		
		Если Найти(Стр,".html") > 0 Тогда
			БылФайлAllure = Истина;
			КолФайлов = КолФайлов + 1;
		КонецЕсли;	 
	КонецЦикла;	
	
	Текст.Закрыть();
	
	Если Не БылФайлAllure Тогда
		ВызватьИсключение "В каталоге " + Контекст.КаталогHTML + " не найдено ни одного файла html!";
	КонецЕсли;	
	
	Если КолФайлов <> ДолжноБытьФайлов Тогда
		ВызватьИсключение "Найдено " + КолФайлов + ", а должно быть " + ДолжноБытьФайлов + " файлов";
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И в Файле инструкции "Instr_ФичаДляПроверкиОтчетаHTML.HTML" нет строки "я выполняю простой шаг контекста"
//@ВФайлеИнструкцииНетСтроки(Парам01,Парам02)
Процедура ВФайлеИнструкцииНетСтроки(ИмяФайла,СтрокаПоиска) Экспорт
	ИмяФайла = Контекст.КаталогHTML + "\" + ИмяФайла;
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Поз = Найти(Стр,СтрокаПоиска);
		Если Поз > 0 Тогда
			ВызватьИсключение "В файле <" + ИмяФайла + "> найдена строка <" + СтрокаПоиска + ">";
		КонецЕсли;	 
	КонецЦикла;	
	
	Текст.Закрыть();
	
КонецПроцедуры

//окончание текста модуля