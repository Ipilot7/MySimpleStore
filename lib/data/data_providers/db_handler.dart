import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;


class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'myDayly.db');
    var db = await openDatabase(path, version: 1, onCreate: _createFatabase);
    return db;
  }

  _createFatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE myDayly(id INTEGER PRIMARY KEY AUTOINKREMENT, type TEXT NOT NULL , desc TEXT NOT NULL, price REAL NOT NULL, datatime TEXT NOT NULL, isincome INTEGER NOT NULL, price INTEGER NOT NULL)");
  }

//inserting data
  Future<IncomeExpensesModel> insert(
      IncomeExpensesModel incomeExpensesModel) async {
    var dbClient = await db;
    await dbClient?.insert('myDayly', incomeExpensesModel.toJson());
    return incomeExpensesModel;
  }

  Future<List<IncomeExpensesModel Function(Map<String, dynamic> json)>>
      getDataList() async {
    await db;
    final List<Map<String, Object?>> queryResult =
        await _db!.rawQuery('SELECT * FROM myDayly');
    return queryResult.map((e) => IncomeExpensesModel.fromJson).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('myDauly', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(IncomeExpensesModel incomeExpensesModel) async {
    var dbClient = await db;
    return await dbClient!.update('myDayly', incomeExpensesModel.toJson(),
        where: 'id = ?', whereArgs: [incomeExpensesModel.id]);
  }
}
