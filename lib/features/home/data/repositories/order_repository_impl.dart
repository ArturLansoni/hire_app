import 'dart:async';

import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/features/home/data/datasources/order_datasource.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/entities/order_entity.dart';
import 'package:hire_app/features/home/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this.dataSource);
  final OrderDataSource dataSource;

  @override
  Future<OrderState> create({
    required String userId,
    required List<String> serviceIds,
    required String description,
    required DateTime date,
  }) async {
    try {
      await dataSource.createOrder(
        OrderEntity(
          date: date,
          userId: userId,
          description: description,
          serviceIds: serviceIds,
        ),
      );
      return const OrderState(AsyncStatus.success);
    } catch (_) {
      return const OrderState(AsyncStatus.error);
    }
  }
}
