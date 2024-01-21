import 'package:flutter/material.dart';
import 'package:xtudify2/sigin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/hero.png'),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                ),
                      ),        
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 0),
                 child: TextField(decoration: InputDecoration(hintText: 'Full name',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                             focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                             ),
                             style: TextStyle(color: Colors.white,fontSize: 20),
                             ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(hintText: 'Email address',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                               focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                               ),
                               style: TextStyle(color: Colors.white,fontSize: 20),
                               ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                 focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                 ),
                                 style: TextStyle(color: Colors.white,fontSize: 20),
                                 obscureText: true,
                                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(hintText: 'Re-enter Password',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                   focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                   ),
                                   style: TextStyle(color: Colors.white,fontSize: 20),
                                   obscureText: true,
                                   ),
               ),
               
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30),
                 child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),),
                  ),
                  
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 13),
                 child: Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 5),
                 child: GestureDetector(
                  onTap: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>sigin()));
                  },
                   child: Text(
                    "Sign in here",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                   
                    ),
                    ),
                 ),
               )
               
               ],
               
               
            
          ),
        ),
      ),
    );
  }
}