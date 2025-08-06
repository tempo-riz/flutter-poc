// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final int id;
  final String todo;
  final bool completed;

  Todo({required this.id, required this.todo, this.completed = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'todo': todo, 'completed': completed};
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(id: map['id'] as int, todo: map['todo'] as String, completed: map['completed'] as bool);
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
