import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/lib/core/app_storage.dart';
import 'package:todo_app/lib/core/models/todo.dart';

class TodosProvider extends Notifier<List<Todo>> {
  @override
  List<Todo> build() => AppStorage.getTodos();
  void addTodos(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
      done: false,
    );
    state = [...state, newTodo];
    AppStorage.saveTodos(state);
  }

  void updateTodoText({required String todoId, required String newText}) {
    final List<Todo> updatedTodos = state
        .map(
          (todo) => todo.id == todoId
              ? Todo(id: todo.id, title: newText, done: todo.done)
              : todo,
        )
        .toList();
    state = updatedTodos;
    AppStorage.saveTodos(updatedTodos);
  }

  void markTodoComplete({required String todoId}) {
    final List<Todo> updatedTodos = state
        .map(
          (todo) => todo.id == todoId
              ? Todo(id: todo.id, title: todo.title, done: !todo.done)
              : todo,
        )
        .toList();
    state = updatedTodos;
    AppStorage.saveTodos(updatedTodos);
  }
}

final todosProvider = NotifierProvider<TodosProvider, List<Todo>>(
  TodosProvider.new,
);
