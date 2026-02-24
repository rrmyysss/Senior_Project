import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Bu dosya flutterfire configure ile oluştu

void main() async {
  // Widget'ların Firebase'den önce hazır olduğundan emin oluyoruz
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i senin yapılandırmanla (firebase_options.dart) başlatıyoruz
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('MoodTune Firebase Bağlantısı Başarılı! 🎵')),
      ),
    );
  }
}
