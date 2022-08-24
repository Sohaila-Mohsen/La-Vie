import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cart(
        productId TEXT,
        quantity INTEGER
      )
      """);
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'cart.db',
      version: 2,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String productId, int? quantity) async {
    final db = await SQLHelper.db();

    final data = {'productId': productId, 'quantity': quantity};
    final id = await db.insert('cart', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("od : $id");
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('cart');
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(String productId) async {
    final db = await SQLHelper.db();
    final result =
        db.query('cart', where: "productId = ?", whereArgs: [productId]);
    print("rew : $result");
    return result;
  }

  // Update an item by id
  static Future<int> updateQuantity(String productId, int quantity) async {
    final db = await SQLHelper.db();

    final data = {'quantity': quantity};

    final result = await db
        .update('cart', data, where: "productId = ?", whereArgs: [productId]);
    print("rew : $result");
    return result;
  }

  // Delete
  static Future<void> deleteItem(String productId) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cart", where: "productId = ?", whereArgs: [productId]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> deleteItems() async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cart");
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
