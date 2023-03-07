import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/cart/model/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartService with ErrorMixin {
  static final CartService instance = CartService._internal();

  CartService._internal();

  CollectionReference get _userCollection =>
      FirebaseFirestore.instance.collection(FirebaseConstants.usersCollection);

  Future<bool> isProductAlreadyInCart({
    required String cartId,
    required String userId,
  }) async {
    try {
      final result = await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.cartCollection)
          .doc(cartId)
          .get();
      return (result.exists);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> addProductToCart(
      {required Cart cart, required String userId}) async {
    try {
      await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.cartCollection)
          .doc(cart.id)
          .set(
            cart.toJson(),
          );
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> removeProductFromCart({
    required String cartId,
    required String userId,
  }) async {
    try {
      _userCollection
          .doc(userId)
          .collection(FirebaseConstants.cartCollection)
          .doc(cartId)
          .delete();
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<List<Cart>> fetchEventsFromCart({required String userId}) async {
    try {
      final snapshot = await _userCollection
          .doc(userId)
          .collection(FirebaseConstants.cartCollection)
          .get();

      return snapshot.docs
          .map(
            (doc) => Cart.fromJson(
              doc.data(),
            ),
          )
          .toList();
    } catch (error) {
      throw handleError(error);
    }
  }
}
