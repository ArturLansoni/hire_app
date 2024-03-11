import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class DatabaseAdapter {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getAll(
    String collection,
  );
  Future<void> create(
    String collection, {
    required Map<String, dynamic> value,
  });
}
