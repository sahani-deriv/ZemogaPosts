import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

/// {@template post}
/// A model that represents the posts data.
/// {@endtemplate}
@freezed
class PostData with _$PostData {
  /// {@macro post}
  @HiveType(typeId: 0, adapterName: 'PostDataAdapter')
  factory PostData({
    @HiveField(0) required final int userId,
    @HiveField(1) required final int id,
    @HiveField(2) required final String title,
    @HiveField(3) required final String body,
  }) = _PostData;

  /// {@template json_serializable}
  /// A de-serialization method that converts JSON [Map] into a class instance.
  /// {@endtemplate}
  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}
