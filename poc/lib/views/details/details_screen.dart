import 'package:flutter/material.dart';
import 'package:poc/models/todo.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(todo.todo)));
  }
}
