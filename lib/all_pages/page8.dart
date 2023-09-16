// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class page8 extends StatefulWidget {
  @override
  State<page8> createState() => _page8State();
}

class _page8State extends State<page8> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List<String>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365)),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              eventLoader: (day) {
                // This function is used to load events for a given day.
                // You can return events for the specified day from _events.
                return _events[day] ?? [];
              },
            ),
            Column(
              children: [
                Text(
                  buildVaccineNameText(),
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showVaccineInputDialog(context);
                  },
                  child: Text('Add Vaccine Date'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String buildVaccineNameText() {
    if (_events[_selectedDay] == null) {
      return '';
    } else {
      return _events[_selectedDay]!.join(', ');
    }
  }

  void _showVaccineInputDialog(BuildContext context) {
    String vaccineName = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Vaccine Name'),
          content: TextFormField(
            onChanged: (value) {
              vaccineName = value;
            },
            decoration: InputDecoration(
              labelText: 'Vaccine Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (vaccineName.isNotEmpty) {
                  _addVaccineDate(vaccineName);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _addVaccineDate(String vaccineName) {
    setState(() {
      if (_events[_selectedDay] == null) {
        _events[_selectedDay] = [vaccineName];
      } else {
        _events[_selectedDay]!.add(vaccineName);
      }
    });
  }
}
