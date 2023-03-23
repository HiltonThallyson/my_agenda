import 'package:flutter/material.dart';

import '../features/tasks/task.dart';

class MockTasks {
  List<Task> tasks = [
    Task(
        id: '1',
        name: 'Escovar os dentes',
        description: 'Escovar os dentes antes do café da manhã',
        day: DateTime.now(),
        start: const TimeOfDay(hour: 9, minute: 0),
        end: const TimeOfDay(hour: 10, minute: 0),
        isDaily: true),
    Task(
        id: '2',
        name: 'Tomar café da manhã',
        description: 'Tomar o café da manhã para começar o dia bem',
        day: DateTime.now(),
        start: const TimeOfDay(hour: 9, minute: 0),
        end: const TimeOfDay(hour: 09, minute: 45),
        isDaily: true),
    Task(
        id: '3',
        name: 'Tomar banho',
        description: 'Tomar banho antes de começar os estudos',
        day: DateTime.now(),
        start: const TimeOfDay(hour: 09, minute: 47),
        end: const TimeOfDay(hour: 10, minute: 0),
        isDaily: true),
    Task(
        id: '4',
        name: 'Estudar',
        description:
            'Estudar usando o metodo pómodoro - estudar 50 minutos e descansar 10',
        day: DateTime.now(),
        start: const TimeOfDay(hour: 10, minute: 0),
        end: const TimeOfDay(hour: 12, minute: 0),
        isDaily: true),
  ];
}
