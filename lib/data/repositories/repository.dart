import 'package:my_simple_store/data/data_providers/db_connector.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection=DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async{
    if(database!=null){
      return _database;
    }
    else {
      _database=await _databaseConnection.setDatabase();
      return _database;
    }
  }

  inserData(table, data)async{
    var connection=await database;
    return await connection?.insert(table, data);
  }

   readData(table)async{
    var connection=await database;
    return await connection?.query(table);
  }

  readDataById(table,itemId)async{
    var connection=await database;
    return await connection?.query(table,where: 'id=?', whereArgs: [itemId]);
  }

  updateData(table, data)async{
    var connection=await database;
    return await connection?.update(table, data,where: 'id=?', whereArgs: [data['id']]);
  }

  deleteDataById(table,itemId)async{
    var connection=await database;
    return await connection?.rawDelete('delete from $table where id=$itemId');
  }

  }