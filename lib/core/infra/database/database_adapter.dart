import 'package:cloud_firestore/cloud_firestore.dart';

typedef GetReference = Future<DocumentReference> Function(String id);

abstract interface class DatabaseAdapter {
  FirebaseFirestore get instance;
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
    String collection, {
    Query? query,
  });
  Future<void> create(
    String collection, {
    required Map<String, dynamic> value,
  });
  Future<DocumentReference> getDocReference(
    String collection, {
    required String docID,
  });
}

class FirestoreWhere {
  FirestoreWhere({
    required this.field,
    this.isGreaterThanOrEqualTo,
  });

  Object field;
  Object? isGreaterThanOrEqualTo;
}
