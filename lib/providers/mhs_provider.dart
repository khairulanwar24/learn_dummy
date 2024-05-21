import 'package:flutter/material.dart';
import 'package:learn_dummy/models/mahasiswa_models.dart';
import 'package:learn_dummy/services/api-services.dart';

class MahasiswaProvider with ChangeNotifier {
  List<Mahasiswa> _mahasiswa = [];
  Mahasiswa? _selectedMahasiswa;

  List<Mahasiswa> get mahasiswa => _mahasiswa;
  Mahasiswa? get selectedMahasiswa => _selectedMahasiswa;

  Future<void> fetchMahasiswa(String apiUrl) async {
    _mahasiswa = await ApiService.fetchMahasiswa(apiUrl);
    notifyListeners();
  }

  void selectMahasiswa(Mahasiswa mahasiswa) {
    _selectedMahasiswa = mahasiswa;
    notifyListeners();
  }
}
