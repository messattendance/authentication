class UserModel {
  String? uid;
  String? email;
  String? idnumber;

  UserModel({this.uid, this.email, this.idnumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      idnumber: map['idnumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'idnumber': idnumber,
    };
  }
}
