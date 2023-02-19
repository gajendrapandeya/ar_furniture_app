import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/category/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryServiceProvider = Provider(
  (_) => CategoryService(),
);

class CategoryService with ErrorMixin {
  CollectionReference get _categoryCollection => FirebaseFirestore.instance
      .collection(FirebaseConstants.categoryCollection);

  Future<List<Category>> fetchCategories() async {
    try {
      final snapshot = await _categoryCollection.get();
      return snapshot.docs.map((doc) {
        return Category.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('error: $error');
      throw handleError(error);
    }
  }
}
