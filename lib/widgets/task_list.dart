import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/bloc_export.dart';
import 'package:flutter_app/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];

            return ListTile(
              trailing: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }),
              title: Text(task.title),
              onLongPress: () => context.read<TasksBloc>().add(
                    DeleteTask(task: task),
                  ),
            );
          }),
    );
  }
}
