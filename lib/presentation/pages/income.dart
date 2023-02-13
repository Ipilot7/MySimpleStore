import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/data/data_providers/db_handler.dart';
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
  DBHelper? dbHelper;
  late Future<List<IncomeExpensesModel>> datalist;
  final _fromKey = GlobalKey<FormState>();

  final price = TextEditingController();
  final descInput = TextEditingController();

  String text = '';

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    // loadData();
  }

  loadData() async {
    datalist = dbHelper!.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightBgClr,
      appBar: AppBar(
        toolbarTextStyle: AppTextStyles.body22w5,
        title: widget.isTrue
            ? Text(
                'Новый доход',
                style: AppTextStyles.body22w5.copyWith(color: AppColors.white),
              )
            : Text(
                'Новый расход',
                style: AppTextStyles.body22w5.copyWith(color: AppColors.white),
              ),
      ),
      body: Form(
        key: _fromKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Card(
                child: TextFormField(
                  autocorrect: true,
                  controller: descInput,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration.collapsed(
                      hintStyle: AppTextStyles.body16w5,
                      hintText: 'Добавить заметку'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Bo`sh bo`lishi mumkin emas';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Bo`sh bo`lishi mumkin emas';
                    }
                    return null;
                  },
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
                        borderSide:
                            BorderSide(color: Colors.blue, width: 3.0.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 3.0.w),
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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      var date = DateTime.now();
                      dbHelper!.insert(IncomeExpensesModel(
                          type: 'hello',
                          desc: descInput.text,
                          price: double.parse(price.text),
                          datatime: date.toString(),
                          isincome: widget.isTrue == true ? 1 : 0));
                      Navigator.pop(context);
                      price.clear();
                      descInput.clear();
                    }
                    // IncomeExpensesModel model = IncomeExpensesModel();
                    // model.desc = descInput.text;
                    // model.isincome = widget.isTrue;
                    // model.price = double.parse(price.text);
                    // model.type = "Корни";
                    // model.dataTime = DateTime.now();
                    // hello.add(model);
                  },
                  child: const Text('add Item'),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            GridView.builder(
              shrinkWrap: true,
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5.h, crossAxisCount: 4),
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
          ],
        ),
      ),
    );
  }
}
