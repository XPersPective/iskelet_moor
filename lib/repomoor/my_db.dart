import 'package:moor/moor.dart';
part 'my_db.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 6, max: 32)();

  //This is required for the moor_db_viewer. otherwise we won't be able to hide this table
  @JsonKey('body')
  TextColumn get content => text().named('body')();

  IntColumn get category => integer().nullable()();

  DateTimeColumn get date => dateTime()();

  BoolColumn get completed => boolean()();

  RealColumn get realColumn => real()();

  BlobColumn get blobColumn => blob()();
}

@DataClassName("User")
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  IntColumn get age => integer()();

  TextColumn get zipcode => text()();

  TextColumn get city => text()();

  TextColumn get adress1 => text()();

  TextColumn get adress2 => text()();

  TextColumn get country => text()();

  TextColumn get phone => text()();

  TextColumn get email => text()();
}

@UseMoor(tables: [Todos, Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
