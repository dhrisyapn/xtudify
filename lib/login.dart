import 'package:flutter/material.dart';
import 'package:xtudify2/sigin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible=false;//eye icon varan
  var eyeicon=const Icon(Icons.visibility_off);
  void toggleicon(){
    
    setState(() {
      visible=!visible;
      if(!visible){
        eyeicon=const Icon(Icons.visibility);
    }
    else{
     
        eyeicon=const Icon(Icons.visibility_off);
    }

    });
  }//eye icon varan
  //eye icon function for renter password
  bool visible1=false;//eye icon varan
  var eyeicon1=const Icon(Icons.visibility_off);
  void toggleicon1(){
    
    setState(() {
      visible1=!visible1;
      if(!visible1){
        eyeicon1=const Icon(Icons.visibility);
    }
    else{
     
        eyeicon1=const Icon(Icons.visibility_off);
    }

    });
  }//eye icon varan
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
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                ),
                      ),        
              ),
               const Padding(
                 padding: EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 0),
                 child: TextField(decoration: InputDecoration(hintText: 'Full name',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                             focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                             ),
                             style: TextStyle(color: Colors.white,fontSize: 20),
                             ),
               ),
               const Padding(
                 padding: EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(hintText: 'Email address',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                               focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                               ),
                               style: TextStyle(color: Colors.white,fontSize: 20),
                               ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: toggleicon, icon: eyeicon),
                  hintText: 'Password',hintStyle: const TextStyle(color: Colors.white,fontSize: 20,),
                                 enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                 focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                 ),
                                 style: const TextStyle(color: Colors.white,fontSize: 20),
                                 obscureText: visible,
                                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: toggleicon1, icon: eyeicon1),
                  hintText: 'Re-enter Password',hintStyle: const TextStyle(color: Colors.white,fontSize: 20,),
                                   enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                   focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                   ),
                                   style: const TextStyle(color: Colors.white,fontSize: 20),
                                   obscureText: visible1,
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
                  child: const Center(
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
               const Padding(
                 padding: EdgeInsets.only(top: 13),
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
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const sigin()));
                  },
                   child: const Text(
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