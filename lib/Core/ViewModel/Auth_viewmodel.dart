import 'package:Harmik/Core/Services/Firestoreuser.dart';
import 'package:Harmik/Model/UserModel.dart';
import 'package:Harmik/View/controlView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String email, password, username;
  Color inactiveColor = Colors.black;
  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  File _image;
  final picker = ImagePicker();
  File get image => _image;
  bool _isloading = false;

  bool get isloading => _isloading;
  bool _obscure = false;

  bool get obscure => _obscure;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleAuth() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _firebaseAuth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  void facebookAuth() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    _facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
    FacebookAccessToken accesstoken = result.accessToken;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final facecredential = FacebookAuthProvider.credential(accesstoken.token);
      await _firebaseAuth.signInWithCredential(facecredential).then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    }
  }

  void signIn() async {
    try {
      _isloading = true;
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.TOP);
    }
    _isloading = false;
    update();
  }

  void signUp() async {
    try {
      _isloading = true;
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) => saveUser(user));

      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.TOP);
    }
    _isloading = false;
    update();
  }

  void saveUser(UserCredential user) async {
    final userd = FirebaseAuth.instance.currentUser;
    final ref = FirebaseStorage.instance
        .ref()
        .child("profile_Image")
        .child(userd.uid + 'jpg');
    await ref.putFile(_image);
    final url = await ref.getDownloadURL();
    await FireStoreUser().storeuserdata(UserModel(
        time: Timestamp.now(),
        userid: user.user.uid,
        email: user.user.email,
        pic: url,
        name: username == null ? user.user.displayName : username));
  }

  void obscsure() {
    if (_obscure == true) {
      _obscure = false;
    }
    if (_obscure == false) {
      _obscure = true;
    }
    update();
  }

  Future addphoto(ImageSource src) async {
    final ss = await picker.getImage(source: src, imageQuality: 65);
    if (ss != null) {
      _image = File(ss.path);
      update();
    }
    update();
  }
}
