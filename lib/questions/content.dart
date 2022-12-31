import 'package:json_annotation/json_annotation.dart';
import 'lessons.dart';

part 'content.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  final String title;
  final String image;
  final String age;
  final List<Lessons> lessons;

  Content({
    required this.image,
    required this.age,
    required this.title,
    required this.lessons,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
