import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/providers/todos_provider.dart';
import 'package:todo_app/lib/views/home_page/edit_todo_sheet.dart';

class HomePage extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: Text("My todos")),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 6),
          sliver: SliverList.list(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(4),
                child: FilledButton.icon(
                  onPressed: () => showAddTodo(),
                  label: Text("Add Todo"),
                  icon: Icon(Icons.add),
                ),
              ),
              SizedBox(height: 6),
              Wrap(
                spacing: 6,
                children: [
                  FilterChip(
                    label: Text("Filter"),
                    selected: true,
                    onSelected: (_) {},
                  ),
                  ChoiceChip(
                    label: Text("Choice"),
                    selected: false,
                    onSelected: (_) {},
                  ),
                  ActionChip(label: Text("Action chip"), onPressed: () {}),
                ],
              ),
              SizedBox(height: 6),
              SegmentedButton<int>(
                segments: [
                  ButtonSegment(value: 0, label: Text("Day")),
                  ButtonSegment(value: 1, label: Text("Week")),
                ],
                selected: const {0},
                onSelectionChanged: (_) {},
              ),
              SizedBox(height: 6),
              ...todos.map(
                (todo) => Card(
                  child: CheckboxListTile(
                    value: todo.done,
                    title: GestureDetector(
                      onTap: () => showModalBottomSheet(
                        showDragHandle: true,
                        enableDrag: true,
                        context: context,
                        builder: (context) => EditTodoSheet(todo: todo),
                      ),

                      child: Text(todo.title),
                    ),
                    onChanged: (_) => ref
                        .read(todosProvider.notifier)
                        .markTodoComplete(todoId: todo.id),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showAddTodo() async {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => EditTodoSheet(),
    );
  }
}
