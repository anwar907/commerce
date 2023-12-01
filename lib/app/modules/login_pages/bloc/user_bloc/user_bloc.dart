import 'package:client_repository/client_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/status_state.dart';
import 'package:user_repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserState()) {
    on<UserEventLogin>(authUser);
  }

  final UserRepository _userRepository;

  Future<void> authUser(UserEventLogin event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: StatusState.loading));

      final data = await _userRepository.auth(
          event.username ?? '', event.password ?? '');

      emit(state.copyWith(authModels: data, status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure, message: e.toString()));
    }
  }
}
