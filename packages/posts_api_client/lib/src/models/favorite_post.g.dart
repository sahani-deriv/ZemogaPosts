// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritePostAdapter extends TypeAdapter<_$_FavoritePost> {
  @override
  final int typeId = 2;

  @override
  _$_FavoritePost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_FavoritePost(
      post: fields[0] as Post,
      postComments: (fields[1] as List).cast<PostComment>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_FavoritePost obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.post)
      ..writeByte(1)
      ..write(obj.postComments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritePostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoritePost _$$_FavoritePostFromJson(Map<String, dynamic> json) =>
    _$_FavoritePost(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      postComments: (json['postComments'] as List<dynamic>)
          .map((e) => PostComment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FavoritePostToJson(_$_FavoritePost instance) =>
    <String, dynamic>{
      'post': instance.post,
      'postComments': instance.postComments,
    };
