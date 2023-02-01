import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje, String titulo ) {
  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
  
}
