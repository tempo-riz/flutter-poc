import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poc/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    final response = await http.get(Uri.https('dummyjson.com', '/todos'));

    final json = jsonDecode(response.body);
    final todos = List.from(json['todos']);

    return todos.map((item) => Todo.fromMap(item)).toList();
  }
}
