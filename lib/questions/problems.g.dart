// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problems _$ProblemsFromJson(Map<String, dynamic> json) => Problems(
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as int,
    );

Map<String, dynamic> _$ProblemsToJson(Problems instance) => <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'correctAnswer': instance.correctAnswer,
    };
