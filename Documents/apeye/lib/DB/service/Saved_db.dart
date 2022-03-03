import 'package:apeye/DB/model/Saved_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SavedDatabase{
  static final SavedDatabase instance = SavedDatabase._init();

  static Database? _database;
  
  SavedDatabase ._init();

  Future<Database> get database async{
    if(_database != null)
      return _database!;
    
    _database = await _initDB('saved_content.db');
    return _database!;
    
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 5, onCreate: _creatDB);
  }

  Future _creatDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    await db.execute('drop table saved_content');
    final textType = 'TEXT NOT NULL';
    await db.execute('''
      CREATE TABLE $tableSaved (
        id INTEGER PRIMARY KEY,
        ${Saved_field.id} $idType,
        ${Saved_field.image} $textType,
        ${Saved_field.title} $textType,
        ${Saved_field.date} $textType,
        ${Saved_field.description} $textType,
      )'''
    );
    // String sql = 'CREATE TABLE saved_content(name, image, title, date, description)';
    // await db.execute(sql);
  }

  Future<Saved_content_model> create(Saved_content_model saved_content) async{
    final db = await instance.database;
    final json = saved_content.toJson();

    // final columns = '${Saved_field.image}, ${Saved_field.title}, ${Saved_field.date}, ${Saved_field.description}';
    // final values = '${json[Saved_field.image]}, ${json[Saved_field.title]}, ${json[Saved_field.date]}, ${json[Saved_field.description]}';

    // final id = await db.rawInsert('INSERT INTO saved_content ($columns) VALUES ($values)');

    final id = await db.insert(tableSaved, saved_content.toJson());
    print('***************'"");print(id);
    this.colse();
    return saved_content.copy(id: id);
  }

  Future<Saved_content_model> readContenet(int id) async{
    final db = await instance.database;

    final maps = await db.query(
      tableSaved,
      columns: Saved_field.values,
      where: '${Saved_field.id} = ? ',
      whereArgs: [id],
    );

    if(maps.isNotEmpty){
      return Saved_content_model.fromJson(maps.first);
    }
    else{
      throw Exception('name $id not found');
    }
  }

  Future<List<Saved_content_model>> readAllContent() async{
    final db = await instance.database;

    final orderBy = '${Saved_field.date} ASC';

    // final result = await db.rawQuery('SELECT * FROM $tableSaved ORDER BY $orderBy');

    final result = await db.query(tableSaved, orderBy: orderBy);
    // notifyListeners(); 
    return result.map((json) => Saved_content_model.fromJson(json)).toList();
    
  }

  Future<int> delete(int id) async{
    final db = await instance.database;

    return await db.delete(
      tableSaved,
      where: '${Saved_field.id} = ?',
      whereArgs: [id],
      );
  }

  Future colse() async{
    final db = await instance.database;

   db.close();
  }
  
}