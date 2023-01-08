import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes/data/models/patient.dart';

class PatientDataSource {
  static const String _baseUrl =
      'https://api.jsonbin.io/v3/b/63b9ecd515ab31599e303983';

  Future<Patient> getPatient() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print(response);
    if (response.statusCode == 200) {
      return Patient.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load apis');
    }
  }
}
