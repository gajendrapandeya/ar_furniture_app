import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provinceList = [
  'Bagmati Province',
  'Gandaki Province',
  'Karnali Province',
  'Lumbini Province',
  'Madhesh Province',
  'Province 1',
  'Sudurpashchim Province'
];

class AreaBottomSheet extends ConsumerStatefulWidget {
  const AreaBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AreaBottomSheetState();
}

class _AreaBottomSheetState extends ConsumerState<AreaBottomSheet> {
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
              'Select the Region',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            VerticalSpacer.l,
            _buildProvinceList(),
            VerticalSpacer.l,
            CustomOutlinedButton(onBtnPressed: () {}, buttonText: 'Confirm')
          ],
        ),
      ),
    );
  }

  Expanded _buildProvinceList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 4,
          top: 12,
          bottom: 12,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
        child: ListView.separated(
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacer.s,
                    Text(
                      provinceList[index],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                )),
            separatorBuilder: ((context, index) => Divider(
                  color: Colors.grey.shade100,
                )),
            itemCount: provinceList.length),
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
              _buildDot(),
              HorizontalSpacer.l,
              Text(
                'Region',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
              ),
              const Spacer(),
              Text(
                'Select your area below',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: LightColor.platianGreen,
      ),
    );
  }
}
