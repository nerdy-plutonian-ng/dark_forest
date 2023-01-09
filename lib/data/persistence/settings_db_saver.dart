import 'package:dark_forest/data/persistence/app_settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/app_settings.dart';

class SettingsDbSaver implements AppSettings {
  static const dbName = 'darkForest.db';
  static const settingsTable = 'settings';
  static const idColumn = '_id';
  static const isDarkModeOnColumn = 'isDarkModeOn';
  static const settingsId = 'appSettingsId';
  final createAppSettingsTable = 'create table $settingsTable ('
      '$idColumn text primary key,'
      '$isDarkModeOnColumn integer not null'
      ')';
  final initialAppSettings = {
    idColumn: settingsId,
    isDarkModeOnColumn: 0,
  };

  @override
  Future<AppSettingsModel> getAppSettings() async {
    final db = await _openDB();
    final resultMap = (await db.query(
      settingsTable,
    ))
        .first;
    await db.close();
    return AppSettingsModel.fromJson(resultMap);
  }

  @override
  Future<bool> setAppSettings(AppSettingsModel appSettings) async {
    final db = await _openDB();
    final result = await db.update(settingsTable, appSettings.toJson(),
        where: '$idColumn = ?', whereArgs: [settingsId]);
    await db.close();
    return result > 0;
  }

  Future<Database> _openDB() async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);
    return await openDatabase(path, version: 1, singleInstance: true,
        onCreate: (db, version) async {
      await db.execute(createAppSettingsTable);
      await db.insert(settingsTable, initialAppSettings);
    });
  }
}
