import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../state/tasks_state_data.dart';
import '../task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final taskState = Modular.get<TaskState>();

  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _start = const TimeOfDay(hour: 09, minute: 00);
  TimeOfDay _end = const TimeOfDay(hour: 09, minute: 30);
  var _isDaily = false;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _addNewTask() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_end.hour < _start.hour) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(30),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Horário final deve ser maior que o inicial',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      );
    } else {
      var newTask = Task(
          id: Random().nextDouble().toString(),
          name: _nameController.text,
          description: _descriptionController.text,
          day: _selectedDate,
          start: _start,
          end: _end,
          isDaily: _isDaily);
      taskState.addTask(newTask);
      Modular.to.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nome',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: 'Nome da tarefa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira um nome para a tarefa';
                      } else if (value.length > 150) {
                        return 'Tamanho máximo: 150 caracteres';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Descrição',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Descrição da tarefa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira uma descrição para a tarefa';
                      } else if (value.length > 300) {
                        return 'Tamanho máximo: 300 caracteres';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Selecione a data: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(children: [
                        TextButton(
                          child: Row(
                            children: [
                              Text(
                                  DateFormat('dd/MM/yyyy', 'pt-br')
                                      .format(_selectedDate),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.green)),
                              const Icon(
                                Icons.calendar_month_rounded,
                                size: 28,
                              ),
                            ],
                          ),
                          onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2035),
                            keyboardType: TextInputType.datetime,
                          ).then((date) {
                            setState(() {
                              date != null
                                  ? _selectedDate = date
                                  : DateTime.now();
                            });
                          }),
                        )
                      ])
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Início'),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? timePicked = await showTimePicker(
                              context: context, initialTime: _start);
                          setState(() {
                            if (timePicked != null) {
                              _start = timePicked;
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black54),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(_start.format(context)),
                        ),
                      ),
                      const Text('Fim'),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? timePicked = await showTimePicker(
                              context: context, initialTime: _end);
                          setState(() {
                            if (timePicked != null) {
                              _end = timePicked;
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black54),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(_end.format(context)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckboxListTile(
                    contentPadding: const EdgeInsets.all(5),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Repete diariamente'),
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _isDaily,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    onChanged: (value) {
                      setState(() {
                        _isDaily = value!;
                      });
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: _addNewTask,
                      child: const Text('Cadastrar tarefa'),
                    ),
                  )
                ]),
          )),
    );
  }
}
