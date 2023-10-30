import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pet/widgets/constant.dart';

class page8 extends StatefulWidget {
  @override
  _page8State createState() => _page8State();
}

class _page8State extends State<page8> {
  DateTime _selectedDay = DateTime.now();
  Map<String, List<String>> _events = {};
  final _prefsKey = 'vaccineData';

  @override
  void initState() {
    super.initState();
    _loadVaccineData();
  }

  Future<void> _loadVaccineData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_prefsKey);
    if (data != null) {
      final Map<String, dynamic> decodedData = json.decode(data);
      final Map<String, List<String>> typedData = decodedData.map((key, value) {
        return MapEntry(key, List<String>.from(value));
      });
      setState(() {
        _events = typedData;
      });
    }
  }

  Future<void> _saveVaccineData() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> encodedData = _events.map((key, value) {
      return MapEntry(key, value.toList());
    });
    await prefs.setString(_prefsKey, json.encode(encodedData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Calendar'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
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
                return _events[day.toIso8601String()] ?? [];
              },
              calendarStyle: CalendarStyle(
                markersMaxCount: 1,
              ),
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
                  child: Text('Add Vaccine Name'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteVaccineNameDialog(context);
                  },
                  child: Text('Delete Vaccine Name'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String buildVaccineNameText() {
    if (_events[_selectedDay.toIso8601String()] == null ||
        _events[_selectedDay.toIso8601String()]!.isEmpty) {
      return 'No vaccine for ${_selectedDay.toIso8601String().substring(0, 10)}';
    } else {
      return _events[_selectedDay.toIso8601String()]!.join(', ');
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
                  _saveVaccineData();
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
    final sanitizedVaccineName = vaccineName;

    if (_events[_selectedDay.toIso8601String()] == null) {
      _events[_selectedDay.toIso8601String()] = [sanitizedVaccineName];
    } else {
      _events[_selectedDay.toIso8601String()]!.add(sanitizedVaccineName);
    }

    setState(() {
      _events = Map.from(_events);
    });
  }

  void _showDeleteVaccineNameDialog(BuildContext context) {
    if (_events[_selectedDay.toIso8601String()] == null ||
        _events[_selectedDay.toIso8601String()]!.isEmpty) {
      // No vaccine names to delete for this date
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        List<String> vaccineNames = _events[_selectedDay.toIso8601String()]!;
        return AlertDialog(
          title: Text('Select Vaccine Name to Delete'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: vaccineNames
                .map(
                  (vaccineName) => ListTile(
                    title: Text(vaccineName),
                    onTap: () {
                      _deleteVaccineName(vaccineName);
                      Navigator.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  void _deleteVaccineName(String vaccineName) {
    if (_events[_selectedDay.toIso8601String()] != null) {
      _events[_selectedDay.toIso8601String()]!.remove(vaccineName);
      _saveVaccineData();
      setState(() {
        _events = Map.from(_events);
      });
    }
  }
}
