import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/address/model/address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressServiceProvider = Provider<AddressService>((ref) {
  return AddressService();
});

class AddressService with ErrorMixin {
  CollectionReference get _userCollection =>
      FirebaseFirestore.instance.collection(
        FirebaseConstants.usersCollection,
      );

  Future<bool> addAddress({required Address address}) async {
    try {
      await _userCollection
          .doc(address.userId)
          .collection(FirebaseConstants.addressCollection)
          .doc(address.userId)
          .set(
            address.toJson(),
          );
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> removeAddress({
    required String userId,
  }) async {
    try {
      await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.addressCollection)
          .doc(userId)
          .delete();
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<List<Address>> fetchAddresses(
      {required String addressType, required String userId}) async {
    try {
      QuerySnapshot snapshot = await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.addressCollection)
          .where('addressType', isEqualTo: addressType)
          .get();

      return snapshot.docs
          .map((doc) => Address.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      debugPrint('error: $error');
      throw handleError(error);
    }
  }
}
