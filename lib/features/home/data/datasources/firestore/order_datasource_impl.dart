import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/core/infra/database/collections.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';
import 'package:hire_app/features/home/data/datasources/order_datasource.dart';
import 'package:hire_app/features/home/data/dto/order_dto.dart';
import 'package:hire_app/features/home/domain/entities/order_entity.dart';

class FirestoreOrderDataSourceImpl implements OrderDataSource {
  FirestoreOrderDataSourceImpl(this.databaseAdapter);
  final DatabaseAdapter databaseAdapter;

  @override
  Future<List<OrderEntity>> getOrders(String userId) async {
    final result = await databaseAdapter.getAll(
      Collections.orders,
      query: databaseAdapter.instance
          .collection(Collections.orders)
          .orderBy('date')
          .where(
            'date',
            isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime.now()),
          )
          .where(
            'userId',
            isEqualTo: await _getUserRef(userId),
          ),
    );
    final orders = <OrderEntity>[];
    for (final firebaseOrder in result) {
      orders.add(await OrderDTO.fromFirebase(firebaseOrder));
    }
    return orders;
  }

  @override
  Future<void> createOrder(OrderEntity order) async {
    await databaseAdapter.create(
      Collections.orders,
      value: await order.toJson(_getServiceRef, _getUserRef),
    );
  }

  Future<DocumentReference<Object?>> _getServiceRef(String serviceId) =>
      databaseAdapter.getDocReference(
        Collections.services,
        docID: serviceId,
      );

  Future<DocumentReference<Object?>> _getUserRef(String userId) =>
      databaseAdapter.getDocReference(
        Collections.users,
        docID: userId,
      );
}
