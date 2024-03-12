import 'dart:async';

import 'package:hire_app/core/utils/async_state.dart';
import 'package:hire_app/features/home/data/datasources/company_datasource.dart';
import 'package:hire_app/features/home/domain/cubits/home_cubit.dart';
import 'package:hire_app/features/home/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  CompanyRepositoryImpl(this.dataSource);
  final CompanyDataSource dataSource;

  @override
  Future<HomeState> getCompanies() async {
    try {
      final companies = await dataSource.getCompanies();
      return HomeState(AsyncStatus.success, companies: companies);
    } catch (_) {
      return const HomeState(AsyncStatus.error);
    }
  }
}
