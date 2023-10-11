import 'dart:io';

import 'package:amno/views/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Cette classe API comprend des méthodes de gestion de PDF
/// pour cela, elle offre plusieurs méthodes :
/// - loadAsset : permet de charger les octets d'un fichier à partir du chemin   
/// - _storeFile : permet de stocker les octets du fichier dans un objet File
/// - openPDF : permet d'ouvrir le fichier PDF dans une nouvelle page PDFViewer
class PDFApi {
  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path,bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file ;
  }

  static void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PDFViewer(file : file))
  );
  
}