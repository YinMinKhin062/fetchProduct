// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pdetail _$PdetailFromJson(Map<String, dynamic> json) => Pdetail(
      json['id'] as int?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['description'] as String?,
      json['category'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$PdetailToJson(Pdetail instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'price': instance.price,
    };
