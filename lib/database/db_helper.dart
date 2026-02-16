import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bankmate.db');

    return await openDatabase(
      path,
      version: 4, // 🔴 UPDATED VERSION
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE IF EXISTS category');
        await db.execute('DROP TABLE IF EXISTS bank');
        await db.execute('DROP TABLE IF EXISTS interest_rate');
        await db.execute('DROP TABLE IF EXISTS scheme');
        await db.execute('DROP TABLE IF EXISTS account_opening');
        await db.execute('DROP TABLE IF EXISTS fees');
        await db.execute('DROP TABLE IF EXISTS branch');
        await _createTables(db);
      },
    );
  }

  static Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE category (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE bank (
        id INTEGER PRIMARY KEY,
        name TEXT,
        categoryId INTEGER,
        contact TEXT,
        history TEXT,
        isBookmarked INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE interest_rate (
        id INTEGER PRIMARY KEY,
        bankId INTEGER,
        savingsRate TEXT,
        fdRate TEXT,
        loanRate TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE scheme (
        id INTEGER PRIMARY KEY,
        bankId INTEGER,
        schemeName TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE account_opening (
        id INTEGER PRIMARY KEY,
        bankId INTEGER,
        documents TEXT,
        eligibility TEXT,
        minimumBalance TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE fees (
        id INTEGER PRIMARY KEY,
        bankId INTEGER,
        details TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE branch (
        id INTEGER PRIMARY KEY,
        bankId INTEGER,
        address TEXT,
        contact TEXT
      )
    ''');
  }
}
