import 'dart:convert';

import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final imageServiceProvider = Provider<ImageService>((ref) {
  return ImageService();
});

class ImageService with ErrorMixin {
  Future<String> removeImageBackground({
    required String imagePath,
    required String apiKey,
  }) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://pixmiller.com/api/v1/remove'),
      );

      request.headers.addAll({
        'accept': 'application/json',
        'X-API-Key': apiKey,
      });

      request.fields.addAll({
        'size': 'preview',
        'image_url': imagePath,
      });

      final response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return responseData['url'];
      } else {
        debugPrint('Error removing background: ${response.statusCode}');
        throw handleError('Error');
      }
    } catch (error) {
      debugPrint('error: $error');
      throw handleError(error);
    }
  }
}
