import 'package:flutter/material.dart';
import 'package:learn_dummy/providers/mhs_provider.dart';
import 'package:provider/provider.dart';

class MahasiswaListScreen extends StatefulWidget {
  final String apiUrl;

  const MahasiswaListScreen({super.key, required this.apiUrl});

  @override
  _MahasiswaListScreenState createState() => _MahasiswaListScreenState();
}

class _MahasiswaListScreenState extends State<MahasiswaListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MahasiswaProvider>(context, listen: false)
        .fetchMahasiswa(widget.apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa List'),
      ),
      body: Consumer<MahasiswaProvider>(
        builder: (context, mahasiswaProvider, child) {
          if (mahasiswaProvider.mahasiswa.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: mahasiswaProvider.mahasiswa.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaProvider.mahasiswa[index];
                return ListTile(
                  title: Text(
                    mahasiswa.text,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implementasi aksi ketika item di-tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
