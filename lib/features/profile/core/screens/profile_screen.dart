import 'package:ar_furniture_app/core/constants/route_constants.dart';
import 'package:ar_furniture_app/core/providers/user_provider.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/not_logged_in_widget.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/auth/core/controller/authentication_controller.dart';
import 'package:ar_furniture_app/features/profile/core/controller/profile_controller.dart';
import 'package:ar_furniture_app/features/profile/core/model/profile_item.dart';
import 'package:ar_furniture_app/features/profile/core/widgets/profile_header.dart';
import 'package:ar_furniture_app/features/profile/core/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (ref.read(userNotifierProvider) != null) {
        ref
            .read(profileProvider.notifier)
            .getUserData(uid: ref.read(userNotifierProvider)!.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(userNotifierProvider) != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const ProfileHeader(),
                    ),
                    VerticalSpacer.xs,
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((_, index) {
                        final item = profileItems[index];
                        return ProfileListItem(
                          iconData: item.iconData,
                          title: item.title,
                          onItemClicked: () => _navigateToParticularScreen(
                              profileItems[index].title),
                        );
                      }),
                      separatorBuilder: ((_, index) => Divider(
                            color: Colors.grey.shade300,
                          )),
                      itemCount: profileItems.length,
                    ),
                    VerticalSpacer.exl,
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      color: Colors.grey.shade50,
                      child: CustomOutlinedButton(
                        onBtnPressed: () {
                          ref.read(authProvider.notifier).logout();
                        },
                        buttonText: 'Sign out',
                      ),
                    )
                  ],
                ),
              )
            : NotLoggedInWidget(onLoginPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.of(context)
                    .pushReplacementNamed(RouteConstants.loginRoute);
              }),
      ),
    );
  }

  void _navigateToParticularScreen(String itemName) {
    if (itemName == 'Address Book') {
      Navigator.of(context).pushNamed(
        RouteConstants.addressListScreenRoute,
      );
    }
    if (itemName == 'My Orders') {
      Navigator.of(context).pushNamed(
        RouteConstants.orderListScreenRoute,
      );
    }
  }
}
