import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/profile/saved_cards/model/cart_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardServiceProvider = Provider<CardService>((ref) {
  return CardService(firestore: ref.read(firestoreProvider));
});

class CardService with ErrorMixin {
  final FirebaseFirestore _firestore;

  CardService({required FirebaseFirestore firestore}) : _firestore = firestore;

  CollectionReference get _usersCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<void> saveCard(
      {required CardDetail cardDetail, required String userId}) async {
    try {
      debugPrint('card: $cardDetail');
      await _usersCollection
          .doc(userId)
          .collection(FirebaseConstants.cardsCollection)
          .doc(cardDetail.id)
          .set(cardDetail.toJson());
    } catch (error) {
      debugPrint('SaveCardError: $error');
      handleError(error);
    }
  }

  Future<List<CardDetail>> fetchSavedCards({required String userId}) async {
    try {
      final snapShot = await _usersCollection
          .doc(userId)
          .collection(FirebaseConstants.cardsCollection)
          .get();

      return snapShot.docs.map((doc) {
        return CardDetail.fromJson(doc.data());
      }).toList();
    } catch (error) {
      throw handleError(error);
    }
  }
}
