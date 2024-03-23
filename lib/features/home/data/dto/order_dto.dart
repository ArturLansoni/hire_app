import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';
import 'package:hire_app/features/home/data/dto/service_dto.dart';
import 'package:hire_app/features/home/domain/entities/order_entity.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

extension OrderDTO on OrderEntity {
  static Future<OrderEntity> fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> firebaseOrder,
  ) async {
    final order = firebaseOrder.data()!;

    final services = <ServiceEntity>[];
    for (final serviceRef in order['services'] as List) {
      final serviceDoc = await (serviceRef as DocumentReference).get();
      services.add(
        ServiceDTO.fromFirebase(
          serviceDoc as DocumentSnapshot<Map<String, dynamic>>,
        ),
      );
    }

    return OrderEntity(
      id: firebaseOrder.id,
      date: (order['date'] as Timestamp).toDate(),
      description: order['description'] as String,
      userId: (order['userId'] as DocumentReference).id,
      services: services,
    );
  }

  Future<Map<String, dynamic>> toJson(
    GetReference getServiceReference,
    GetReference getUserReference,
  ) async {
    final serviceReferences = <DocumentReference>[];
    for (final service in services) {
      serviceReferences.add(await getServiceReference(service.id));
    }
    return {
      'userId': await getUserReference(userId),
      'services': serviceReferences,
      'description': description,
      'date': Timestamp.fromDate(date),
    };
  }
}
