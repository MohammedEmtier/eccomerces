import 'package:Harmik/Model/ProfileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileViewModel extends GetxController {
  bool isloading = false;
  String _username;
  final _user = FirebaseAuth.instance.currentUser;
  User get user => _user;
  String get username => _username;
  List<ProfileModel> _profileinfo = [];
  List<ProfileModel> get profileinfo => _profileinfo;
  static const _url = 'https://policies.google.com/privacy?hl=en-US';

  void launchURL() async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    update();
  }

  getprofileinfo() async {
    isloading = true;
    final user = FirebaseAuth.instance.currentUser;
    // ignore: unused_local_variable
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      ProfileModel.fromJson(value.data());
      isloading = false;
    });

    update();
  }
}
