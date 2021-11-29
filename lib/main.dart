import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/pages/chatscreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: ChatScreen(),
    );
  }
}
