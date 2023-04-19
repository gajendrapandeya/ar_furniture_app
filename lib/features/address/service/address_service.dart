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

  Future<bool> addAddress({
    required Address address,
    required String userId,
  }) async {
    try {
      await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.addressCollection)
          .doc(address.id)
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
      final CollectionReference<Map<String, dynamic>> addressCollection =
          _userCollection
              .doc(userId)
              .collection(FirebaseConstants.addressCollection);

      final QuerySnapshot<Map<String, dynamic>> addressSnapshot =
          await addressCollection.get();

      if (addressSnapshot.docs.isEmpty) {
        return [];
      }

      final List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDocs;
      if (addressType.isEmpty) {
        filteredDocs = addressSnapshot.docs;
      } else {
        filteredDocs = addressSnapshot.docs
            .where((doc) => doc.data()['addressType'] == addressType)
            .toList();
      }

      return filteredDocs.map((doc) => Address.fromJson(doc.data())).toList();
    } catch (error) {
      debugPrint('error: $error');
      throw handleError(error);
    }
  }
}
