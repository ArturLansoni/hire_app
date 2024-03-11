import 'package:equatable/equatable.dart';

enum AsyncStatus { initial, loading, success, error }

base class AsyncState extends Equatable {
  const AsyncState({required this.status});

  final AsyncStatus status;

  bool get isInitial => status == AsyncStatus.initial;
  bool get isLoading => status == AsyncStatus.loading;
  bool get isSuccess => status == AsyncStatus.success;
  bool get isError => status == AsyncStatus.error;

  @override
  List<Object?> get props => [status];
}
