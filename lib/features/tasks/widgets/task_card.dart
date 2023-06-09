import 'package:flutter/material.dart';

import '../../../utils/appthemes.dart';
import '../task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 10,
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.25),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            ),
            width: 100,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.start.format(context),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        '${task.start.format(context)}-${task.end.format(context)}',
                        style: AppThemes.hoursThemeCard)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(task.name)
        ],
      ),
    );
  }
}
