import 'db_helper.dart';

class SampleData {

  static Future<void> insertInitialData() async {
    final db = await DBHelper.database;

    // 🔥 CLEAR ONLY BANK RELATED TABLES
    await db.delete('category');
    await db.delete('bank');
    await db.delete('bank_details');
    await db.delete('interest_rate');
    await db.delete('account_opening');
    await db.delete('fees');

    // ⚠ DO NOT DELETE USERS IN PRODUCTION
    // Uncomment below ONLY during testing
    // await db.delete('users');

    // =============================
    // INSERT CATEGORIES
    // =============================
    await db.insert('category', {'id': 1, 'name': 'Public Sector'});
    await db.insert('category', {'id': 2, 'name': 'Government Bank'});
    await db.insert('category', {'id': 3, 'name': 'Co-operative Bank'});

    // =============================
    // INSERT ALL 12 BANKS
    // =============================

    await _insertSBI(db);
    await _insertPNB(db);
    await _insertBOB(db);
    await _insertCanara(db);

    await _insertBankOfMaharashtra(db);
    await _insertIDBI(db);
    await _insertUnion(db);
    await _insertIndianBank(db);

    await _insertSaraswat(db);
    await _insertThaneBharat(db);
    await _insertTDCC(db);
    await _insertGSMahanagar(db);
  }

  // ==============================================
  // COMMON INSERT FUNCTION
  // ==============================================

  static Future<void> _insertBankData(
      db,
      String name,
      int categoryId,
      String basic,
      String rates,
      String schemes,
      String account,
      String feesText,
      String branch,
      String locator,
      String savingsRate,
      String fdRate,
      String loanRate,
      String minBalance,
      String feeDetails
      ) async {

    final bankId = await db.insert('bank', {
      'name': name,
      'categoryId': categoryId,
      'isBookmarked': 0
    });

    await db.insert('bank_details', {
      'bankId': bankId,
      'basic': basic,
      'rates': rates,
      'schemes': schemes,
      'account': account,
      'fees': feesText,
      'branch': branch,
      'branchLocator': locator
    });

    await db.insert('interest_rate', {
      'bankId': bankId,
      'savingsRate': savingsRate,
      'fdRate': fdRate,
      'loanRate': loanRate
    });

    await db.insert('account_opening', {
      'bankId': bankId,
      'minimumBalance': minBalance
    });

    await db.insert('fees', {
      'bankId': bankId,
      'details': feeDetails
    });
  }

  // ================= PUBLIC SECTOR =================

  static Future<void> _insertSBI(db) async {
    await _insertBankData(
        db,
        "State Bank of India",
        1,
        "Largest public sector bank. Established 1955. HQ Mumbai.",
        "Savings 2.7%-3%. FD 3.5%-7.5%. Loan 8.40%+",
        "Home, Education, Personal, Gold, Mudra loans.",
        "Savings, Current, Salary, NRI accounts.",
        "Debit ₹125-300. Processing 0.25%-0.5%",
        "22,000+ branches across India.",
        "https://sbi.co.in/web/home/locator/branch",
        "2.70%-3.00%",
        "3.5%-7.5%",
        "8.40%+",
        "Branch category based",
        "Debit ₹125-300"
    );
  }

  static Future<void> _insertPNB(db) async {
    await _insertBankData(
        db,
        "Punjab National Bank",
        1,
        "Established 1894. HQ New Delhi.",
        "Savings daily balance. FD senior +0.50%",
        "Housing, Education, Mudra, Gold loans.",
        "Savings, Women, Pensioner, NRE/NRO.",
        "Locker & processing charges apply.",
        "Pan India network.",
        "https://www.pnbindia.in/Branch-Locator.aspx",
        "2.75%-3.00%",
        "3.5%-7.25%",
        "8.40%+",
        "Metro/Urban based",
        "Processing charges"
    );
  }

  static Future<void> _insertBOB(db) async {
    await _insertBankData(
        db,
        "Bank of Baroda",
        1,
        "Established 1908. HQ Vadodara.",
        "Savings daily balance. FD tax saver available.",
        "Home, Gold, Mudra loans.",
        "Savings, Salary, NRE/NRO.",
        "Card & locker charges.",
        "International presence.",
        "https://www.bankofbaroda.in/locate-us/branch-locator",
        "3.00%",
        "3.5%-7.5%",
        "8.40%+",
        "Location based",
        "Processing & card charges"
    );
  }

  static Future<void> _insertCanara(db) async {
    await _insertBankData(
        db,
        "Canara Bank",
        1,
        "Established 1906. HQ Bengaluru.",
        "Savings slab based. FD tax saver.",
        "Housing, MSME, Mudra loans.",
        "Savings, Pensioner, NRI accounts.",
        "Admin & locker charges.",
        "Large branch network.",
        "https://canarabank.com/branch-locator",
        "3.00%",
        "3.5%-7.5%",
        "8.45%+",
        "Branch category based",
        "Admin charges"
    );
  }

