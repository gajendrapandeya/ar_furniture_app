// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RadioListItem {
  final int id;
  final String title;
  final String subTitle;
  final IconData iconData;
  bool isChecked;

  RadioListItem({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.isChecked = false,
  });

  RadioListItem copyWith({
    int? id,
    String? title,
    String? subTitle,
    IconData? iconData,
    bool? isChecked,
  }) {
    return RadioListItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      iconData: iconData ?? this.iconData,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
