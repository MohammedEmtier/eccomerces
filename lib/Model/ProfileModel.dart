class ProfileModel {
  String name, email, pic;

  ProfileModel({this.name, this.email, this.pic});
  ProfileModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map['name'];
      email = map['email'];
      pic = map['pic'];
    }
  }
  toJson() {
    return {name: 'name', email: 'email', pic: 'pic'};
  }
}
