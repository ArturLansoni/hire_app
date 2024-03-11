import 'package:hire_app/core/infra/database/collections.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';
import 'package:hire_app/features/home/data/datasources/order_datasource.dart';
import 'package:hire_app/features/home/data/dto/order_dto.dart';
import 'package:hire_app/features/home/domain/entities/order_entity.dart';

class FirestoreOrderDataSourceImpl implements OrderDataSource {
  FirestoreOrderDataSourceImpl(this.databaseAdapter);
  final DatabaseAdapter databaseAdapter;

  @override
  Future<List<OrderEntity>> getOrders() async {
    final result = await databaseAdapter.getAll(Collections.orders);
    final orders = <OrderEntity>[];
    for (final firebaseOrder in result) {
      orders.add(OrderDTO.fromFirebase(firebaseOrder));
    }
    return orders;
  }

  @override
  Future<void> createOrder(OrderEntity order) async {
    await databaseAdapter.create(Collections.orders, value: order.toJson());
  }
}
