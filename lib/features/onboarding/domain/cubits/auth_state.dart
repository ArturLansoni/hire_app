part of 'auth_cubit.dart';

final class AuthState extends AsyncState {
  const AuthState(
    AsyncStatus status, {
    this.user,
    this.error,
  }) : super(status: status);

  final UserEntity? user;
  final Failure? error;

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
