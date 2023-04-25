// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimelineContent {
  String get title => throw _privateConstructorUsedError;
  String get updatedDate => throw _privateConstructorUsedError;
  IconData get iconData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineContentCopyWith<TimelineContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineContentCopyWith<$Res> {
  factory $TimelineContentCopyWith(
          TimelineContent value, $Res Function(TimelineContent) then) =
      _$TimelineContentCopyWithImpl<$Res, TimelineContent>;
  @useResult
  $Res call({String title, String updatedDate, IconData iconData});
}

/// @nodoc
class _$TimelineContentCopyWithImpl<$Res, $Val extends TimelineContent>
    implements $TimelineContentCopyWith<$Res> {
  _$TimelineContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? updatedDate = null,
    Object? iconData = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineContentCopyWith<$Res>
    implements $TimelineContentCopyWith<$Res> {
  factory _$$_TimelineContentCopyWith(
          _$_TimelineContent value, $Res Function(_$_TimelineContent) then) =
      __$$_TimelineContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String updatedDate, IconData iconData});
}

/// @nodoc
class __$$_TimelineContentCopyWithImpl<$Res>
    extends _$TimelineContentCopyWithImpl<$Res, _$_TimelineContent>
    implements _$$_TimelineContentCopyWith<$Res> {
  __$$_TimelineContentCopyWithImpl(
      _$_TimelineContent _value, $Res Function(_$_TimelineContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? updatedDate = null,
    Object? iconData = null,
  }) {
    return _then(_$_TimelineContent(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$_TimelineContent implements _TimelineContent {
  const _$_TimelineContent(
      {required this.title, required this.updatedDate, required this.iconData});

  @override
  final String title;
  @override
  final String updatedDate;
  @override
  final IconData iconData;

  @override
  String toString() {
    return 'TimelineContent(title: $title, updatedDate: $updatedDate, iconData: $iconData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineContent &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, updatedDate, iconData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineContentCopyWith<_$_TimelineContent> get copyWith =>
      __$$_TimelineContentCopyWithImpl<_$_TimelineContent>(this, _$identity);
}

abstract class _TimelineContent implements TimelineContent {
  const factory _TimelineContent(
      {required final String title,
      required final String updatedDate,
      required final IconData iconData}) = _$_TimelineContent;

  @override
  String get title;
  @override
  String get updatedDate;
  @override
  IconData get iconData;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineContentCopyWith<_$_TimelineContent> get copyWith =>
      throw _privateConstructorUsedError;
}
