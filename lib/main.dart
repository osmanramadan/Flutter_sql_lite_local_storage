import 'package:flutter/material.dart';
import 'package:sql_lite/screens/homepage.dart';
import 'package:sql_lite/widgets/add_note.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sql ',
      home:const Homepage(),
      routes: {
        "addnote":((context) => const AddNote()),
        "homepage":((context) => const Homepage())
      },
    );
  }
  }
