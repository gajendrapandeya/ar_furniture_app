import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productServiceProvider = Provider(
  (_) => ProductService(),
);

class ProductService with ErrorMixin {
  CollectionReference get _productCollection => FirebaseFirestore.instance
      .collection(FirebaseConstants.productCollection);

  Future<List<Product>> fetchProducts({String categoryName = ''}) async {
    try {
      final snapshot =
          await _productCollection.where('name', isEqualTo: categoryName).get();

      return snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw handleError(error);
    }
  }
}
