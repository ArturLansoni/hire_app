import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_app/core/infra/database/database_adapter.dart';

class FirestoreImpl implements DatabaseAdapter {
  FirestoreImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  FirebaseFirestore get instance => _firestore;

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
    String collection, {
    Query? query,
  }) async {
    final result = await (query ?? _firestore.collection(collection)).get();
    return result.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
  }

  @override
  Future<void> create(
    String collection, {
    required Map<String, dynamic> value,
  }) async {
    await _firestore.collection(collection).add(value);
  }

  @override
  Future<DocumentReference> getDocReference(
    String collection, {
    required String docID,
  }) async {
    final doc = await _firestore.collection(collection).doc(docID).get();
    return doc.reference;
  }
}
