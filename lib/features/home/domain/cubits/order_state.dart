part of 'order_cubit.dart';

final class OrderState extends AsyncState {
  const OrderState(
    AsyncStatus status, {
    this.error,
  }) : super(status: status);
  final Failure? error;

  OrderState copyWith({
    AsyncStatus? status,
    Failure? error,
  }) {
    return OrderState(
      status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
