import 'dart:convert';

import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/features/product/core/model/product/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final recommendationServiceProvider = Provider<RecommendationService>((ref) {
  return RecommendationService();
});

class RecommendationService with ErrorMixin {
  Future<List<Product>> fetchRecommendedProducts({
    required String productId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.66:6000/recommend/$productId'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map(
          (body) {
            if (body == null) {
              throw Exception('Failed to parse product');
            }
            return Product.fromJson(body);
          },
        ).toList();
      } else {
        throw Exception('Failed to Recommend products');
      }
    } catch (e) {
      debugPrint('FetchRecommendationError: $e');
      throw Exception('Failed to connect to server');
    }
  }
}
