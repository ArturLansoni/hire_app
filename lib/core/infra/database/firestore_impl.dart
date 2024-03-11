import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';

class FirestoreImpl implements DatabaseAdapter {
  FirestoreImpl(this._firestore);
  final FirebaseFirestore _firestore;

  static const companiesCollection = 'companies';
  static const ordersCollection = 'orders';

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
    String collection,
  ) async {
    final result = await _firestore.collection(collection).get();
    return result.docs;
  }

  @override
  Future<void> create(
    String collection, {
    required Map<String, dynamic> value,
  }) async {
    await _firestore.collection(collection).add(value);
  }
}
