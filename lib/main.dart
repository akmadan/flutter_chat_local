import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/pages/chatscreen.dart';
import 'package:flutter_chat_ui/utils/colors.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primaryColor),
    );
  }
}
