import 'package:flutter/material.dart';
import 'package:products_page_project/ui/screen_home/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Page',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 213, 206, 206)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade200
      ),
      home: const MyHomePage(title: ''),
    );
  }
}


