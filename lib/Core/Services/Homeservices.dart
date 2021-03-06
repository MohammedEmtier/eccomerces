import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Products');
  Future<List<QueryDocumentSnapshot>> getcatogry() async {
    var value = await _collectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var val = await _collectionRef.get();
    return val.docs;
  }
}
