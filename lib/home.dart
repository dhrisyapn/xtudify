import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xtudify2/module.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  final String email = FirebaseAuth.instance.currentUser!.email
      .toString(); //current userinte email id
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Stack(
            children: [
              Positioned(
                bottom: 20,
                //move to center
                left: MediaQuery.of(context).size.width / 2 - 60,
                child: FloatingActionButton(
                  splashColor: Colors.white,
                  onPressed: () {
                    //show dialog box with text field and a gestore detector
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 44, 42, 42),
                          title: const Text(
                            'Add New',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'syne-bold',
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextField(
                                controller: nameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //add name and module to collection email
                                  FirebaseFirestore.instance
                                      .collection(email)
                                      .add({
                                    'name': nameController.text,
                                    'module': '0',
                                  });
                                  nameController.clear();
                                  Navigator.pop(context);
                                  //clear text field
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: double.infinity,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'syne-bold',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                        child: Image.asset(
                      'assets/logo.png',
                      height: 50,
                    )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  //get name and module from all documents of collection email
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(email)
                        .snapshots(),
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
                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: () {
                                //navigate  to module page using meterail page route
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModulePage(
                                      docid: document.id,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 87,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            document['name'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                          Text(
                                            document['module'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      //delete button
                                      GestureDetector(
                                        onTap: () {
                                          //delete document
                                          FirebaseFirestore.instance
                                              .collection(email)
                                              .doc(document.id)
                                              .delete();
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 2,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
