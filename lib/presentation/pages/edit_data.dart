import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/data/services/incomeService.dart';

class EditData extends StatefulWidget {
  final IncomeExpensesModel user;
  const EditData({Key? key, required this.user}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateType = false;
  // final _userService = IncomeService();
  String typeExcenses = '';

  @override
  void initState() {
    setState(() {
      _descController.text = widget.user.desc ?? '';
      _priceController.text = ((widget.user.price).toString());
      typeExcenses = widget.user.type ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Изменить данные"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Введите новую заметку',
                    labelText: 'Заметка',
                    errorText: _validateName
                        ? 'Поле "Заметка" не должно быть пуста'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Введите новую сумму',
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
                  // bottomSheet(context);
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
                            _validateContact == false) {
                          // print("Good Data Can Save");
                          var user = IncomeExpensesModel(
                            id: widget.user.id,
                            desc: _descController.text,
                            type: typeExcenses,
                            isincome: widget.user.isincome,
                            datatime: widget.user.datatime,
                            price: double.parse(_priceController.text),
                          );
                          
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Обновить')),
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
                    child: const Text('Очистить'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<dynamic> bottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     elevation: 10,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 200,
  //         child: ListView.separated(
  //           shrinkWrap: true,
  //           padding: EdgeInsets.symmetric(vertical: 10),
  //           itemCount: typeExcensesList.length,
  //           separatorBuilder: (context, index) => Divider(),
  //           itemBuilder: (_, index) => Center(
  //               child: GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       typeExcenses = typeExcensesList[index];
  //                     });
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(typeExcensesList[index]))),
  //         ),
  //       );
  //     },
  //   );
  // }
}
