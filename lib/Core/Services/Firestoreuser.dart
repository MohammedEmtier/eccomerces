import 'package:Harmik/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  Future<void> storeuserdata(UserModel userModel) async {
    await collectionReference.doc(userModel.userid).set(userModel.toJson());
  }
}
