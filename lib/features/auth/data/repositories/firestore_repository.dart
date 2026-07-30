import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modern_high_school/features/auth/data/models/user_model.dart';
class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save User
  Future<void> saveUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
  }

  // Get User
  Future<UserModel?> getUser(String uid) async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .get();

    if (!doc.exists) {
      return null;
    }

    return UserModel.fromMap(doc.data()!);
  }
}