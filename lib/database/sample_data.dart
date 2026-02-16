import 'db_helper.dart';

class SampleData {
  static Future<void> insertInitialData() async {
    final db = await DBHelper.database;

    final existing = await db.query('category');
    if (existing.isNotEmpty) return;

    // CATEGORIES
    await db.insert('category', {'id': 1, 'name': 'Public Sector'});
    await db.insert('category', {'id': 2, 'name': 'Government'});
    await db.insert('category', {'id': 3, 'name': 'Cooperative'});

    // BANKS
    final banks = [
      [1, 'State Bank of India', 1, '1800 11 2211'],
      [2, 'Punjab National Bank', 1, '1800 180 2222'],
      [3, 'Bank of Baroda', 1, '1800 258 4455'],
      [4, 'Canara Bank', 1, '1800 425 0018'],
      [5, 'Bank of Maharashtra', 2, '1800 233 4526'],
      [6, 'IDBI Bank', 2, '1800 209 4324'],
      [7, 'Union Bank of India', 2, '1800 22 2244'],
      [8, 'Indian Bank', 2, '1800 425 0000'],
      [9, 'Saraswat Cooperative Bank', 3, '1800 222 999'],
      [10, 'Thane Bharat Sahakari Bank', 3, '022 2547 1234'],
      [11, 'Thane District Central Coop Bank', 3, '022 2539 5678'],
      [12, 'GS Mahanagar Coop Bank', 3, '022 2589 1111'],
    ];

    for (var b in banks) {
      await db.insert('bank', {
        'id': b[0],
        'name': b[1],
        'categoryId': b[2],
        'contact': b[3],
        'history': 'Complete banking services available.',
        'isBookmarked': 0, // ⭐ DEFAULT
      });
    }

    // INTEREST RATE, SCHEME, ACCOUNT, FEES, BRANCH (FOR ALL BANKS)
    for (int i = 1; i <= 12; i++) {
      await db.insert('interest_rate', {
        'id': i,
        'bankId': i,
        'savingsRate': '2.75%',
        'fdRate': '6.50-7.50%',
        'loanRate': '8.50-10.50%',
      });

      await db.insert('scheme', {
        'id': i,
        'bankId': i,
        'schemeName': 'General Banking Scheme',
        'description': 'Savings, loans, and government schemes.',
      });

      await db.insert('account_opening', {
        'id': i,
        'bankId': i,
        'documents': 'Aadhaar, PAN, Photo',
        'eligibility': 'Indian Resident',
        'minimumBalance': '₹500 - ₹3000',
      });

      await db.insert('fees', {
        'id': i,
        'bankId': i,
        'details': 'Quarterly maintenance and ATM charges apply.',
      });

      await db.insert('branch', {
        'id': i,
        'bankId': i,
        'address': 'Thane City Branch',
        'contact': '022-00000000',
      });
    }
  }
}
