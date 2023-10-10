import 'package:amno/pages/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

import 'package:amno/widget/button_widget.dart';




/// This class is used to display a button that will open the PDF file
class PDFXApp extends StatelessWidget {
  const PDFXApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amno',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column (
              children: [
                ButtonWidget(
                  text: 'Asset PDF',
                  onClicked: () async {
                    const path = 'assets/test.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context,file);
                  },
                )
              ],
              )
          // child : ElevatedButton(
          //    onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => PdfView(controller: pdfController),
          //       ),
          //     );
          //   },
          //   child: const Text('View PDF'),
          //   )
              )

        ),
      ),
      );
    
  }
  
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PDFViewerPage(file : file))
  );
}

class PDFViewerPage extends StatefulWidget{
  final File file ;

  const PDFViewerPage({
    super.key,
    required this.file,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage>{
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: PDFView(
        filePath: widget.file.path,
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


