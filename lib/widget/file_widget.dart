import 'dart:io';

import 'package:amno/api/pdf_api.dart';
import 'package:amno/views/pdf_viewer.dart';
import 'package:amno/widget/button_widget.dart';
import 'package:flutter/material.dart';

class FileWidget extends StatelessWidget {

  final String path ;
  const FileWidget({
    required this.path,
    super.key
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(path),
        ButtonWidget(text: "Open", 
                    onClicked: () async {
                    final file = await PDFApi.loadAsset(path);
                    PDFApi.openPDF(context,file);
                    },)
      ],
    );
  }
  

}