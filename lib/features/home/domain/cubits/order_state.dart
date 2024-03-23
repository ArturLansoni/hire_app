part of 'order_cubit.dart';

final class OrderState extends AsyncState {
  const OrderState(
    super.status, {
    super.error,
    this.orders,
  });

  final List<OrderEntity>? orders;

  OrderState copyWith({
    AsyncStatus? status,
    Failure? error,
    List<OrderEntity>? orders,
  }) {
    return OrderState(
      status ?? this.status,
      error: error ?? this.error,
      orders: orders ?? this.orders,
    );
  }

  @override
  List<Object?> get props => [status, error, orders];
}
