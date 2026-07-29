import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser({
    required UserModel userModel,
    required String password,
  }) async {
    // Create user in Firebase Authentication
    UserCredential credential =
    await _auth.createUserWithEmailAndPassword(
      email: userModel.email,
      password: password,
    );

    // Get generated UID
    String uid = credential.user!.uid;

    // Create updated user model with Firebase UID
    UserModel newUser = UserModel(
      uid: uid,
      fullName: userModel.fullName,
      email: userModel.email,
      phone: userModel.phone,
      role: userModel.role,
      profileImage: userModel.profileImage,
      isActive: userModel.isActive,
      createdAt: userModel.createdAt,
      updatedAt: userModel.updatedAt,
    );

    // Save user in Firestore
    await _firestore
        .collection('users')
        .doc(uid)
        .set(newUser.toMap());
  }
}