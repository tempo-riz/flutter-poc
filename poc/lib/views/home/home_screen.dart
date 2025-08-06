import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/controllers/router.dart';
import 'package:poc/controllers/todo_notifier.dart';
import 'package:poc/models/todo.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Todo>> todos = ref.watch(todoListProvider);

    return Scaffold(
      body: SafeArea(
        child: switch (todos) {
          AsyncData(:final value) => Column(
            children: [
              Text('Todos'),
              Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value[index].todo, textAlign: TextAlign.center),
                      onTap: () => context.pushNamed(NamedRoutes.details.name, extra: value[index]),
                    );
                  },
                ),
              ),
            ],
          ),
          AsyncError() => const Center(child: Text('Error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}
