import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province.freezed.dart';

final provinceListProvider = StateProvider<List<Province>>((ref) {
  return provinces;
});

@freezed
class Province with _$Province {
  const Province._();
  const factory Province({
    required int provinceId,
    required final String provinceName,
  }) = _Province;
}

const List<Province> provinces = [
  Province(provinceId: 1, provinceName: 'Bagmati Province'),
  Province(provinceId: 2, provinceName: 'Gandaki Province'),
  Province(provinceId: 3, provinceName: 'Karnali Province'),
  Province(provinceId: 4, provinceName: 'Lumbini Province'),
  Province(provinceId: 5, provinceName: 'Madhesh Province'),
  Province(provinceId: 6, provinceName: 'Province 1'),
  Province(provinceId: 7, provinceName: 'Sudurpashchim Province'),
];
