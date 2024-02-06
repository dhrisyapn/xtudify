import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatefulWidget {
  String docid;
  ModulePage({super.key, required this.docid});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  TextEditingController nameController = TextEditingController();
  final String email = FirebaseAuth.instance.currentUser!.email
      .toString(); //current userinte email id
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module'),
      ),
      body: Stack(
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
                              FirebaseFirestore.instance.collection(email).add({
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
                                  side:
                                      BorderSide(width: 2, color: Colors.white),
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
        ],
      ),
    );
  }
}
