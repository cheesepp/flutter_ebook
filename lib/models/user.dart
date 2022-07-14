class User {
  String username = '';
  String phone = '';
  String uid = '';
  String email = '';
  String avatar = '';

  User(
      {required this.email,
      required this.phone,
      required this.avatar,
      required this.username,
      required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'],
        phone: json['phone'],
        username: json['username'],
        email: json['email'],
        avatar: json['avatar']);
  }

  Map toJson() {
    return {
      'uid': uid,
      'phone': phone,
      'username': username,
      'email': email,
      'avatar': avatar,
    };
  }
}
