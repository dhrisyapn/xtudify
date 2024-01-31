import 'package:flutter/material.dart';
//import firebaseauth

import 'package:firebase_auth/firebase_auth.dart';
import 'package:xtudify2/GetStart.dart';
import 'package:xtudify2/home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return //if user logined goto home else sign in
        FirebaseAuth.instance.currentUser == null ? GetStart() : HomePage();
  }
}
