// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ar_furniture_app/features/address/model/area/district.dart';
import 'package:ar_furniture_app/features/address/model/area/province.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final districtProvinceProvider =
    StateNotifierProvider.autoDispose<AreaNotifier, AreaModel>((ref) {
  return AreaNotifier();
});

class AreaModel {
  final Province? selectedProvince;
  final District? selectedDistrict;

  AreaModel({
    required this.selectedDistrict,
    required this.selectedProvince,
  });

  factory AreaModel.initial() =>
      AreaModel(selectedDistrict: null, selectedProvince: null);

  AreaModel copyWith({
    Province? selectedProvince,
    District? selectedDistrict,
  }) {
    return AreaModel(
      selectedProvince: selectedProvince ?? this.selectedProvince,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
    );
  }
}

class AreaNotifier extends StateNotifier<AreaModel> {
  AreaNotifier()
      : super(
          AreaModel.initial(),
        );

  void setSelectedDistrict(District district) {
    state = state.copyWith(selectedDistrict: district);
  }

  void setSelectedProvince(Province province) {
    state = state.copyWith(selectedProvince: province);
  }

  void clearSelected() {
    state = AreaModel.initial();
  }
}
