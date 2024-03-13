import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/onboarding/domain/entities/user_entity.dart';
import 'package:hire_app/features/onboarding/domain/repositories/auth_repository.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(const AuthState(AsyncStatus.initial));

  final AuthRepository repository;

  void onLoad() {
    final result = repository.getCurrentUser();
    emit(result);
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: AsyncStatus.loading));

    final result = await repository.signIn(email, password);
    emit(result);
  }

  Future<void> signOut() async {
    if (state.isLoading) return;
    emit(state.copyWith(status: AsyncStatus.loading));

    final result = await repository.signOut();
    emit(result);
  }

  Future<void> register(
    String email,
    String password,
  ) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: AsyncStatus.loading));

    final result = await repository.create(email, password);
    emit(result);
  }
}
