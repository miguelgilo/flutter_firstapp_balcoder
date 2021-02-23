import 'package:flutter/material.dart';
import 'package:hello_word/ui/home_page.dart';
import 'package:hello_word/ui/provider/provider_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: ProviderList(),
      title: "MI TITULO",
    );
  }
}
