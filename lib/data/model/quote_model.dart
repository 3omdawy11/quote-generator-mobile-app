class Quote {
  String id;
  String author;
  String content;


  Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
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
