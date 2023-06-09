import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:my_agenda/utils/appColors.dart';

import '../tasks/state/tasks_state_data.dart';
import '../tasks/widgets/task_card.dart';
import './widgets/date_selection_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedDay = DateTime.now().day - 1;
  var taskState = Modular.get<TaskState>();
  final _scrollController = ScrollController(
    initialScrollOffset: (65 * (DateTime.now().day - 1)).toDouble(),
  );

  int _getMonthDays() {
    final month = DateTime.now().month;
    final year = DateTime.now().year;
    return DateUtils.getDaysInMonth(year, month);
    // switch (month) {
    //   case 1:
    //     return 31;
    //   case 2:
    //     if ((year / 1000 == (year ~/ 1000)) && (year % 4 == 0)) {
    //       return 29;
    //     }
    //     return 28;
    //   case 3:
    //     return 31;
    //   case 4:
    //     return 30;
    //   case 5:
    //     return 31;
    //   case 6:
    //     return 30;
    //   case 7:
    //     return 31;
    //   case 8:
    //     return 31;
    //   case 9:
    //     return 30;
    //   case 10:
    //     return 31;
    //   case 11:
    //     return 30;
    //   default:
    //     return 31;
    // }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            top: 15,
          ),
          child: Text(
            'Minha agenda',
            style: TextStyle(color: Colors.white, fontSize: 34),
          ),
        ),
        actions: [
          Container(
            height: 60,
            padding: const EdgeInsets.only(
              top: 30,
              right: 30,
            ),
            child: Text(
              DateFormat.MMM('pt-br').format(currentDate).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              color: AppColors.primaryAppColor,
              height: 110,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _getMonthDays(),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDay = index;
                    });
                  },
                  child: DateSelectionCard(
                      isSelected: selectedDay == index,
                      date: DateTime(2023, DateTime.now().month, index + 1)),
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                    itemCount: taskState.tasks
                        .where((task) => DateUtils.isSameDay(
                            task.day,
                            DateTime(DateTime.now().year, DateTime.now().month,
                                selectedDay + 1)))
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      var currentTask = taskState.tasks
                          .where((task) => DateUtils.isSameDay(
                              task.day,
                              DateTime(DateTime.now().year,
                                  DateTime.now().month, selectedDay + 1)))
                          .toList()[index];
                      return Observer(
                        builder: (context) => TaskCard(
                          task: currentTask,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('task-form-screen').then((_) {
                setState(() {});
              }),
          child: const Icon(Icons.add)),
    );
  }
}
