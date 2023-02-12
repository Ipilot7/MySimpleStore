import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

// функция для вычисление
equalPressed(TextEditingController userInput) {
  String finaluserinput = userInput.text;
  finaluserinput = finaluserinput.replaceAll('÷', '/');
  finaluserinput = finaluserinput.replaceAll(
    'x',
    '*',
  );
  Parser p = Parser();
  Expression exp = p.parse(finaluserinput);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  if (double.parse('$eval').toStringAsFixed(2) == '0') {}
  userInput.text = double.parse('$eval').toStringAsFixed(2);
  return userInput.text;
}

deleteItem(TextEditingController controller) {
  if (controller.text.isNotEmpty) {
    return controller.text =
        controller.text.substring(0, controller.text.length - 1);
  } else {
    return controller.text = '';
  }
}

// class  CustomTheme{

//  static Color bgClr = AppColors.nightBgClr;
//   static Color numClr = AppColors.numbersClr;
//   static Color numTxtClr = AppColors.white;
//   static Color resultClr = AppColors.white;
//   static Color switchClr = AppColors.numbersClr;
//  static Color switchColor = AppColors.lastAction;

// static changeTheme(Alignment switchAlign, Alignment dayAlign, Alignment nightAlign ) {
//     if (switchAlign == dayAlign) {
//         switchAlign = nightAlign;
//         bgClr = AppColors.lightBgClr;
//         numClr = AppColors.white;
//         numTxtClr = AppColors.black;
//         resultClr = AppColors.black;

//         switchClr = AppColors.white;
//         switchColor = AppColors.actionsRowColor;
//       } else {
//         //night
//         switchAlign = dayAlign;
//         bgClr = AppColors.nightBgClr;
//         numClr = AppColors.numbersClr;
//         numTxtClr = AppColors.white;
//         resultClr = AppColors.white;

//         switchClr = AppColors.numbersClr;
//         switchColor = AppColors.lastAction;
//       }
//   }
// }
