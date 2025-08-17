import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

class FirestoreService extends DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
    String? docId,
  }) async {
    if (docId != null)
      await firestore.collection(path).doc(docId).set(data);
    else
      await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  }) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.data()!;
  }

  @override
  Future<bool> isDataExists({
    required String path,
    required String docId,
  }) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
