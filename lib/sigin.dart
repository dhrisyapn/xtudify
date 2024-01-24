import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xtudify2/login.dart';

class sigin extends StatefulWidget {
  const sigin({super.key});

  @override
  State<sigin> createState() => _siginState();
}

class _siginState extends State<sigin> {
  bool visible=false;//eye icon varan
  var eyeicon=Icon(Icons.visibility_off);
  void toggleicon(){
    
    setState(() {
      visible=!visible;
      if(!visible){
        eyeicon=Icon(Icons.visibility);
    }
    else{
     
        eyeicon=Icon(Icons.visibility_off);
    }

    });
  }//eye icon varan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,//keybord edukkumpol yellow line varathirikkan
      body:  
      SafeArea(//status bar inte thazhe varan
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
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: toggleicon, icon: eyeicon),//eye icon varan
                        hintText: "Password",hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                       focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                       ),
                       style: TextStyle(color: Colors.white,fontSize: 20),
                      
                       obscureText: visible,//eye icone varan
                       
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15),
                    child: Container(
                      width: double.infinity,//screen full botton varan
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
                  GestureDetector(//tap function  nu vendi
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