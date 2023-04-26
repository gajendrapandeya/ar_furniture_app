import 'dart:io';

import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
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

  Future<String> updateProfilePicture({
    required File file,
    required String userId,
  }) async {
    try {
      debugPrint('file: $file');
      final ref = _firebaseStorage.ref();
      final imageName = file.path.split('/').last;
      debugPrint('imageName: $imageName');
      final imagesRef = ref.child('images/users/$imageName');
      await imagesRef.putFile(file);
      final downloadImageUrl = await imagesRef.getDownloadURL();
      await _userCollection.doc(userId).update({'photoUrl': downloadImageUrl});
      return downloadImageUrl;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<UserModel> updateUserDetail(
      {required Map<String, dynamic> userDetail,
      required String userId}) async {
    try {
      await _userCollection.doc(userId).update(userDetail);
      return await getUserData(userId: userId);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<UserModel> getUserData({required String userId}) async {
    try {
      final snapshot = await _userCollection.doc(userId).get();
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (error) {
      throw handleError(error);
    }
  }
}
