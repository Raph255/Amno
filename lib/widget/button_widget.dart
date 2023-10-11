import 'package:flutter/material.dart';

/// Cette classe construit un bouton qui sera utilisé pour ouvrir le fichier PDF
/// Elle prend en paramètre :
/// - text : le texte du bouton
/// - onClicked : la fonction qui sera exécutée lors du clic sur le bouton
/// (a modifier si besoin)
class ButtonWidget extends StatelessWidget {
  final String text ;
  final VoidCallback onClicked ;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    super.key
  }) ;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      maximumSize: const Size.fromHeight(50),
    ), 
    onPressed: onClicked,
    child: Text(text,style: const TextStyle(fontSize: 20)
    ),
    );
}