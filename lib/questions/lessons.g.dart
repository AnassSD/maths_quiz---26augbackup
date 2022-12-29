// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lessons _$LessonsFromJson(Map<String, dynamic> json) => Lessons(
      lessonTitle: json['lessonTitle'] as String,
      difficulty: json['difficulty'] as String,
      score: json['score'] as int,
      problems: (json['problems'] as List<dynamic>)
          .map((e) => Problems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
      'lessonTitle': instance.lessonTitle,
      'difficulty': instance.difficulty,
      'score': instance.score,
      'problems': instance.problems.map((e) => e.toJson()).toList(),
    };
