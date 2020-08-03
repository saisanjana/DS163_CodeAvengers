import 'package:sqflite/sqflite.dart' as sqf;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sqf.getDatabasesPath();
  
    return sqf.openDatabase(path.join(dbPath, 'reportspending.db'),
        onCreate: ( db, version) {
      print('creating');
      return  db.execute(
          'CREATE TABLE reports(id TEXT PRIMARY KEY, image TEXT,lat REAL,long REAL)');
    }, version: 1);
  }

  static Future<void> insert(
      String id, String imageLoc, double lat, double long) async {
    final sqlDb = await DBHelper.database();

    sqlDb.insert(
        'reports', {'id': id, 'image': imageLoc, 'lat': lat, 'long': long},
        conflictAlgorithm: sqf.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final sqlDb = await DBHelper.database();
    return sqlDb.query('reports');
  }

  static Future<void> delete() async {
    final dbPath = await sqf.getDatabasesPath();
    await sqf.deleteDatabase(path.join(dbPath, 'reportspending.db'));
  }
  static Future<void> update(Map<String,dynamic> mp)async{
    final key=mp['id'];
    final sqlDb = await DBHelper.database();
    await sqlDb.update('reportspending', mp,where: 'id=$key',whereArgs: key);
  }
}