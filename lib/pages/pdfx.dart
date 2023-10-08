
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import 'package:flutter_pdfview/flutter_pdfview.dart';



/// This class is used to display a button that will open the PDF file
class PDFXApp extends StatelessWidget {
  const PDFXApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfView(controller: pdfController),
                ),
              );
            },
            child: const Text('View PDF'),
          ),
        ),
      ),
    );
  }
}

final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/test.pdf'),
);

// Simple Pdf view with one render of page (loose quality on zoom)

Widget pdfView() => PdfView(
  controller: pdfController,
);


