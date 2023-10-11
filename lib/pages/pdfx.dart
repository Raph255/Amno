import 'dart:io';

import 'package:flutter/material.dart';

import 'package:amno/widget/button_widget.dart';
import 'package:amno/api/pdf_api.dart';
import 'package:amno/views/pdf_viewer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';



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
                    const path = 'assets/bail.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context,file);
                  },
                )
              ],
              )
              )

        ),
      ),
      );
    
  }
    void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PDFViewer(file : file))
  );
}




