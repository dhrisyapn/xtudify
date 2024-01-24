import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xtudify2/GetStart.dart';
import 'package:xtudify2/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        scaffoldBackgroundColor: Color(0xff030303),
        useMaterial3: true,
      ),
      home: GetStart(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

