import 'package:flutter/material.dart';
import 'package:my_agenda/utils/appcolors.dart';

import '../../../utils/appthemes.dart';
import '../task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 5,
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.25),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.tertiaryAppColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            width: 100,
            height: 90,
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
          Container(
            decoration: const BoxDecoration(color: AppColors.tertiaryAppColor),
            height: 90,
            child: const VerticalDivider(
              width: 0,
              thickness: 2,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              task.name,
              maxLines: 2,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
