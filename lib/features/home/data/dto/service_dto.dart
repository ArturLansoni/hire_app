import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';

extension ServiceDTO on ServiceEntity {
  static ServiceEntity fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> firebaseService,
  ) {
    final service = firebaseService.data()!;
    return ServiceEntity(
      id: firebaseService.id,
      name: service['name'] as String,
      finalRange: (service['finalRange'] as int).toDouble(),
      initialRange: (service['initialRange'] as int).toDouble(),
      imagesURL: (service['imagesURL'] as List)
          .map((ref) => (ref as DocumentReference).id)
          .toList(),
    );
  }
}
