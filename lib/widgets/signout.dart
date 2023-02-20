import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/key.dart';
import 'package:flutter/material.dart';

class SignoutWidget extends StatefulWidget {
  const SignoutWidget({Key? key}) : super(key: key);

  @override
  _SignoutWidgetState createState() => _SignoutWidgetState();
}

class _SignoutWidgetState extends State<SignoutWidget> {
  bool _isSigningOut = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningOut
        ? const CircularProgressIndicator()
        : Center(
          child: ElevatedButton(
      onPressed: () async {
          setState(() {
            _isSigningOut = true;
          });

          final response = await http.delete(Uri.parse(usuarioUrl));

          if (response.statusCode == 200) {
            print('Usuario desconectado com sucesso!');
          } else {
            print(
                'Falha ao desconectar usuario com status: ${response.statusCode}.');
          }

          setState(() {
            _isSigningOut = false;
          });
      },
      child: const Text('Desconectar'),
    ),
        );
  }
}
