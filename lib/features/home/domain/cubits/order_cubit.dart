import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/home/domain/repositories/order_repository.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({
    required this.auth,
    required this.repository,
  }) : super(const OrderState(AsyncStatus.initial));
  final AuthCubit auth;
  final OrderRepository repository;

  Future<void> createOrder({
    required List<String> serviceIds,
    required String description,
    required DateTime date,
  }) async {
    if (state.isLoading) return;
    emit(state.copyWith(status: AsyncStatus.loading));

    final result = await repository.create(
      userId: auth.state.user!.id,
      serviceIds: serviceIds,
      description: description,
      date: date,
    );
    emit(result);
  }
}
