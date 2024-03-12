part of 'auth_cubit.dart';

final class AuthState extends AsyncState {
  const AuthState(
    super.status, {
    super.error,
    this.user,
  });

  final UserEntity? user;
  AuthState copyWith({
    AsyncStatus? status,
    UserEntity? user,
    Failure? error,
  }) {
    return AuthState(
      status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, user, error];
}
