import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_agenda/utils/appColors.dart';

class DateSelectionCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DateSelectionCard(
      {required this.date, required this.isSelected, super.key});

  String captaliseFirstLetter(String text) {
    return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
  }

  bool _checkIfDateIsBeforeCurrentDate() {
    return date.day < DateTime.now().day;
  }

  @override
  Widget build(BuildContext context) {
    final isDateBeforeNow = _checkIfDateIsBeforeCurrentDate();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.secondaryAppColor : Colors.transparent),
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.all(8),
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            captaliseFirstLetter(DateFormat('EEE', 'pt-br').format(date)),
            style: TextStyle(
                color: isDateBeforeNow ? Colors.black45 : Colors.white,
                fontSize: 14),
          ),
          Text(
            date.day.toString(),
            style: TextStyle(
                color: isDateBeforeNow ? Colors.black45 : Colors.white,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
