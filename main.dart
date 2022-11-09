import 'package:flutter/material.dart';
import 'package:list_view_app/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorSchemeSeed: Colors.blueGrey, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: ListPage(title: 'Dismissible Example'),
    );
  }
}
