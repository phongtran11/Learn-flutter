import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/bloc_export.dart';
import 'package:flutter_app/models/task.dart';

// ignore: must_be_immutable
class AddTaskWidget extends StatelessWidget {
  AddTaskWidget({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();

  int ID = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var task = Task(title: titleController.text, id: ID);
                      ID = ID + 1;
                      context.read<TasksBloc>().add(AddTask(task: task));
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
