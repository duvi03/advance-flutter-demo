
import 'package:demo/core/common/common_console.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  String storagePrefix;
  StorageService({
    required this.storagePrefix,
  }) : assert(storagePrefix != null);
  late GetStorage _storageBox;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _storageBox = GetStorage(storagePrefix);
    bool d = await _storageBox.initStorage;
    if (!d) {
      await GetStorage.init(storagePrefix);
    }
  }

  setKey<T>(String key, T value) async {
    // assert(T == Map || T == String || T == bool || T == double || T == int || T == num || T == List<dynamic>);
    Console.debug(value.runtimeType, key: "Value TYPE while setting key in run time");
    await _storageBox.write(key, value);
  }

  setCacheKey<T>(String key, T value) {
    _storageBox.write(key, value);
  }

  T? getKey<T>(String key) {
    Console.debug(_storageBox.read<T>(key), key: "Value ");
    return _storageBox.read<T>(key);
  }

  removeKey<T>(String key) async {
    await _storageBox.remove(key);
  }

  listenStorageBox(void Function() fn) {
    _storageBox.listen(fn);
  }

  listenKey(String key, void Function(dynamic value) fn) {
    _storageBox.listenKey(key, fn);
  }

  void clearStorageBox() {
    _storageBox.erase();
  }
}
