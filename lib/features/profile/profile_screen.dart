import 'package:ar_furniture_app/core/model/user_model.dart';
import 'package:ar_furniture_app/core/widgets/custom_outlined_button.dart';
import 'package:ar_furniture_app/core/widgets/spacer.dart';
import 'package:ar_furniture_app/features/profile/model/profile_item.dart';
import 'package:ar_furniture_app/features/profile/widgets/profile_header.dart';
import 'package:ar_furniture_app/features/profile/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ProfileHeader(
                  onEditPressed: () {},
                  userModel: UserModel(
                      id: '0',
                      fullName: 'Umesh Lanthu',
                      email: 'Umesh@lanthu.com',
                      photoUrl:
                          'https://images.unsplash.com/photo-1637109042665-2f26aaf91856?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aG90JTIwZ2lydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                ),
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
                  );
                }),
                separatorBuilder: ((_, index) => Divider(
                      color: Colors.grey.shade300,
                    )),
                itemCount: profileItems.length,
              ),
              VerticalSpacer.exl,
              VerticalSpacer.l,
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                color: Colors.grey.shade50,
                child: CustomOutlinedButton(
                  onBtnPressed: () {},
                  buttonText: 'Sign out',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
