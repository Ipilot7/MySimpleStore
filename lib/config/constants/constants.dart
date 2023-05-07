import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';
import '../../features/home/presentation/pages/settings.dart';

List<String> menuNames = ['Главная', 'История'];
List<Icon> menuIcons = [
  const Icon(Icons.home_outlined),
  const Icon(Icons.history_outlined)
];
List floatListNames = ["Новый доход", "Новый расход"];
List floatListIcons = [
  Icons.add_circle_outline_sharp,
  Icons.remove_circle_outline_outlined
];
showSuccessSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

TextStyle kTextstyle(
    {Color? color,
    double? size = 32,
    FontWeight fontWeight = FontWeight.w400,
    double? height,
    double? letterSpasing}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpasing,
      height: height);
}

final List<String> buttons = [
  '÷',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '.',
  '=',
];

//проверка на оператор
bool isOperator(String x) {
  if (x == '÷' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
  return false;
}

String monthReturned(String date) {
  var day = int.parse(date.substring(8, 10));
  var month = int.parse(date.substring(5, 7));
  String monthName = '';

  switch (month) {
    case 1:
      monthName = 'Январь';
      break;
    case 2:
      monthName = 'Февраль';
      break;
    case 3:
      monthName = 'Март';
      break;
    case 4:
      monthName = 'Апрель';
      break;
    case 5:
      monthName = 'Май';
      break;
    case 6:
      monthName = 'Июнь';
      break;
    case 7:
      monthName = 'Июль';
      break;
    case 8:
      monthName = 'Август';
      break;
    case 9:
      monthName = 'Сентябрь';
      break;
    case 10:
      monthName = 'Октябрь';
      break;
    case 11:
      monthName = 'Ноябрь';
      break;
    case 12:
      monthName = 'Декабрь';
      break;
    default:
      monthName = 'Нет такого месяца';
  }
  return '$day $monthName';
}

List<String> typeExcensesList = [
  'Транспорт',
  'Продукты',
  'Дети',
  'Покупки',
  'Телефон',
  'Дом',
  'Аптека',
  'Развлечение',
  'Здоровье',
  'Рестораны',
  'Налоги',
  'Игры',
  'Интернет',
  'Спорт',
];

List<Widget> pages = [
  const HomePage(),
  const SettingsPage(),
  Container(),
];
List<String> pageNames = ['Главная', 'Настройки', 'О программе'];
List<IconData> pageIcons = [Icons.home, Icons.settings, Icons.info];

List<String> currencies = [
  'USD',
  'RUB',
  'UZS',
];
List<String> languages = [
  'English',
  'Русский',
  'O\'zbekcha',
];
