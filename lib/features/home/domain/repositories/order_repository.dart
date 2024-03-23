import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

abstract interface class OrderRepository {
  Future<OrderState> create({
    required String userId,
    required List<ServiceEntity> services,
    required String description,
    required DateTime date,
  });
  Future<OrderState> getAll(String userId);
}
