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
        "CREATE TABLE mydb(id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT NOT NULL , desc TEXT NOT NULL, price REAL NOT NULL, datatime TEXT NOT NULL, isincome INTEGER NOT NULL)");
  }

//inserting data
  Future<IncomeExpensesModel> insert(
      IncomeExpensesModel incomeExpensesModel) async {
    var dbClient = await db;
    await dbClient?.insert('mydb', incomeExpensesModel.toMap());
    return incomeExpensesModel;
  }

  Future<List<IncomeExpensesModel>> getDataList() async {
    await db;
    final List<Map<String, dynamic>> queryResult =
        await _db!.rawQuery('SELECT * FROM mydb');
    return queryResult.map((e) => IncomeExpensesModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('mydb', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(IncomeExpensesModel incomeExpensesModel) async {
    var dbClient = await db;
    return await dbClient!.update('mydb', incomeExpensesModel.toMap(),
        where: 'id = ?', whereArgs: [incomeExpensesModel.id]);
  }
}
