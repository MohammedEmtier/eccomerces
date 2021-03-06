import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userid, email, pic, name;
  Timestamp time;
  UserModel({this.userid, this.email, this.pic, this.name, this.time});
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userid = map['userid'];
    email = map['email'];
    pic = map['pic'];
    name = map['name'];
    time = map['time'];
  }
  toJson() {
    return {
      'email': email,
      'pic': pic,
      'name': name,
      'userid': userid,
      'time': time,
    };
  }
}
