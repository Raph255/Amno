import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Cette classe API permet de charger un fichier PDF à partir du chemin
/// pour celle, elle implémente deux méthodes :
/// - loadAsset : permet de charger les octets d'un fichier à partir du chemin   
/// - _storeFile : permet de stocker les octets du fichier dans un objet File
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
  
}