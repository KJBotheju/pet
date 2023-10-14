import 'package:flutter/material.dart';
import 'api_service.dart';
import '../widgets/constant.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String? selectedDoctorId;
  Doctor? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.black,
        title: Text('Select Doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedDoctorId,
              hint: Text('Select Doctor'),
              onChanged: (newValue) {
                setState(() {
                  selectedDoctorId = newValue;
                  selectedDoctor = getDoctorById(newValue);
                });
              },
              items: [
                DropdownMenuItem(
                  value: 'doctor1', // Unique value for Doctor 1
                  child: Text('Doctor 1'),
                ),
                DropdownMenuItem(
                  value: 'doctor2', // Unique value for Doctor 2
                  child: Text('Doctor 2'),
                ),
                // Add more doctors as needed
              ],
            ),
            if (selectedDoctor != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Doctor Name: ${selectedDoctor!.name}'),
                  Text('Specialization: ${selectedDoctor!.specialization}'),
                  Text('Doctor Fee: \$${selectedDoctor!.doctorFee.toString()}'),
                  Text(
                      'Appointment Fee: \$${selectedDoctor!.appointmentFee.toString()}'),
                  Text('Available Time Slots:'),
                  for (var slot in selectedDoctor!.availableTimeSlots)
                    Text(slot),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Doctor getDoctorById(String? doctorId) {
    final doctor = doctors.firstWhere(
      (doctor) => doctor.id == doctorId,
      orElse: () => Doctor(
        id: '',
        name: 'Unknown Doctor',
        specialization: 'Unknown Specialization',
        doctorFee: 0.0,
        appointmentFee: 0.0,
        availableTimeSlots: [],
      ),
    );
    return doctor;
  }
}

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final double doctorFee;
  final double appointmentFee;
  final List<String> availableTimeSlots;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.doctorFee,
    required this.appointmentFee,
    required this.availableTimeSlots,
  });
}

final List<Doctor> doctors = [
  Doctor(
    id: 'doctor1',
    name: 'Doctor 1',
    specialization: 'Specialization 1',
    doctorFee: 100,
    appointmentFee: 50,
    availableTimeSlots: ['9:00 AM', '10:00 AM', '11:00 AM'],
  ),
  Doctor(
    id: 'doctor2',
    name: 'Doctor 2',
    specialization: 'Specialization 2',
    doctorFee: 120,
    appointmentFee: 60,
    availableTimeSlots: ['2:00 PM', '3:00 PM', '4:00 PM'],
  ),
  // Add more doctors as needed
];
