import 'package:hive/hive.dart';

part 'quotes_entity.g.dart';

@HiveType(typeId: 0)
class QuoteEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String content;

  // Constructor should not have a required named parameter named id
  QuoteEntity({required this.id, required this.author, required this.content});

  // The factory constructor should accept required named parameter _id
  factory QuoteEntity.fromJson(Map<String, dynamic> json) => QuoteEntity(
    id: json["_id"],
    author: json["author"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "author": author,
    "content": content,
  };
}
