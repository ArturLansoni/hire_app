import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/onboarding/domain/entities/user_entity.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(LoginInitial());

  final AuthRepository repository;

  void onLoad() {
    final result = repository.getCurrentUser();
    emit(result);
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    if (state is LoginLoading) return;
    emit(LoginLoading());

    final result = await repository.signIn(email, password);
    emit(result);
  }
}
