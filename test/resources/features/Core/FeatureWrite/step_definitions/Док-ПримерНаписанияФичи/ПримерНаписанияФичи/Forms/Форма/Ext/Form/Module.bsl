﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;
 
&НаКлиенте
Перем Контекст Экспорт;
 
&НаКлиенте
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
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
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);


	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	//Контекст.Вставить("ИмяВременнойФичи","выаыавы");
	//Ванесса.Шаг("И Строки первого файла """ +  Ванесса.Объект.КаталогИнструментов + "\features\Core\FeatureWrite\Lib\Example01ScenarioOutline._feature" + """ содержатся во втором файле """ + Контекст.ИмяВременнойФичи + """");
	//ВызватьИсключение "!!!!!!!!!!!";
КонецПроцедуры


&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	Ванесса.Шаг("И Строки первого файла """ +  Ванесса.Объект.КаталогИнструментов + "\features\Core\FeatureWrite\Lib\Example01Header._feature"          + """ содержатся во втором файле """ + Контекст.ИмяВременнойФичи + """");
	Ванесса.Шаг("И Строки первого файла """ +  Ванесса.Объект.КаталогИнструментов + "\features\Core\FeatureWrite\Lib\Example01Context._feature"         + """ содержатся во втором файле """ + Контекст.ИмяВременнойФичи + """");
	Ванесса.Шаг("И Строки первого файла """ +  Ванесса.Объект.КаталогИнструментов + "\features\Core\FeatureWrite\Lib\Example01Scenario._feature"        + """ содержатся во втором файле """ + Контекст.ИмяВременнойФичи + """");
	Ванесса.Шаг("И Строки первого файла """ +  Ванесса.Объект.КаталогИнструментов + "\features\Core\FeatureWrite\Lib\Example01ScenarioOutline._feature" + """ содержатся во втором файле """ + Контекст.ИмяВременнойФичи + """");
КонецПроцедуры

