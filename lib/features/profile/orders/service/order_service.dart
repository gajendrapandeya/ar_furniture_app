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

  CollectionReference get _orderCollection =>
      _firestore.collection(FirebaseConstants.orderCollection);

  Future<void> createOrder({
    required ProductOrder order,
  }) async {
    try {
      debugPrint('order: $order');
      _orderCollection.doc(order.orderId).set(order.toJson());
    } catch (error) {
      debugPrint('OrderCreateError: $error');
      handleError(error);
    }
  }

  Future<List<ProductOrder>> fetchOrders(
      {required String orderStatus, required String userId}) async {
    try {
      QuerySnapshot snapshot = await _orderCollection
          .where('userId', isEqualTo: userId)
          .where('orderStatus', isEqualTo: orderStatus)
          .get();

      return snapshot.docs.map((doc) {
        return ProductOrder.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('fetchOrderError: $error');
      throw handleError(error);
    }
  }
}
