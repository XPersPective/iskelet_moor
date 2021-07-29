import 'package:path/path.dart' as p;

class SrPath {
  static final _instance = SrPath._();
  SrPath._();

  static SrPath get instance => _instance;

  MdPathResult toPath(String path) => MdPathResult(p.join(path));
  MdPathResult join(String path, String other) => MdPathResult(p.join(path, other));
  MdPathResult get current => MdPathResult(p.current);
}

class MdPathResult {
  final String path;
  MdPathResult(this.path) {
    print('Path: ' + path);
  }
  //  join('path', 'to' ); // -> 'path/to'
  MdPathResult join(String other) => SrPath.instance.join(path, other);

  ///getParentDir('path/to/foo.dart'); // -> path: 'path/to'
  ///getParentDir('path/to');          // -> path:  'path'
  MdPathResult get getParentDir => MdPathResult(p.dirname(path));
}
