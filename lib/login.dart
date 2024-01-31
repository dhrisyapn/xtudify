import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xtudify2/home.dart';
import 'package:xtudify2/sigin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController fullname = TextEditingController();
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
                Padding(
                 padding: EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 0),
                 child: TextField(
                  controller: fullname,
                  decoration: InputDecoration(hintText: 'Full name',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                             enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                             focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                             ),
                             style: TextStyle(color: Colors.white,fontSize: 20),
                             ),
               ),
                Padding(
                 padding: EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email address',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                               enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                               focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                               ),
                               style: TextStyle(color: Colors.white,fontSize: 20),
                               ),
               ),
               Padding(
                 padding:  EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
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
                 padding:  EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 15),
                 child: TextField(
                  controller: repasswordController,
                  decoration: InputDecoration(
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
                 child: GestureDetector(
                  onTap: () async {
                    if (fullname.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          repasswordController.text.isEmpty) {
                        //show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please fill all fields',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            backgroundColor: Color(0xFFFF6D00),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        //check email is valid using regex
                        if (RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(emailController.text)) {
                          //check password and confirm password are same
                          if (passwordController.text ==
                              repasswordController.text) {
                            //sign up user using firebase
                           await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) async {
                              //add fullname to collection 'userdata' to doc email address of user to firestore
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(emailController.text)
                                  .set({
                                'name': fullname.text,
                              });

                             //naviagte to homepage()
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                             
                            }).catchError((e) {
                              //show snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Something went wrong',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  backgroundColor: Color(0xFFFF6D00),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            });
                          } else {
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password and Confirm Password are not same',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                backgroundColor: Color(0xFFFF6D00),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } else {
                          //show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter a valid email address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              backgroundColor: Color(0xFFFF6D00),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    
                  },
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