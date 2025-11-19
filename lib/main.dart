import 'package:flutter/material.dart';
import 'package:note_app/home.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: HomePage()
      ),
    );
  }
}