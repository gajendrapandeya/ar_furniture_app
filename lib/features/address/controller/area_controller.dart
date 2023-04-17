// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AreaModel {
  final int selectedDistrictId;
  final int selectedProvinceId;

  AreaModel({
    required this.selectedDistrictId,
    required this.selectedProvinceId,
  });

  factory AreaModel.initial() =>
      AreaModel(selectedDistrictId: -1, selectedProvinceId: -1);

  AreaModel copyWith({
    int? selectedDistrictId,
    int? selectedProvinceId,
  }) {
    return AreaModel(
      selectedDistrictId: selectedDistrictId ?? this.selectedDistrictId,
      selectedProvinceId: selectedProvinceId ?? this.selectedProvinceId,
    );
  }
}

class AreaNotifier extends StateNotifier<AreaModel> {
  AreaNotifier(this._ref)
      : super(
          AreaModel.initial(),
        );

  final Ref _ref;

  void findDistrictByProvinceId(int provinceId) {}

  void setDistrictId(int districtId) {
    state = state.copyWith(selectedDistrictId: districtId);
  }

  void setProvinceId(int provinceId) {
    state = state.copyWith(selectedProvinceId: provinceId);
  }
}
