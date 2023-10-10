import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFApp extends StatelessWidget {
  const PDFApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  builder: (context) => const MyPdfViewer(pdfPath: 'lib\\assets\\test.pdf'),
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

/// This class is used to display a PDF file
/// It takes a String as a parameter which is the path of the PDF file
/// It returns a Scaffold with an AppBar and a PDFView
/// The PDFView is a widget from the flutter_pdfview package
class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({super.key, required this.pdfPath});

  final String pdfPath;  
  @override
  State<MyPdfViewer> createState() => _MyPdfViewerState();
}
class _MyPdfViewerState extends State<MyPdfViewer> {
  late PDFViewController pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My PDF Document"),
      ),
      body: PDFView(
        filePath: widget.pdfPath,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        onError: (error) {
          print(error);
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      ),
    );
  }
}

