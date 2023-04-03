// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_state_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskState on TaskStateBase, Store {
  late final _$_tasksAtom =
      Atom(name: 'TaskStateBase._tasks', context: context);

  @override
  List<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(List<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$TaskStateBaseActionController =
      ActionController(name: 'TaskStateBase', context: context);

  @override
  void addTask(Task newTask) {
    final _$actionInfo = _$TaskStateBaseActionController.startAction(
        name: 'TaskStateBase.addTask');
    try {
      return super.addTask(newTask);
    } finally {
      _$TaskStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(String taskId) {
    final _$actionInfo = _$TaskStateBaseActionController.startAction(
        name: 'TaskStateBase.removeTask');
    try {
      return super.removeTask(taskId);
    } finally {
      _$TaskStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
