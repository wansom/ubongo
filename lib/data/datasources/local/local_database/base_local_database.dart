
import 'package:hive/hive.dart';

abstract class BaseLocalDataSource<TableType, ModelType> {
  String? _boxName;
  late Future<Box<TableType>> boxInstance;

  BaseLocalDataSource({
      required String boxName,
  }) {
    _boxName = boxName;
  }

  void _init() {
    boxInstance = Hive.openBox(_boxName!);
  }

  Future<Box<TableType>> get getBoxInstance async => _openBox();

  Future<List<ModelType>> getFormattedData();

  Future<void> insertOrUpdateAll(List<ModelType> videos);

  Future<Box<TableType>> _openBox() async {
    final Box<TableType> box = await boxInstance;
    if (!box.isOpen) {
      _init();
      return boxInstance;
    }
    return box;
  }

  Future<TableType?> get(String key) async {
    final Box<TableType> box = await _openBox();
    return box.get(key);
  }

  Future<List<TableType>> getAll() async {
    final Box<TableType> box = await _openBox();
    return box.toMap().values.toList();
  }

  Future<void> put(String key, TableType value) async {
    final Box<TableType> box = await _openBox();
    await box.put(key, value);
  }

  Future<void> putAll(Map<String, TableType> items) async {
    final Box<TableType> box = await _openBox();
    await box.putAll(items);
  }

  Future<void> delete(String key) async {
    final Box<TableType> box = await _openBox();
    await box.delete(key);
  }

  Future<void> deleteAll() async {
    final Box<TableType> box = await _openBox();
    final List<String> boxKeys = await keys;
    await box.deleteAll(boxKeys);
  }

  Future<List<String>> get keys async {
    final Box<TableType> box = await _openBox();
    final List<String> result = box.keys.map((k) => k.toString()).toList();
    return result;
  }
}