  // ================= GOVERNMENT =================

  static Future<void> _insertBankOfMaharashtra(db) async {
    await _insertBankData(
        db,
        "Bank of Maharashtra",
        2,
        "Established 1935. HQ Pune.",
        "Savings 2.75%-4%. FD 7.75%.",
        "Home, MSME, Gold loans.",
        "Savings, Salary accounts.",
        "Debit ₹125-300.",
        "Strong Maharashtra presence.",
        "https://bankofmaharashtra.in/branch-locator",
        "2.75%-4.00%",
        "3.5%-7.75%",
        "8.40%+",
        "Category based",
        "Debit ₹125-300"
    );
  }

  static Future<void> _insertIDBI(db) async {
    await _insertBankData(
        db,
        "IDBI Bank",
        2,
        "Established 1964. HQ Mumbai.",
        "Savings 3%-4%. FD 7.75%.",
        "Home, LAP, Gold loans.",
        "Savings, Current accounts.",
        "Card ₹150-300.",
        "Pan India network.",
        "https://www.idbibank.in/idbi-bank-branches.aspx",
        "3.00%-4.00%",
        "3.0%-7.75%",
        "8.50%+",
        "Account type based",
        "Processing 0.25%-1%"
    );
  }

  static Future<void> _insertUnion(db) async {
    await _insertBankData(
        db,
        "Union Bank of India",
        2,
        "Established 1919. HQ Mumbai.",
        "Savings 2.75%-4%.",
        "Home, Gold, Mudra loans.",
        "Savings, Salary accounts.",
        "Debit ₹125-300.",
        "Large network.",
        "https://www.unionbankofindia.co.in/english/branch-locator.aspx",
        "2.75%-4.00%",
        "3.5%-7.75%",
        "8.40%+",
        "Branch category based",
        "Processing 0.25%-1%"
    );
  }

  static Future<void> _insertIndianBank(db) async {
    await _insertBankData(
        db,
        "Indian Bank",
        2,
        "Established 1907. HQ Chennai.",
        "Savings 2.75%-4%.",
        "Home, Gold, Mudra loans.",
        "Savings, Current accounts.",
        "Debit ₹125-300.",
        "Pan India network.",
        "https://www.indianbank.in/branch-locator/",
        "2.75%-4.00%",
        "3.5%-7.75%",
        "8.40%+",
        "Location based",
        "Processing 0.25%-1%"
    );
  }

  // ================= CO-OPERATIVE =================

  static Future<void> _insertSaraswat(db) async {
    await _insertBankData(
        db,
        "Saraswat Co-operative Bank",
        3,
        "Established 1918. HQ Mumbai.",
        "Savings 2.75%-4%. FD up to 8%.",
        "Home, Gold, MSME loans.",
        "Savings, Current accounts.",
        "Co-op norms apply.",
        "Mumbai & Maharashtra branches.",
        "https://www.saraswatbank.com/branch-locator",
        "2.75%-4.00%",
        "4.0%-8.0%",
        "8.50%+",
        "Account type based",
        "Co-op rules"
    );
  }

  static Future<void> _insertThaneBharat(db) async {
    await _insertBankData(
        db,
        "Thane Bharat Sahakari Bank",
        3,
        "Urban cooperative bank in Thane.",
        "Savings & FD policy based.",
        "Home, Gold, Business loans.",
        "Savings, Senior citizen accounts.",
        "ATM & service charges apply.",
        "Operates in Thane region.",
        "https://www.thanebharatbank.com/branch-network",
        "Policy based",
        "Policy based",
        "Policy based",
        "Minimum balance applicable",
        "Co-op norms"
    );
  }

  static Future<void> _insertTDCC(db) async {
    await _insertBankData(
        db,
        "Thane District Central Co-operative Bank",
        3,
        "District cooperative bank in Thane.",
        "Savings & agricultural loan rates policy based.",
        "Crop loans, Gold loans.",
        "Savings, Agricultural accounts.",
        "Service charges as per policy.",
        "Branches across Thane district.",
        "https://www.tdccbank.com/branch-network",
        "Policy based",
        "Policy based",
        "Policy based",
        "Minimum balance applicable",
        "Co-op service charges"
    );
  }

  static Future<void> _insertGSMahanagar(db) async {
    await _insertBankData(
        db,
        "G. S. Mahanagar Co-operative Bank",
        3,
        "Urban cooperative bank in Mumbai.",
        "Savings & FD policy based.",
        "Home, Gold, Business loans.",
        "Savings, Current accounts.",
        "Loan processing charges apply.",
        "Mumbai region branches.",
        "https://www.gsmahanagarbank.com/branch-network",
        "Policy based",
        "Policy based",
        "Policy based",
        "Minimum balance applicable",
        "Co-op banking charges"
    );
  }
}