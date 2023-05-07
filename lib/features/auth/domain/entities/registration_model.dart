class RegistrationModel {
  String? username;
  String? lastname;
  String? email;
  String? password;

  RegistrationModel({this.username, this.lastname, this.email, this.password});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
