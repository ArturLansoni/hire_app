part of 'order_cubit.dart';

final class OrderState extends AsyncState {
  const OrderState(
    super.status, {
    super.error,
  });

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
