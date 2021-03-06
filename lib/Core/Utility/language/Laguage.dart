import 'package:get_storage/get_storage.dart';

class Language {
  void savetorageondisk(String language) async {
    await GetStorage().write('lang', language);
  }

  Future<String> get languageread async {
    return await GetStorage().read('lang');
  }
}
