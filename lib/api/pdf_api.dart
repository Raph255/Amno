import 'dart:io';

import 'package:amno/views/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// Note : accès aux fichiers de mon téléphone : 
// getExternalStorageDirectory()
// ou file_picker


/// Cette classe API comprend des méthodes de gestion de PDF et du stockage
/// pour cela, elle offre plusieurs méthodes async qui s'appelle entre elles
/// pour la gestion des tâches asynchrones	liées au chargement des fichiers PDF
/// et à leur stockage
/// 
/// ==================== Gestions des fichiers PDF ====================
/// - loadAsset : permet de charger les octets d'un fichier à partir du chemin   
/// - _storeFile : permet de stocker les octets du fichier dans un objet File
/// - openPDF : permet d'ouvrir l'objet File contenant le fichier PDF dans une nouvelle page PDFViewer
/// 
/// ==================== Gestion du stockage ====================
/// 
class PDFApi {

  // ==================== Gestions des fichiers PDF ====================

  /// Permet de charger les octets d'un fichier à partir du chemin
  /// Elle prend en paramètre le chemin du fichier
  /// Elle retourne un objet File en utilisant la méthode _storeFile
  static Future<File> loadAssetFile(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path,bytes);
  }

  /// Permet de stocker les octets du fichier dans un objet File
  /// Elle prend en paramètre le chemin du fichier et les octets du fichier
  /// Elle retourne un objet File
  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file ;
  }

  /// Permet d'ouvrir l'objet File contenant le fichier PDF dans une nouvelle page PDFViewer
  /// Elle prend en paramètre le contexte de l'application et l'objet File
  static void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> PDFViewer(file : file))
  );


  // ==================== Gestion du stockage ====================
  /// Permet de charger le répertoire assets de l'application qui
  /// contient les fichiers PDF
  static Future<List<FileSystemEntity>> loadAssetDirectory() async {
      final dir = await getApplicationDocumentsDirectory();
      List<FileSystemEntity> filesList = dir.listSync(recursive : true);
      return filesList;
  }
  
}