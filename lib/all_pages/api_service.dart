import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'YOUR_API_BASE_URL';

  static Future<Map<String, dynamic>> bookAppointment(
      String doctorId, DateTime appointmentDate) async {
    final url = Uri.parse('$baseUrl/bookAppointment');
    final response = await http.post(
      url,
      body: {
        'doctorId': doctorId,
        'appointmentDate': appointmentDate.toIso8601String(),
      },
    );

    if (response.statusCode == 200) {
      return {'success': true, 'message': 'Appointment booked successfully'};
    } else {
      return {
        'success': false,
        'message': 'Failed to book appointment. Please try again.'
      };
    }
  }
}
