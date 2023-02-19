// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'imageUrls': instance.imageUrls,
      'price': instance.price,
      'rating': instance.rating,
      'description': instance.description,
      'color': instance.color,
      'size': instance.size,
    };
