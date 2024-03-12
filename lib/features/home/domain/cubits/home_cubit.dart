import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/core/utils/common_failures.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/domain/repositories/company_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(const HomeState(AsyncStatus.initial));
  final CompanyRepository repository;

  Future<void> onLoad() async {
    if (state.isLoading) return;
    emit(state.copyWith(status: AsyncStatus.loading));
    final result = await repository.getCompanies();
    emit(result);
  }
}
