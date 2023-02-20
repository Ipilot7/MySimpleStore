import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/data/repositories/repository.dart';

class UserService{
  late Repository _repository;
  UserService(){
    _repository=Repository();
  }

  saveUser(IncomeExpensesModel income)async{
    return await _repository.inserData('table', income.toMap());
  }
}