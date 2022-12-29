import 'package:json_annotation/json_annotation.dart';
import 'problems.dart';

part 'lessons.g.dart';

@JsonSerializable(explicitToJson: true)
class Lessons {
  final String lessonTitle, difficulty;
  final int score;
  final List<Problems> problems;

  Lessons({
    required this.lessonTitle,
    required this.difficulty,
    required this.score,
    required this.problems,
  });

  factory Lessons.fromJson(Map<String, dynamic> json) =>
      _$LessonsFromJson(json);
  Map<String, dynamic> toJson() => _$LessonsToJson(this);
}
