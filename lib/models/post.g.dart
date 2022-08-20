// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String?,
      name: json['name'] as String?,
      time: (json['time'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['uodated_at'] == null
          ? null
          : DateTime.parse(json['uodated_at'] as String),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'time': instance.time,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt?.toIso8601String(),
      'uodated_at': instance.updatedAt?.toIso8601String(),
    };
