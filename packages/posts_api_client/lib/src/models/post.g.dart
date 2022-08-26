// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<_$_Post> {
  @override
  final int typeId = 2;

  @override
  _$_Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Post(
      postData: fields[0] as PostData,
      postComments: (fields[1] as List).cast<PostComment>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Post obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.postData)
      ..writeByte(1)
      ..write(obj.postComments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      postData: PostData.fromJson(json['postData'] as Map<String, dynamic>),
      postComments: (json['postComments'] as List<dynamic>)
          .map((e) => PostComment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'postData': instance.postData,
      'postComments': instance.postComments,
    };
