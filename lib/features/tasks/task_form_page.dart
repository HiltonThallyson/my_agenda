import 'package:flutter/material.dart';

import 'forms/task_form.dart';

class TaskFormPage extends StatelessWidget {
  const TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de tarefa"),
        centerTitle: true,
        elevation: 0,
      ),
      body: const TaskForm(),
    );
  }
}
