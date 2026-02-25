import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'bankmate.db');

    return await openDatabase(
      path,
      version: 2, // ⬅ upgraded version
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // 🔥 CREATE ALL TABLES
  static Future<void> _onCreate(Database db, int version) async {

    // CATEGORY TABLE
    await db.execute('''
      CREATE TABLE category(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    // BANK TABLE
    await db.execute('''
      CREATE TABLE bank(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        categoryId INTEGER,
        isBookmarked INTEGER DEFAULT 0,
        FOREIGN KEY (categoryId) REFERENCES category(id)
      )
    ''');

    // 🔥 BANK DETAILS TABLE (NEW STRUCTURE)
    await db.execute('''
      CREATE TABLE bank_details(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bankId INTEGER,
        basic TEXT,
        rates TEXT,
        schemes TEXT,
        account TEXT,
        fees TEXT,
        branch TEXT,
        branchLocator TEXT,
        FOREIGN KEY (bankId) REFERENCES bank(id)
      )
    ''');

    // INTEREST RATE TABLE (for comparison screen)
    await db.execute('''
      CREATE TABLE interest_rate(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bankId INTEGER,
        savingsRate TEXT,
        fdRate TEXT,
        loanRate TEXT,
        FOREIGN KEY (bankId) REFERENCES bank(id)
      )
    ''');

    // ACCOUNT OPENING TABLE
    await db.execute('''
      CREATE TABLE account_opening(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bankId INTEGER,
        minimumBalance TEXT,
        FOREIGN KEY (bankId) REFERENCES bank(id)
      )
    ''');

    // FEES TABLE
    await db.execute('''
      CREATE TABLE fees(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bankId INTEGER,
        details TEXT,
        FOREIGN KEY (bankId) REFERENCES bank(id)
      )
    ''');
  }

  // 🔥 HANDLE DATABASE UPGRADE SAFELY
  static Future<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {

    if (oldVersion < 2) {

      // Create bank_details if not exists
      await db.execute('''
        CREATE TABLE IF NOT EXISTS bank_details(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          bankId INTEGER,
          basic TEXT,
          rates TEXT,
          schemes TEXT,
          account TEXT,
          fees TEXT,
          branch TEXT,
          branchLocator TEXT,
          FOREIGN KEY (bankId) REFERENCES bank(id)
        )
      ''');
    }
  }

  // 🔥 CLEAR DATABASE (Optional Utility)
  static Future<void> deleteDatabaseFile() async {
    final path = join(await getDatabasesPath(), 'bankmate.db');
    await deleteDatabase(path);
  }
}