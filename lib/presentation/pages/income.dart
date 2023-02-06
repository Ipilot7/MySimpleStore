import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/presentation/widgets/my_button.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({
    super.key,
    required this.isTrue,
  });
  final bool isTrue;
  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final price = TextEditingController();
  final descInput = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightBgClr,
      appBar: AppBar(
        title: widget.isTrue
            ? const Text('Новый доход')
            : const Text('Новый расход'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Card(
              child: TextField(
                autocorrect: true,
                controller: descInput,
                inputFormatters: [LengthLimitingTextInputFormatter(9)],
                maxLines: 4,
                decoration: const InputDecoration.collapsed(
                    hintText: 'Добавить заметку'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextField(
                readOnly: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(9)],
                controller: price,
                textAlign: TextAlign.right,
                style: AppTextStyles.body32w5,
                decoration: InputDecoration(
                    hintText: 'Введите сумму',
                    hintStyle: AppTextStyles.body22w5
                        .copyWith(color: AppColors.lastAction),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0.w),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          deleteItem(price);
                        });
                      },
                      child: const Icon(
                        Icons.backspace,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {
              IncomeExpensesModel model = IncomeExpensesModel();

              model.desc = descInput.text;
              model.isincome = widget.isTrue;
              model.price = double.parse(price.text);
              model.type = "Корни";
              model.dataTime = DateTime.now();

              hello.add(model);

              print(hello);
              price.clear();
              descInput.clear();
              Navigator.pop(context);
            },
            child: const Text('add Item'),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
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
                        equalPressed(price);
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
                              isOperator(price.text[price.text.length - 1])) {
                            price.text =
                                price.text.substring(0, price.text.length - 1) +
                                    buttons[index];
                          } else {
                            price.text += buttons[index];
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
        ],
      ),
    );
  }
}
