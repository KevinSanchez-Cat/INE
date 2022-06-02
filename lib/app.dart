import 'package:flutter/material.dart';
import 'package:ine/src/ui/lista_people.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: ListViewPerson(),
        ));
  }
}
