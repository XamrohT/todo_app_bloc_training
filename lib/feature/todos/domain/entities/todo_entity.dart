// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String content;

  const TodoEntity({
    required this.id,
    required this.title, 
    required this.content,
  });

  factory TodoEntity.fromJson(Map<String,dynamic> json){
    return TodoEntity(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json ['content'] ?? '',
    );
  }

  Map<String,dynamic> toJson() => {
    '_id': id,
    'title': title,
    'content' : content,
  };

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, content];
}
