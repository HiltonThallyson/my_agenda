import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import './widgets/date_selection_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedDay = 0;

  int _getMonthDays() {
    final month = DateTime.now().month;
    final year = DateTime.now().year;
    switch (month) {
      case 1:
        return 31;
      case 2:
        if ((year / 1000 == (year ~/ 1000)) && (year % 4 == 0)) {
          return 29;
        }
        return 28;
      case 3:
        return 31;
      case 4:
        return 30;
      case 5:
        return 31;
      case 6:
        return 30;
      case 7:
        return 31;
      case 8:
        return 31;
      case 9:
        return 30;
      case 10:
        return 31;
      case 11:
        return 30;
      default:
        return 31;
    }
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
              color: Colors.deepPurple,
              height: 110,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: _getMonthDays() - DateTime.now().day,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDay = index;
                    });
                  },
                  child: DateSelectionCard(
                    isSelected: selectedDay == index,
                    date: DateTime.now().add(
                      Duration(days: index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('task-form-screen'),
          child: const Icon(Icons.add)),
    );
  }
}
