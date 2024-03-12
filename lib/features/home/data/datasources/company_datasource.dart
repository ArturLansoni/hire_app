import 'package:hire_app/features/home/domain/entities/company_entity.dart';

abstract interface class CompanyDataSource {
  Future<List<CompanyEntity>> getCompanies();
}
