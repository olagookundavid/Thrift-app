class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneno;
  String? profilepic;
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneno,
    this.profilepic,
  });

//
  factory User.fromJson(Map<String, dynamic> result) {
    return User(
      firstName: result['firstname'],
      lastName: result['lastname'],
      email: result['email'],
      phoneno: result['phone_no'],
      profilepic: result['profile_pic'],
    );
  }
}
