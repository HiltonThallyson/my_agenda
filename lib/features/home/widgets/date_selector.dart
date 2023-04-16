import 'package:flutter/material.dart';

import 'date_selection_card.dart';

class DateSelector extends StatefulWidget {
  final int monthDays;
  final int month;
  final int year;
  const DateSelector(
      {required this.monthDays,
      required this.year,
      required this.month,
      super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  var selectedDay = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: widget.monthDays,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedDay = index;
          });
        },
        child: DateSelectionCard(
          isSelected: selectedDay == index,
          date: DateTime(widget.year, widget.month, index + 1),
        ),
      ),
    );
  }
}
