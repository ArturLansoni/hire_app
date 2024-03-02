part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState extends Equatable {
  const AuthState(
    this.status, {
    this.user,
    this.error,
  });

  final AuthStatus status;
  final UserEntity? user;
  final Failure? error;

  bool get isInitial => status == AuthStatus.initial;
  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isError => status == AuthStatus.error;

  AuthState copyWith({
    AuthStatus? status,
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
