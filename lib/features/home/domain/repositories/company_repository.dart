import 'package:hire_app/features/home/domain/cubits/home_cubit.dart';

abstract interface class CompanyRepository {
  Future<HomeState> getCompanies();
}
