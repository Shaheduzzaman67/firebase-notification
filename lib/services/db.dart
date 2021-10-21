import 'dart:async';
import 'package:firebase_push_notification/models/notification.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {

	static Database? _db;

	static int get _version => 1;

	static Future<void> init() async {

		if (_db != null) { return; }

		try {
			String _path = await getDatabasesPath() + 'notification';
			_db = await openDatabase(_path, version: _version, onCreate: onCreate);
		}
		catch(ex) { 
			print(ex);
		}
	}

	static void onCreate(Database db, int version) async =>
		await db.execute('CREATE TABLE notifications (id INTEGER PRIMARY KEY NOT NULL, title STRING, body STRING)');

	static Future<List<Map<String, dynamic>>> query(String table) async => _db!.query(table);

	static Future<int> insert(String table, PushNotification model) async =>
		await _db!.insert(table, model.toMap());
}