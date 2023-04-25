import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_content.freezed.dart';

@freezed
class TimelineContent with _$TimelineContent {
  const factory TimelineContent({
    required String title,
    required String updatedDate,
    required IconData iconData,
  }) = _TimelineContent;
}
