import 'package:flutter/material.dart';
import 'package:learn_dummy/providers/mhs_provider.dart';
import 'package:learn_dummy/screens/mahasiswa_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MahasiswaProvider()),
      ],
      child: const MyApp(
          apiUrl:
              'https://api-frontend.kemdikbud.go.id/hit_mhs/abiel%20zulio%20maseida'), // Provide a default apiUrl
    ),
  );
}

class MyApp extends StatelessWidget {
  final String apiUrl;

  const MyApp({super.key, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahasiswa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MahasiswaListScreen(apiUrl: apiUrl),
    );
  }
}
