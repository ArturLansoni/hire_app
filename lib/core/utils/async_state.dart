import 'package:equatable/equatable.dart';
import 'package:hire_app/core/utils/common_failures.dart';

enum AsyncStatus { initial, loading, success, error }

base class AsyncState extends Equatable {
  const AsyncState(
    this.status, {
    this.error,
  });

  final AsyncStatus status;
  final Failure? error;

  bool get isInitial => status == AsyncStatus.initial;
  bool get isLoading => status == AsyncStatus.loading;
  bool get isSuccess => status == AsyncStatus.success;
  bool get isError => status == AsyncStatus.error;

  @override
  List<Object?> get props => [status, error];
}
