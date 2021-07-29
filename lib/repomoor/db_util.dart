import 'dart:ffi';
import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:sqlite3/open.dart';

import 'assets/assets.dart';
import 'my_db.dart';

class DbUtil {
  static final DbUtil _instance = DbUtil._();
  DbUtil._();
  static DbUtil get instance => _instance;
  final db = MyDatabase(_constructDb());
}

LazyDatabase _constructDb({bool logStatements = false}) {
  _overrideForDb();
  return LazyDatabase(() async {
    var path = await AssetsMoorUtils.getDbPath();
    if (path != null) {
      return VmDatabase(File(path), logStatements: logStatements);
    } else {
      return VmDatabase.memory(logStatements: logStatements);
    }
  });
}

_overrideForDb() {
  var op;
  if (Platform.isLinux) {
    op = OperatingSystem.linux;
  }
  if (Platform.isWindows) {
    op = OperatingSystem.windows;
  }

  if (op != null) {
    var path = AssetsMoorUtils.getDbDriverPath();
    open.overrideFor(op, () => DynamicLibrary.open(path!));
  }
}
