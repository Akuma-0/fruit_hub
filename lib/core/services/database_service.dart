abstract class DatabaseService {
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
    String? docId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  });
  Future<bool> isDataExists({
    required String path,
    required String docId,
  });
}
