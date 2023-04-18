import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/controller/area_controller.dart';
import 'package:ar_furniture_app/features/address/model/area/district.dart';
import 'package:ar_furniture_app/features/address/model/area/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AreaBottomSheet extends ConsumerStatefulWidget {
  const AreaBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AreaBottomSheetState();
}

class _AreaBottomSheetState extends ConsumerState<AreaBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final selectedDistrictProvinceProvider =
        ref.watch(districtProvinceProvider);
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
            CustomOutlinedButton(
              isFilled:
                  selectedDistrictProvinceProvider.selectedProvince != null &&
                      selectedDistrictProvinceProvider.selectedDistrict != null,
              onBtnPressed: () {
                Navigator.of(context).pop(true);
              },
              buttonText: 'Confirm',
            )
          ],
        ),
      ),
    );
  }

  String _getCurrentlySelectedAreaName() {
    final selectedDistrictProvinceProvider =
        ref.watch(districtProvinceProvider);
    return selectedDistrictProvinceProvider.selectedProvince == null
        ? 'Select the district'
        : 'Select the province';
  }

  Expanded _buildProvinceDistrictList() {
    final selectedDistrictProvinceProvider =
        ref.watch(districtProvinceProvider);
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
        child: selectedDistrictProvinceProvider.selectedProvince == null
            ? _buildProvinceList()
            : _buildDistrictList(),
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
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
    final selectedDistrictProvinceProvider =
        ref.watch(districtProvinceProvider);
    final bool isProvinceSelected =
        selectedDistrictProvinceProvider.selectedProvince != null;
    final bool isDistrictSelected =
        selectedDistrictProvinceProvider.selectedDistrict != null;
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
              _buildDot(isCurrentlySelected: !isProvinceSelected),
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
                  ref.read(districtProvinceProvider.notifier).clearSelected();
                },
                child: Text(
                  !isProvinceSelected
                      ? 'Select your province below'
                      : '${_selectedProvinceName(selectedDistrictProvinceProvider)} >',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              )
            ],
          ),
          if (isProvinceSelected) ...[
            VerticalSpacer.s,
            Row(
              children: [
                _buildDot(isCurrentlySelected: !isDistrictSelected),
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
                  !isDistrictSelected
                      ? 'Select your district below'
                      : '${_selectedDistrictName(selectedDistrictProvinceProvider)} >',
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

  String _selectedDistrictName(AreaModel selectedDistrictProvinceProvider) =>
      ref.watch(districtProvinceProvider).selectedDistrict!.districtName;

  String _selectedProvinceName(AreaModel selectedDistrictProvinceProvider) =>
      ref.watch(districtProvinceProvider).selectedProvince!.provinceName;

  Widget _buildDot({required bool isCurrentlySelected}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentlySelected ? LightColor.platianGreen : Colors.grey,
      ),
    );
  }

  Widget _buildProvinceList() {
    final provinceList = ref.read(provinceListProvider);
    return ListView.separated(
        itemBuilder: ((context, index) => ListTile(
              onTap: () {
                ref.read(districtProvinceProvider.notifier).setSelectedProvince(
                      provinceList[index],
                    );
              },
              contentPadding: EdgeInsets.zero,
              trailing:
                  ref.watch(districtProvinceProvider).selectedProvince != null
                      ? const Icon(MdiIcons.check)
                      : null,
              title: Text(
                provinceList[index].provinceName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            )),
        separatorBuilder: ((context, index) => Divider(
              color: Colors.grey.shade200,
            )),
        itemCount: provinceList.length);
  }

  Widget _buildDistrictList() {
    final districtList = ref.read(districtListProvider);

    final filteredDistricts = _getDistrictsOfParticularProvince(
        ref.read(districtProvinceProvider).selectedProvince!.provinceId);
    return ListView.separated(
      itemBuilder: ((context, index) => ListTile(
            onTap: () {
              ref.read(districtProvinceProvider.notifier).setSelectedDistrict(
                    districtList[index],
                  );
            },
            contentPadding: EdgeInsets.zero,
            trailing: ref
                        .watch(districtProvinceProvider)
                        .selectedDistrict
                        ?.districtId ==
                    districtList[index].districtId
                ? const Icon(
                    MdiIcons.check,
                    color: LightColor.platianGreen,
                  )
                : null,
            title: Text(
              filteredDistricts[index].districtName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )),
      separatorBuilder: ((context, index) => Divider(
            color: Colors.grey.shade200,
          )),
      itemCount: filteredDistricts.length,
    );
  }

  List<District> _getDistrictsOfParticularProvince(int provinceId) {
    final districts = ref.read(districtListProvider);
    return districts
        .where((element) => element.provinceId == provinceId)
        .toList();
  }
}
