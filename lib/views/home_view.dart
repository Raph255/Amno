import 'dart:io';

import 'package:amno/widget/file_widget.dart';
import 'package:flutter/material.dart';

/// Cette classe représente la page d'accueil de l'application
/// Elle s'affiche lors du lancement de l'application accompagnée de la page des favoris
/// C'est ici qu'est initialisée la liste des fichiers PDF de l'application :
/// 
class HomeView extends StatelessWidget {
  
  late List<FileSystemEntity> listFiles ;
  final List files = [
    'assets/bail.pdf',
    'assets/lettre.pdf',
  ];
  
  HomeView({ Key? key}) : super(key:key) {
    listFiles = Directory('/data/user/0/com.example.amno/app_flutter/').listSync();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: // Peut-être utiliser Padding pour mise en forme
            ListView.builder(

              //itemCount: files.length,
              itemCount : listFiles.length,
              itemBuilder: (context, index) {
                //return FileWidget(path: files[index]);
                return (listFiles[index] is File) ? FileWidget.withFileObject(file: (listFiles[index] as File)) : const Text("nope");
                }) 
      );
  }
}