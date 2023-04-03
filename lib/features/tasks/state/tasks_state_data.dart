import 'package:mobx/mobx.dart';

import '../task.dart';

part 'tasks_state_data.g.dart';

class TaskState = TaskStateBase with _$TaskState;

abstract class TaskStateBase with Store {
  TaskStateBase();

  List<Task> get tasks => _tasks;

  @observable
  List<Task> _tasks = [];

  @action
  void addTask(Task newTask) {
    _tasks.add(newTask);
  }

  @action
  void removeTask(String taskId) {
    _tasks.removeWhere((task) => taskId == task.id);
  }
}
