import 'package:Harmik/Core/Utility/language/ar.dart';
import 'package:Harmik/Core/Utility/language/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
