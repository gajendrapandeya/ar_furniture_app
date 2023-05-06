import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchService(
    firebaseFirestore: ref.read(firestoreProvider),
  );
});

class SearchService with ErrorMixin {
  final FirebaseFirestore _firebaseFirestore;

  SearchService({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  CollectionReference get _productCollection =>
      _firebaseFirestore.collection(FirebaseConstants.productCollection);

  Future<List<Product>> searchProducts(
      {required String searchQuery, String? filterType}) async {
    try {
      Query query = _productCollection.orderBy('name');

      if (filterType == 'Price: High to Low') {
        query = query.orderBy('price', descending: true);
      } else if (filterType == 'Price: Low to High') {
        query = query.orderBy('price');
      } else if (filterType == 'Top Rated') {
        query = query.orderBy('rating', descending: true);
      }

      query = query
          .where('name', isGreaterThanOrEqualTo: searchQuery)
          .where('name', isLessThanOrEqualTo: '$searchQuery\uf8ff');

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      debugPrint('SearchError: $error');
      throw handleError(error);
    }
  }
}
