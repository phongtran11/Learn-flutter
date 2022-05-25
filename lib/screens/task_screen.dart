import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/bloc_export.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/screens/add_task_screen.dart';
import 'package:flutter_app/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTaskWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Icon(Icons.add), actions: [
        IconButton(
          onPressed: () => _addTask(context),
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text('Tasks'),
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              List<Task> tasksList = state.allTasks;
              return TaskList(taskList: tasksList);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
