import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/lib/core/app_storage.dart';
import 'package:todo_app/lib/core/models/todo.dart';

class TodosProvider extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => AppStorage.getTodos();
  void addTodos(String title) {
    [...state, Todo(id: DateTime.now().toString(), title: title, done: false)];
  }

  void markTodoComplete(String todoId) {
    final List<Todo> updatedTodos = state.map((todo) {
      if (todo.id == todoId) {
        todo.done = true;
      }
      return todo;
    }).toList();
    state = updatedTodos;
    AppStorage.saveTodos(updatedTodos);
  }
}

final todosProvider = NotifierProvider<TodosProvider, List<Todo>>(
  TodosProvider.new,
);
