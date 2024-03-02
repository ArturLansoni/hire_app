part of 'login_cubit.dart';

sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccess extends LoginState {
  LoginSuccess({this.user});
  final UserEntity? user;

  @override
  List<Object?> get props => [user];
}

final class LoginError extends LoginState {
  LoginError(this.error);
  final Failure error;

  @override
  List<Object?> get props => [error];
}
