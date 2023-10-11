import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import 'package:amno/widget/button_widget.dart';
import 'package:amno/api/pdf_api.dart';
import 'package:amno/pages/pdf_viewer.dart';



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
  
}

final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/test.pdf'),
);

// Simple Pdf view with one render of page (loose quality on zoom)

Widget pdfView() => PdfView(
  controller: pdfController,
);


