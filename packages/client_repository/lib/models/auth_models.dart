class AuthModels {
  final String? token;

  AuthModels({this.token});

  factory AuthModels.fromJson(Map<String, dynamic> json) =>
      AuthModels(token: json['token']);

  Map<String, dynamic> toJson() => {'token': token};
}
