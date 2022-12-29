import 'package:json_annotation/json_annotation.dart';
import 'lessons.dart';

part 'quiz.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  final String title;
  final List<Lessons> lessons;

  Content({
    required this.title,
    required this.lessons,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
