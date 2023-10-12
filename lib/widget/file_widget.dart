
import 'dart:io';

import 'package:amno/api/pdf_api.dart';
import 'package:amno/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileWidget extends StatelessWidget {

  late String path ;
  late File file ;
  FileWidget.withFilePath({
    super.key,
    required this.path,
});

  FileWidget.withFileObject({
    super.key,
    required this.file,
  }) {
    path = "";
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text((path != "") ? basename(path) : basename(file.path)),
        ButtonWidget(text: "Open", 
                    onClicked: () async {
                    if (path != "") file = await PDFApi.loadAssetFile(path);
                    PDFApi.openPDF(context,file);
                    },)
      ],
    );
  }
  

}