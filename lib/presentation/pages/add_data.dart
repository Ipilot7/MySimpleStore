import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/data/services/incomeService.dart';

import '../../config/constants/app_text_styles.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key, required this.isTrue}) : super(key: key);
  final bool isTrue;
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _descController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateType = false;
  var _userService = IncomeService();
  String typeExcenses = 'Выберите категорию';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Введите Заметку',
                    labelText: 'Заметка',
                    errorText: _validateName
                        ? 'Поле "Заметка" не должно быть пуста'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Введите сумму',
                    labelText: 'Сумма',
                    errorText: _validateContact
                        ? 'Поле "Сумма" не должно быть пуста'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  bottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: Text(typeExcenses),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _validateType
                  ? Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: Text(
                        'Вы должны выбрать один из категрии',
                        style: AppTextStyles.body14w5
                            .copyWith(color: AppColors.red),
                      ),
                    )
                  : Text(''),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _descController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _priceController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          typeExcenses == 'Выберите категорию'
                              ? _validateType = true
                              : _validateType = false;
                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            typeExcenses != 'Выберите категорию') {
                          // print("Good Data Can Save");
                          var now = DateTime.now();
                          final DateFormat formatter = DateFormat('yyyy-MM-dd');
                          final String date = formatter.format(now);
                          var result = await _userService.saveData(
                              IncomeExpensesModel(
                                  type: typeExcenses,
                                  desc: _descController.text,
                                  price: double.parse(_priceController.text),
                                  datatime: monthReturned(date),
                                  isincome: widget.isTrue == true ? 1 : 0));
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Добавить')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _descController.text = '';
                        _priceController.text = '';
                      },
                      child: const Text('Очистить')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: typeExcensesList.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (_, index) => Center(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        typeExcenses = typeExcensesList[index];
                      });
                      Navigator.pop(context);
                    },
                    child: Text(typeExcensesList[index]))),
          ),
        );
      },
    );
  }
}

