import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modern_high_school/features/auth/data/models/user_model.dart';

class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  // ===========================
  // Save User
  // ===========================
  Future<void> saveUser(UserModel user) async {
    await usersCollection.doc(user.uid).set(user.toMap());
  }

  // ===========================
  // Get User
  // ===========================
  Future<UserModel?> getUser(String uid) async {
    final doc = await usersCollection.doc(uid).get();

    if (!doc.exists) return null;

    return UserModel.fromMap(
      doc.data() as Map<String, dynamic>,
    );
  }

  // ===========================
  // Update User
  // ===========================
  Future<void> updateUser(UserModel user) async {
    await usersCollection.doc(user.uid).update(user.toMap());
  }

  // ===========================
  // Delete User
  // ===========================
  Future<void> deleteUser(String uid) async {
    await usersCollection.doc(uid).delete();
  }
}