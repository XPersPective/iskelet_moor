import 'dart:io';

import 'package:iskelet_moore/repopath/srpath.dart';
import 'package:path_provider/path_provider.dart';

class AssetsMoorUtils {
  static final _inPath = SrPath.instance.current.join('lib').join('repomoor').join('assets');
  static Future<String?> getDbPath() async {
    if (Platform.isIOS || Platform.isAndroid) {
      var d = await getApplicationDocumentsDirectory();
      return MdPathResult(d.path).join('db.sqlite').path;
    }

    if (Platform.isLinux) return _inPath.join('linux').join('db.sqlite').path;

    if (Platform.isMacOS) return _inPath.join('macos').join('db.sqlite').path;

    if (Platform.isWindows) return _inPath.join('windows').join('db.sqlite').path;

    return null;
  }

  static String? getDbDriverPath() {
    if (Platform.isIOS || Platform.isAndroid) {
      return null;
    }
    final scriptDir = File(Platform.script.toFilePath()).parent;
    MdPathResult('scriptDir   :' + scriptDir.path);
    // final libraryNextToScript = File('${scriptDir.path}/lib/repomoore/sqlite3.dll');

    if (Platform.isLinux) return _inPath.join('linux').join('sqlite3.so').path;

    // if (Platform.isMacOS) return null ;SrPath.instance.current.getParentDir.join('macos');

    if (Platform.isWindows) return _inPath.join('windows').join('sqlite3.dll').path;

    return null;
  }
}
