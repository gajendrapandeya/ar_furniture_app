import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/core/utils/firebase_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) => ProfileService(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(firebaseAuthProvider),
    ));

class ProfileService with ErrorMixin {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ProfileService({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<bool> updateProfilePicture({required String url}) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(url);
        return true;
      } else {
        throw CustomFirebaseException(
          failure: FirebaseFailure.unknown(
            message: 'User not found',
          ),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<UserModel> getUserData({required String userId}) async {
    try {
      final snapshot = await _userCollection.doc(userId).get();
      debugPrint('snapshot: ${snapshot.data()}');
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (error) {
      throw handleError(error);
    }
  }
}
