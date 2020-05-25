import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> database() async {
  return openDatabase(
    // Set the path to the database.
    join(await getDatabasesPath(), 'doggie_database.db'),
// When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
// Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)",
      );
    },
// Set the version. This executes the onCreate function and provides a
// path to perform database upgrades and downgrades.
    version: 1,
  );
}
