import 'package:flutter/material.dart';
import 'package:xtudify2/login.dart';
import 'package:xtudify2/sigin.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Image.asset('assets/hero.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                child: Container(
              width: 300,
              height: 40,
              decoration:     BoxDecoration(
                      borderRadius: BorderRadius.circular(5), 
                      color: Colors.white),
                      child: Center(
                        child: Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                )
                
                        ),
                      ),
              ),
              ),
              
            )
            
          ],
        ),
      ),
    );
    
  }
}