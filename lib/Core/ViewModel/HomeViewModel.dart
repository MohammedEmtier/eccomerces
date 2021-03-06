import 'package:Harmik/Core/Services/Homeservices.dart';
import 'package:Harmik/Model/ProductsModel.dart';
import 'package:Harmik/Model/categorymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  stt.SpeechToText _speech;

  bool _isListening = false;
  TextEditingController _controllere = TextEditingController();
  bool get isListening => _isListening;
  TextEditingController get controllere => _controllere;
  String _text = 'Press the button and start speaking';
  String get text => _text;
  double _confidence = 1.0;
  double get confidence => _confidence;

  ValueNotifier<bool> _isloading = ValueNotifier(false);

  ValueNotifier<bool> get isloading => _isloading;
  List<CategoryModel> _categorymodel = [];
  List<CategoryModel> get categorymodel => _categorymodel;

  List<ProductsModel> _productsModel = [];
  List<ProductsModel> get productsModel => _productsModel;

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }
  getCategory() async {
    _isloading.value = true;
    HomeServices().getcatogry().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categorymodel.add(CategoryModel.fromJson(value[i].data()));
        _isloading.value = false;
      }
      update();
    });
  }

  getBestSelling() async {
    _isloading.value = true;
    HomeServices().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(ProductsModel.fromJson(value[i].data()));
        _isloading.value = false;
      }

      update();
    });
  }

  void listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );

      if (available) {
        _isListening = true;
        update();
        _speech.listen(
          onResult: (val) {
            _controllere.text = val.recognizedWords;

            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
              update();
            }
          },
        );
      }
      update();
    } else {
      _isListening = false;
      _speech.stop();
      Get.back();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
  }
}
