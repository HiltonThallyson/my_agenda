import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Nome',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Nome da tarefa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
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
              decoration: InputDecoration(
                  hintText: 'Descrição da tarefa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Selecione a data: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                        date != null ? _selectedDate = date : DateTime.now();
                      });
                    }),
                  )
                ])
              ],
            ),
          ]),
        ));
  }
}
