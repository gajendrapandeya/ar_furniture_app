import 'dart:io';

import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) => ProfileService(
    firestore: ref.read(firestoreProvider),
    firebaseStorage: ref.read(firebaseStorageProvider)));

class ProfileService with ErrorMixin {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  ProfileService({
    required FirebaseFirestore firestore,
    required FirebaseStorage firebaseStorage,
  })  : _firestore = firestore,
        _firebaseStorage = firebaseStorage;

  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<bool> updateProfilePicture({required File photo}) async {
    try {
      final ref = _firebaseStorage.ref('files/${photo.path}').child('users');
      await ref.putFile(photo);
      return true;
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
