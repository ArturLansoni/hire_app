import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';

abstract interface class OrderRepository {
  Future<OrderState> create({
    required String userId,
    required List<String> serviceIds,
    required String description,
    required DateTime date,
  });
}
