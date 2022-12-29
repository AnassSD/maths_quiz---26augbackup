import 'package:json_annotation/json_annotation.dart';

part 'problems.g.dart';

@JsonSerializable()
class Problems {
  final String question;
  final List<String> answers;
  final int correctAnswer;

  Problems({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
  factory Problems.fromJson(Map<String, dynamic> json) =>
      _$ProblemsFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemsToJson(this);
}
