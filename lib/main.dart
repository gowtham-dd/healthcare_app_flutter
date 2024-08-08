import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medicallapp/home_page.dart';
import 'package:medicallapp/event_data_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventDataModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
