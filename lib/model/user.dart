class User {
  User({this.token, this.refreshToken});

  factory User.fromJson(Map<String, dynamic> data) => User(
        token: data['token'],
        refreshToken: data['refreshToken'],
      );

  String? token;
  String? refreshToken;
}
