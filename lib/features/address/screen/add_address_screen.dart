import 'package:ar_furniture_app/core/themes/app_colors.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/address/widgets/address_type_widget.dart';
import 'package:ar_furniture_app/features/address/widgets/area_bottom_sheet.dart';
import 'package:ar_furniture_app/features/address/widgets/textfield_with_label_in_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            MdiIcons.chevronLeft,
            size: 28,
          ),
        ),
        title: const Text(
          'Add Billing Address',
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LightColor.platianGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        onPressed: () {},
        child: const Icon(MdiIcons.check),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            _buildFullNameAndMobileNumber(),
            VerticalSpacer.xxl,
            _buildAddress(),
            VerticalSpacer.xxl,
            const AddressTypeWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameAndMobileNumber() {
    return Container(
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
      child: Column(
        children: [
          const TextfieldWithLableInContainer(
            title: 'Full Name',
            hintText: 'Input full Name',
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          const TextfieldWithLableInContainer(
            title: 'Mobile Number',
            hintText: 'Input mobile number',
            textInputType: TextInputType.number,
          )
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
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
      child: Column(
        children: [
          VerticalSpacer.s,
          _buildArea(),
          VerticalSpacer.s,
          Divider(
            color: Colors.grey.shade200,
          ),
          const TextfieldWithLableInContainer(
            title: 'Address',
            hintText: 'House no./ building/ street / area',
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          const TextfieldWithLableInContainer(
            title: 'Landmark(Optional)',
            hintText: 'E.g. beside burger house',
          ),
        ],
      ),
    );
  }

  Widget _buildArea() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: Row(
        children: [
          Text(
            'Area',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const AreaBottomSheet(),
              ),
              child: Text(
                'Select the region, city, area >',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
