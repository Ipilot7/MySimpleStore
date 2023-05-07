class SignInResultModel {
  String? sId;
  String? username;
  String? lastname;
  String? email;
  String? token;

  SignInResultModel(
      {this.sId, this.username, this.lastname, this.email, this.token});

  SignInResultModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    lastname = json['lastname'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
