part of 'user_bloc.dart';

abstract class UserEvent {}

class UserEventLogin extends UserEvent {
  UserEventLogin({this.password, this.username});
  final String? username;
  final String? password;
}
