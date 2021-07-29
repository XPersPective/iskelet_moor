// import 'package:moor/moor.dart';
// import 'package:moor/ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'dart:io';

// // assuming that your file is called filename.dart. This will give an error at first,
// // but it's needed for moor to know about the generated code

// part 'mooredatabase.g.dart';

// class Todos extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get title => text().withLength(min: 6, max: 32)();
//   TextColumn get content => text().named('body')();
//   IntColumn get category => integer().nullable()();
// }

// // This will make moor generate a class called "Category" to represent a row in this table.
// // By default, "Categorie" would have been used because it only strips away the trailing "s"
// // in the table name.
// @DataClassName("Category")
// class Categories extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get description => text()();
// }

// // Database constructDb({bool logStatements = false}) {
// //   if (Platform.isIOS || Platform.isAndroid) {
// //     final executor = LazyDatabase(() async {
// //       final dataDir = await paths.getApplicationDocumentsDirectory();
// //       final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
// //       return VmDatabase(dbFile, logStatements: logStatements);
// //     });
// //     return Database(executor);
// //   }
// //   if (Platform.isMacOS || Platform.isLinux) {
// //     final file = File('db.sqlite');
// //     return Database(VmDatabase(file, logStatements: logStatements));
// //   }
// //   // if (Platform.isWindows) {
// //   //   final file = File('db.sqlite');
// //   //   return Database(VMDatabase(file, logStatements: logStatements));
// //   // }
// //   return Database(VmDatabase.memory(logStatements: logStatements));
// // }

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }

// @UseMoor(tables: [Todos, Categories])
// class MyDatabase extends _$MyDatabase {
//   // we tell the database where to store the data with this constructor
//   MyDatabase() : super(_openConnection());

//   // you should bump this number whenever you change or add a table definition. Migrations
//   // are covered later in this readme.
//   @override
//   int get schemaVersion => 1;

//   // loads all todo entries
//   Future<List<Todo>> get allTodoEntries => select(todos).get();


//   Future<List<Todo>> limitTodos(int limit, {int? offset}) {
//     return (select(todos)..limit(limit, offset: offset)).get();
//   }

//   Future<List<Todo>> sortEntriesAlphabetically() {
//     return (select(todos)..   orderBy([(t) => OrderingTerm(expression: t.title)])).get();
//   }

//   Stream<Todo> entryById(int id) {
//     return (select(todos)..where((t) => t.id.equals(id))).watchSingle();
//   }

 
 

// Future feelingLazy() {
//   // delete the oldest nine tasks
//   return (delete(todos)..  where((t) => t.id.isSmallerThanValue(10))).go();
// }
// }
 
// class DbUtil {
//   static MyDatabase? _db;

//   static MyDatabase get db {
//     if (_db == null) {
//       _db = MyDatabase();
//     }
//     return _db!;
//   }
// }