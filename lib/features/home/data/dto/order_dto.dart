import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/features/home/domain/entities/order_entity.dart';

extension OrderDTO on OrderEntity {
  static OrderEntity fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> firebaseOrder,
  ) {
    final order = firebaseOrder.data()!;
    return OrderEntity(
      id: firebaseOrder.id,
      date: (order['date'] as Timestamp).toDate(),
      description: order['description'] as String,
      userId: (order['userId'] as DocumentReference).id,
      serviceIds: (order['serviceIds'] as List)
          .map((ref) => (ref as DocumentReference).id)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'serviceIds': serviceIds,
        'description': description,
        'date': Timestamp.fromDate(date),
      };
}
