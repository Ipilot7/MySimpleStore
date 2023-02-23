import 'package:flutter/material.dart';
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
  final _userService = IncomeService();

  @override
  void initState() {
    setState(() {
      _descController.text = widget.user.desc ?? '';
      _priceController.text = ((widget.user.price).toString());
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
                        });
                        if (_validateName == false &&
                            _validateContact == false) {
                          // print("Good Data Can Save");
                          var user = IncomeExpensesModel(
                            id: widget.user.id,
                            desc: _descController.text,
                            type: 'us',
                            isincome: widget.user.isincome,
                            datatime: widget.user.datatime,
                            price: double.parse(_priceController.text),
                          );
                          var result = await _userService.updateData(user);
                          Navigator.pop(context, result);
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
                      child: const Text('Очистить'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
