import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<List<Product>> searchProduct({required String searchQuery}) async {
    try {
      final snapshot = await _productCollection
          .where('name', isGreaterThanOrEqualTo: searchQuery.toLowerCase())
          .where(
            'name',
            isLessThan: '${searchQuery.toLowerCase()}z',
          )
          .get();
      return snapshot.docs.map((doc) {
        return Product.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      throw handleError(error);
    }
  }
}
