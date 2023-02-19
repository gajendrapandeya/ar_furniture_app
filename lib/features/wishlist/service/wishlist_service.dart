import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishListServiceProvider = Provider(
  (ref) => WishListService(),
);

class WishListService with ErrorMixin {
  CollectionReference get _userCollection =>
      FirebaseFirestore.instance.collection(
        FirebaseConstants.usersCollection,
      );

  Future<bool> isInWishList(
      {required String userId, required String productId}) async {
    try {
      final result = await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.wishListCollection)
          .doc(productId)
          .get();
      return (result.exists);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> addToWishList(
      {required Product product, required String userId}) async {
    try {
      await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.wishListCollection)
          .doc(product.id)
          .set(
            product.toJson(),
          );
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> removeFromWishList({
    required String productId,
    required String userId,
  }) async {
    try {
      await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.wishListCollection)
          .doc(productId)
          .delete();
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<List<Product>> fetchProductsInWishList(
      {required String userId}) async {
    try {
      final snapshot = await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.wishListCollection)
          .get();

      return snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    } catch (error) {
      throw handleError(error);
    }
  }
}
