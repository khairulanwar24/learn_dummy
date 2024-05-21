import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mahasiswa_models.dart';

class ApiService {
  static Future<List<Mahasiswa>> fetchMahasiswa(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['mahasiswa'];
      List<Mahasiswa> mahasiswaList =
          body.map((dynamic item) => Mahasiswa.fromJson(item)).toList();
      return mahasiswaList;
    } else {
      throw Exception('Failed to load mahasiswa');
    }
  }
}
