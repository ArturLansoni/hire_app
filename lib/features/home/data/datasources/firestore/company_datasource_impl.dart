import 'package:hire_app/core/infra/database/collections.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';
import 'package:hire_app/features/home/data/datasources/company_datasource.dart';
import 'package:hire_app/features/home/data/dto/company_dto.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';

class FirestoreCompanyDataSourceImpl implements CompanyDataSource {
  FirestoreCompanyDataSourceImpl(this.databaseAdapter);
  final DatabaseAdapter databaseAdapter;

  @override
  Future<List<CompanyEntity>> getCompanies() async {
    final result = await databaseAdapter.getAll(Collections.companies);
    final companies = <CompanyEntity>[];
    for (final firebaseOrder in result) {
      companies.add(await CompanyDTO.fromFirebase(firebaseOrder));
    }
    return companies;
  }
}
