import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String email = FirebaseAuth.instance.currentUser!.email
      .toString(); //current userinte email id
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/logo.png',
              height: 50,
            )),
            //get name and module from all documents of collection email
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection(email).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //if no data in collection then text 'no data'
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'syne-bold',
                      ),
                    ),
                  );
                }
                return Column(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            document['name'],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            document['module'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
