part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState(
      {this.authModels, this.status = StatusState.init, this.message});
  final AuthModels? authModels;
  final StatusState status;
  final String? message;

  UserState copyWith({
    AuthModels? authModels,
    StatusState? status,
    String? message,
  }) {
    return UserState(
        authModels: authModels ?? this.authModels,
        status: status ?? this.status,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [authModels, status, message];
}
