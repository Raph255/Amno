
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

/// Cette classe construit un affichage d'un fichier PDF
/// Elle prend en paramètre le fichier PDF à afficher
/// Cette page est appelée par la fonction openPDF
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

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PDFViewerPage(file : file))
  );

