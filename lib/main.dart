import 'package:amno/pages/HomePage.dart';
import 'package:amno/pages/pdfx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Amno',
                      home:  HomePage(title: "Amno",),
                      );
  }
}

