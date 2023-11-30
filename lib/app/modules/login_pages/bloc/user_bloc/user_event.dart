part of 'user_bloc.dart';

abstract class UserEvent {}

class UserEventLogin extends UserEvent {
  UserEventLogin(this.paassword, this.usernaame);
  final String usernaame;
  final String paassword;
}
