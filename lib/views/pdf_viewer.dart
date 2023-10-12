
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

/// Cette classe construit un affichage d'un fichier PDF
/// Elle prend en paramètre le fichier PDF à afficher
/// Cette page est appelée par la fonction openPDF (méthode de la class PDFXApp - pdfx.dart)
class PDFViewer extends StatefulWidget{
  final File file ;

  const PDFViewer({
    super.key,
    required this.file,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewer>{
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.path),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}


