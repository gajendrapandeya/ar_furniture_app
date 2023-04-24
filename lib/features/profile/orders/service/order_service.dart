import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/profile/orders/model/product_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderService(firestore: ref.read(firestoreProvider));
});

class OrderService with ErrorMixin {
  final FirebaseFirestore _firestore;

  OrderService({required FirebaseFirestore firestore}) : _firestore = firestore;

  CollectionReference get _userCollection =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<void> createOrder({
    required ProductOrder order,
  }) async {
    try {
      debugPrint('order: $order');
      _userCollection
          .doc(order.userId)
          .collection(FirebaseConstants.orderCollection)
          .doc(order.orderId)
          .set(order.toJson());
    } catch (error) {
      debugPrint('OrderCreateError: $error');
      handleError(error);
    }
  }
}
