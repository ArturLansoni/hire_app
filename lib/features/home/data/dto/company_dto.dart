import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/features/home/data/dto/service_dto.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

extension CompanyDTO on CompanyEntity {
  static Future<CompanyEntity> fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> firebaseCompany,
  ) async {
    final company = firebaseCompany.data()!;

    final services = <ServiceEntity>[];
    for (final serviceRef in company['services'] as List) {
      final serviceDoc = await (serviceRef as DocumentReference).get();
      services.add(
        ServiceDTO.fromFirebase(
          serviceDoc as DocumentSnapshot<Map<String, dynamic>>,
        ),
      );
    }

    return CompanyEntity(
      id: firebaseCompany.id,
      name: company['name'] as String,
      category: company['category'] as String,
      location: company['location'] as String,
      imageURL: company['imageURL'] as String,
      rating: company['rating'] as double,
      services: services,
    );
  }
}
