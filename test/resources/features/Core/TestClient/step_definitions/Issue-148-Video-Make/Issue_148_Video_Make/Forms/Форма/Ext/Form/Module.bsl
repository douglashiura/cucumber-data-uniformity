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
Перем МаксКоличествоСекундПодключения,ТекКоличествоСекундПодключения,ИмяПеременнойКаталога,ПеременнаяОжидаемыйФайл;



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

	ДобавитьШагВМассивТестов(ВсеТесты,"ВПолеУказанСуществующийКаталог(Парам01)","ВПолеУказанСуществующийКаталог","Когда в поле ""КаталогСкриптовСборкиВидео"" указан существующий каталог");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВПолеЯУказываюПутьКОтносительномуКаталогу(Парам01,Парам02)","ВПолеЯУказываюПутьКОтносительномуКаталогу","И     в поле ""Каталог скриптов сборки видео"" я указываю путь к относительному каталогу ""..\vanessa-ci\MakeVideoInstr""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВПолеЯУказываюПутьКОтносительномуКаталогуИОчищаюКаталог(Парам01,Парам02)","ВПолеЯУказываюПутьКОтносительномуКаталогуИОчищаюКаталог","И     в поле ""Каталог оutput инструкция видео"" я указываю путь к относительному каталогу ""tools\Video"" и очищаю каталог");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВТеченииСекундВКаталогеЗаданномВПеременнойКонтекстаПоявилсяФайл(Парам01,Парам02,Парам03)","ВТеченииСекундВКаталогеЗаданномВПеременнойКонтекстаПоявилсяФайл","И в течении 60 секунд в каталоге заданном в переменной контекста ""ПараметрКаталог"" появился файл ""result.mp4""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВЛогеСообщенийTestClientНетСлова(Парам01)","ВЛогеСообщенийTestClientНетСлова","И в логе сообщений TestClient нет слова ""ошибка""");

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
//И     в поле "Каталог output инструкция видео" я указываю путь к относительному каталогу "tools\Video" и очищаю каталог
//@ВПолеЯУказываюПутьКОтносительномуКаталогуИОчищаюКаталог(Парам01,Парам02)
Процедура ВПолеЯУказываюПутьКОтносительномуКаталогуИОчищаюКаталог(ИмяЭлемента,ЧастьПути) Экспорт
	Каталог = Ванесса.Объект.КаталогИнструментов + "\" + ЧастьПути;
	Контекст.Вставить("ПараметрКаталог",Каталог);
	
	Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(Каталог) Тогда
		Ванесса.СоздатьКаталогКомандаСистемы(Каталог);
	Иначе
		Ванесса.УдалитьКаталогКомандаСистемы(Каталог);
		Ванесса.СоздатьКаталогКомандаСистемы(Каталог);
	КонецЕсли;	 
	
	Ванесса.Шаг("И В открытой форме в поле с заголовком """ + ИмяЭлемента + """ я ввожу текст """ + Каталог + """");
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьСуществованиеФайла()
	ИмяФайла = Контекст[ИмяПеременнойКаталога] + "\" + ПеременнаяОжидаемыйФайл;
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайла) Тогда
		ОтключитьОбработчикОжидания("ПроверитьСуществованиеФайла");
		
		Ванесса.ПродолжитьВыполнениеШагов(Ложь);//шаг выполнился успешно
		Возврат;
	КонецЕсли;	 
	
	
	ТекКоличествоСекундПодключения = ТекКоличествоСекундПодключения + 1;
	
	Если ТекКоличествоСекундПодключения >= МаксКоличествоСекундПодключения Тогда
		ОтключитьОбработчикОжидания("ПроверитьСуществованиеФайла");
		Ванесса.ПродолжитьВыполнениеШагов(Истина);
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
//И в течении 60 секунд в каталоге заданном в переменной контекста "ПараметрКаталог" появился файл "result.mp4"
//@ВТеченииСекундВКаталогеЗаданномВПеременнойКонтекстаПоявилсяФайл(Парам01,Парам02,Парам03)
Процедура ВТеченииСекундВКаталогеЗаданномВПеременнойКонтекстаПоявилсяФайл(КолСекунд,ПараметрКаталог,ОжидаемыйФайл) Экспорт
	Ванесса.ЗапретитьВыполнениеШагов();
	
	МаксКоличествоСекундПодключения = КолСекунд;
	ТекКоличествоСекундПодключения  = 0;
	ИмяПеременнойКаталога           = ПараметрКаталог;
	ПеременнаяОжидаемыйФайл         = ОжидаемыйФайл;
	
	ПодключитьОбработчикОжидания("ПроверитьСуществованиеФайла",1);
	
КонецПроцедуры

&НаКлиенте
//И     в поле "Каталог скриптов сборки видео" я указываю путь к относительному каталогу "..\vanessa-ci\MakeVideoInstr"
//@ВПолеЯУказываюПутьКОтносительномуКаталогу(Парам01,Парам02)
Процедура ВПолеЯУказываюПутьКОтносительномуКаталогу(ИмяЭлемента,ЧастьПути) Экспорт
	Если Лев(ЧастьПути,2) = ".." Тогда
		Файл = Новый Файл(Ванесса.Объект.КаталогИнструментов);
		
		Каталог = Файл.Путь + Сред(ЧастьПути,4);
	Иначе	
		Каталог = Ванесса.Объект.КаталогИнструментов + "\" + ЧастьПути;
	КонецЕсли;	 
	
	
	
	Ванесса.Шаг("И В открытой форме в поле с заголовком """ + ИмяЭлемента + """ я ввожу текст """ + Каталог + """");
КонецПроцедуры

&НаКлиенте
//И в логе сообщений TestClient нет слова "ошибка"
//@ВЛогеСообщенийTestClientНетСлова(Парам01)
Процедура ВЛогеСообщенийTestClientНетСлова(Парам01) Экспорт
		МассивСообщений = КонтекстСохраняемый.ТестовоеПриложение.ПолучитьАктивноеОкно().ПолучитьТекстыСообщенийПользователю();
		
		Для каждого Сообщение Из МассивСообщений Цикл
			Если Найти(НРег(Сообщение),"ошибка") > 0 Тогда
				ВызватьИсключение "Найдено сообщение: " + Сообщение;
			КонецЕсли;	 
			//Сообщить("" + Сообщение);
		КонецЦикла;
КонецПроцедуры


&НаКлиенте
//Когда в поле "КаталогСкриптовСборкиВидео" указан существующий каталог
//@ВПолеУказанСуществующийКаталог(Парам01)
Процедура ВПолеУказанСуществующийКаталог(ИмяПоля) Экспорт
	Каталог = Ванесса.Объект[ИмяПоля];
	Если Не ЗначениеЗаполнено(Каталог) Тогда
		ВызватьИсключение "Не реализовано.";
	КонецЕсли;	 
	
	Если Не Ванесса.ФайлСуществуетКомандаСистемы(Каталог) Тогда
		ВызватьИсключение "Не реализовано.";
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля
