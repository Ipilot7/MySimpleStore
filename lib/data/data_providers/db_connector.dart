import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection{
  Future<Database> setDatabase()async{
    var directory =await getApplicationDocumentsDirectory();
    var path =join(directory.path,'income');
    var database=await openDatabase(path,version: 1, onCreate: _createFatabase);
    return database;
  }

  Future<void> _createFatabase(Database database, int version)async{
    String sql= "CREATE TABLE income(id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT NOT NULL , desc TEXT NOT NULL, price REAL NOT NULL, datatime TEXT NOT NULL, isincome INTEGER NOT NULL)";
    await database.execute(sql);
  }

}