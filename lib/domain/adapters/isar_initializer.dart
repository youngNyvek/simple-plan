import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarInstance {
  final List<CollectionSchema<dynamic>> schemas;

  static Isar? _isar;

  Future<Isar> initialize(List<CollectionSchema<dynamic>> schemas) async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(schemas, directory: dir.path);
  }

  Future<Isar> get isar async {
    if (_isar != null) return _isar!;

    _isar = await initialize(schemas);
    return _isar!;
  }

  IsarInstance({required this.schemas});
}
