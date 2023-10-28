import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/constant.dart';

class page8 extends StatefulWidget {
  @override
  State<page8> createState() => _page8State();
}

class _page8State extends State<page8> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List<String>> _events = {};
  final firebaseDatabaseURL =
      'https://petcare-e6024-default-rtdb.asia-southeast1.firebasedatabase.app/';

  @override
  void initState() {
    super.initState();
    _fetchVaccineData();
  }

  Future<void> _fetchVaccineData() async {
    final formattedDate = _selectedDay.toIso8601String().substring(0, 10);
    final response = await http
        .get(Uri.parse('$firebaseDatabaseURL/vaccine/$formattedDate.json'));

    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is Map<String, dynamic>) {
        final List<String> vaccineNames =
            responseData.values.cast<String>().toList();
        setState(() {
          _events[_selectedDay] = vaccineNames;
        });
      } else {
        print('Response data is not in the expected format (not a Map).');
      }
    } else if (response.statusCode == 404) {
      print('No vaccine data found for this date.');
    } else {
      print('Failed to fetch vaccine data from Firebase');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
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
                _fetchVaccineData();
              },
              eventLoader: (day) {
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

  void _addVaccineDate(String vaccineName) async {
    final formattedDate = _selectedDay.toIso8601String().substring(0, 10);
    final sanitizedVaccineName = vaccineName.replaceAll(RegExp(r'[^\w]'), '');

    final jsonData = {
      'vaccineName': sanitizedVaccineName,
    };

    final response = await http.post(
      Uri.parse('$firebaseDatabaseURL/vaccine/$formattedDate.json'),
      body: json.encode(jsonData),
    );

    if (response.statusCode == 200) {
      setState(() {
        if (_events[_selectedDay] == null) {
          _events[_selectedDay] = [sanitizedVaccineName];
        } else {
          _events[_selectedDay]!.add(sanitizedVaccineName);
        }
      });
    } else {
      print('Failed to add vaccine date to Firebase');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }
}
