import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
import 'package:my_simple_store/presentation/widgets/my_button.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final userInput = TextEditingController();
  final descInput = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightBgClr,
      appBar: AppBar(
        title: const Text('Новый доход'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Card(
                  child: TextField(
                controller: descInput,
                inputFormatters: [LengthLimitingTextInputFormatter(9)],
                maxLines: 4,
                decoration: const InputDecoration.collapsed(
                    hintText: 'Enter your text here'),
              )),
              Padding(
                padding: EdgeInsets.only(top: 0.01 * size.height),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(9)],
                    controller: userInput,
                    textAlign: TextAlign.right,
                    style: kTextstyle(
                      color: AppColors.black,
                      size: size.height * 0.08,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          deleteItem(userInput);
                        });
                      },
                      child: const Icon(
                        Icons.backspace,
                      ),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 15) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed(userInput);
                          });
                        },
                        buttonText: buttons[index],
                        color: AppColors.actionsClmnnClr,
                        textColor: AppColors.black,
                      );
                    }
                    //  другие кнопки
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(
                            () {
                              if (isOperator(buttons[index]) &&
                                  isOperator(userInput
                                      .text[userInput.text.length - 1])) {
                                userInput.text = userInput.text.substring(
                                        0, userInput.text.length - 1) +
                                    buttons[index];
                              } else {
                                userInput.text += buttons[index];
                              }
                            },
                          );
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? AppColors.actionsClmnnClr
                            : AppColors.white,
                        textColor: AppColors.black,
                      );
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    hello
                        .add({"price": userInput.text, "desc": descInput.text});
                    print(hello);
                  },
                  child: const Text('add Item'))
            ],
          ),
        ),
      ),
    );
  }
}
