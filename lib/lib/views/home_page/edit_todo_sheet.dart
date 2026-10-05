import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:todo_app/lib/core/models/todo.dart';
import 'package:todo_app/lib/core/providers/todos_provider.dart';

class EditTodoSheet extends ConsumerStatefulWidget {
  final Todo? todo;
  const new({super.key, this.todo});

  @override
  ConsumerState<EditTodoSheet> createState() => _EditTodoSheetState();
}

class _EditTodoSheetState extends ConsumerState<EditTodoSheet> {
  GlobalKey key = GlobalKey();
  late final String? validationText;
  TextEditingController taskEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.todo == null ? "Add new task" : "Update ${widget.todo}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
          child: Form(
            key: key,
            child: TextFormField(
              controller: taskEditingController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Task title",
              ),
              onChanged: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  validationText = "Cannot save an empty value!";
                  return validationText;
                } else if (widget.todo != null && value == widget.todo!.title) {
                  validationText =
                      "Cannot save as the same text already exists!";
                  return validationText;
                } else {
                  validationText = null;
                  return validationText;
                }
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.errorContainer,
                ),
              ),
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.cancel_outlined),
              label: Text(widget.todo == null ? "Cancel" : "Discard Changes"),
            ),

            SizedBox(width: MediaQuery.sizeOf(context).width * 2 / 5),
            ElevatedButton.icon(
              icon: Icon(Icons.save_outlined),
              onPressed: () {
                if (widget.todo == null) {
                  if ((validationText!.isEmpty || validationText == null) &&
                      taskEditingController.text.isNotEmpty) {
                    ref
                        .read(todosProvider.notifier)
                        .addTodos(taskEditingController.text);
                  }
                } else {
                  ref
                      .read(todosProvider.notifier)
                      .updateTodoText(
                        todoId: widget.todo!.id,
                        newText: widget.todo!.title,
                      );
                }
              },
              label: Text(widget.todo == null ? "Save Task" : "Update Task"),
            ),
          ],
        ),
      ],
    );
  }
}
