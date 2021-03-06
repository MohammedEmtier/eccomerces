import 'package:Harmik/Model/CartProductModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableUser = 'cartProduct';
final String columnimage = 'image';
final String columnprice = 'price';
final String columtitle = 'title';
final String columnquantity = 'quantity';
final String columnproductid = 'userid';

class CartDatabasehelper {
  CartDatabasehelper._();
  static final CartDatabasehelper db = CartDatabasehelper._();
  static Database _dataBase;
  Future<Database> get database async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await initDb();
    return _dataBase;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "Harmik_db.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tableUser(
          $columnimage TEXT NOT NULL,
          $columnprice TEXT NOT NULL,
          $columtitle TEXT NOT NULL,
          $columnproductid TEXT NOT NULL,
          $columnquantity INTEGER NOT NULL)
          ''');
      },
    );
  }

//CRUD
  Future<void> insert(CartProductModel user) async {
    var dbClient = await database;
    await dbClient.insert(tableUser, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(CartProductModel user) async {
    var dpc = await database;
    await dpc.update(tableUser, user.toJson(),
        where: '$columnproductid=?', whereArgs: [user.userid]);
  }

  Future<CartProductModel> getuser(String username) async {
    var dpc = await database;
    List<Map> maps = await dpc
        .query(tableUser, where: '$columnproductid=?', whereArgs: [username]);
    if (maps.length > 0) {
      return CartProductModel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<CartProductModel>> getalluser() async {
    var dpc = await database;
    List<Map> maps = await dpc.query(tableUser);
    return maps.isNotEmpty
        ? maps.map((e) => CartProductModel.fromJson(e)).toList()
        : [];
  }

  Future<void> delete(String username) async {
    var dpc = await database;
    await dpc
        .delete(tableUser, where: '$columnproductid=?', whereArgs: [username]);
  }
}
