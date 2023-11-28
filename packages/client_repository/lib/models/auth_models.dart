// To parse this JSON data, do
//
//     final authModels = authModelsFromJson(jsonString);

import 'dart:convert';

AuthModels authModelsFromJson(String str) => AuthModels.fromJson(json.decode(str));

String authModelsToJson(AuthModels data) => json.encode(data.toJson());

class AuthModels {
    final int? id;
    final String? username;
    final String? email;
    final String? firstName;
    final String? lastName;
    final String? gender;
    final String? image;
    final String? token;

    AuthModels({
        this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.gender,
        this.image,
        this.token,
    });

    factory AuthModels.fromJson(Map<String, dynamic> json) => AuthModels(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
    };
}

