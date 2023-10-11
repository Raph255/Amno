import 'package:amno/widget/file_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  
  HomeView({ Key? key}) : super(key:key);

  final List files = [
    'assets/bail.pdf',
    'assets/lettre.pdf',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
            ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return FileWidget(path: files[index],);
                }) 
      );
  }
}