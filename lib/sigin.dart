import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xtudify2/login.dart';

class sigin extends StatefulWidget {
  const sigin({super.key});

  @override
  State<sigin> createState() => _siginState();
}

class _siginState extends State<sigin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Image.asset('assets/hero.png'),
               Padding(
                 padding: const EdgeInsets.only(top: 130),
                 child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),),
               ),
                Text(
                  "Sigin into your account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 10),
                    child: TextField(
                      
                      decoration: InputDecoration(hintText: "Email address",hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                     focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                     ),
                     style: TextStyle(color: Colors.white,fontSize: 20),
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15),
                    child: 
                    TextField(decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                       focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                       ),
                       style: TextStyle(color: Colors.white,fontSize: 20),
                       obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15),
                    child: Container(
                      width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    child: Center(
                      child: Text(
                        "Sigin",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        ),
                    ),
                    
                    ),
                  ),
                  Text(
                  "Doesn't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text(
                      "Sign up here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                     
                      ),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}