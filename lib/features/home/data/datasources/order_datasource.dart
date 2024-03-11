import 'package:hire_app/features/home/domain/entities/order_entity.dart';

abstract interface class OrderDataSource {
  Future<List<OrderEntity>> getOrders();
  Future<void> createOrder(OrderEntity order);
}
