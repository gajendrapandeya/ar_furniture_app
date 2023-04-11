import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/model/area/district.dart';
import 'package:ar_furniture_app/features/address/model/area/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final provinceProvider =
    StateProvider.family<List<Province>, int?>((ref, provindeId) {
  return province;
});

final districtProvider = StateProvider.family<List<District>, int?>(
  (ref, districtId) => districts,
);

final selectedProvinceProvider = StateProvider<String>((_) {
  return '';
});

final selectedDistrictProvider = StateProvider<String>((ref) {
  return '';
});

class AreaBottomSheet extends ConsumerStatefulWidget {
  const AreaBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AreaBottomSheetState();
}

class _AreaBottomSheetState extends ConsumerState<AreaBottomSheet> {
  List<District> filteredDistricts = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            VerticalSpacer.l,
            _buildParticularArea(),
            VerticalSpacer.xl,
            Text(
              _getCurrentlySelectedAreaName(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            VerticalSpacer.l,
            _buildProvinceDistrictList(),
            VerticalSpacer.l,
            CustomOutlinedButton(onBtnPressed: () {}, buttonText: 'Confirm')
          ],
        ),
      ),
    );
  }

  String _getCurrentlySelectedAreaName() {
    if (ref.watch(selectedProvinceProvider).isEmpty) {
      return 'Select the region';
    }
    return 'Select the district';
  }

  Expanded _buildProvinceDistrictList() {
    final provinces = ref.watch(provinceProvider(null));
    final districts = ref.watch(districtProvider(null).notifier).state;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
        child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                onTap: () {
                  if (ref.read(selectedProvinceProvider).isEmpty) {
                    ref.read(selectedProvinceProvider.notifier).update(
                        (state) => state = provinces[index].provinceName);
                  }
                  if (filteredDistricts.isNotEmpty) {
                    ref.read(selectedDistrictProvider.notifier).update(
                        (state) =>
                            state = filteredDistricts[index].districtName);
                  }
                  filteredDistricts = districts
                      .where((element) =>
                          element.stateId == provinces[index].provinceId)
                      .toList();
                },
                contentPadding: EdgeInsets.zero,
                dense: true,
                trailing: ref.watch(selectedProvinceProvider).isNotEmpty &&
                        ref.watch(selectedDistrictProvider).isNotEmpty
                    ? const Icon(
                        MdiIcons.check,
                        color: LightColor.platianGreen,
                      )
                    : null,
                title: Text(
                  ref.watch(selectedProvinceProvider).isEmpty &&
                          ref.watch(selectedDistrictProvider).isEmpty
                      ? provinces[index].provinceName
                      : filteredDistricts[index].districtName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )),
          separatorBuilder: ((context, index) => Divider(
                color: Colors.grey.shade200,
              )),
          itemCount: ref.watch(selectedProvinceProvider).isEmpty
              ? ref.read(provinceProvider(null)).length
              : filteredDistricts.length,
        ),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            )),
        Expanded(
          child: Text(
            'Select your Area',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
          ),
        )
      ],
    );
  }

  Widget _buildParticularArea() {
    final selectedProvince = ref.watch(selectedProvinceProvider);
    final selectedDistrict = ref.watch(selectedDistrictProvider);
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 12,
        top: 12,
        bottom: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildDot(selectedProvince.isEmpty),
              HorizontalSpacer.l,
              Text(
                'Province',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  debugPrint('called');
                  filteredDistricts = [];
                },
                child: Text(
                  selectedProvince.isEmpty
                      ? 'Select your province below'
                      : '$selectedProvince >',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              )
            ],
          ),
          if (selectedProvince.isNotEmpty) ...[
            VerticalSpacer.s,
            Row(
              children: [
                _buildDot(selectedDistrict.isEmpty),
                HorizontalSpacer.l,
                Text(
                  'District',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                ),
                const Spacer(),
                Text(
                  selectedDistrict.isEmpty
                      ? 'Select your district below'
                      : '$selectedDistrict >',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                )
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildDot(bool isCurrentlySelected) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentlySelected ? LightColor.platianGreen : Colors.grey,
      ),
    );
  }
}
