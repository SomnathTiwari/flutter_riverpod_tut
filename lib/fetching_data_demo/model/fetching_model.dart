import 'dart:convert';

class UserModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  UserModel(
    this.userId,
    this.id,
    this.title,
    this.body,
  );

  UserModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return UserModel(
      userId ?? this.userId,
      id ?? this.id,
      title ?? this.title,
      body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['userId'] != null ? map['userId'] as int : null,
      map['id'] != null ? map['id'] as int : null,
      map['title'] != null ? map['title'] as String : null,
      map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
