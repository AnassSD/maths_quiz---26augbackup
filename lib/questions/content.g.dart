// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      image: json['image'] as String,
      age: json['age'] as String,
      title: json['title'] as String,
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => Lessons.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'age': instance.age,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };
