import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class topic extends StatefulWidget {
  String docid;
  String docid2;
  topic({super.key, required this.docid, required this.docid2});

  @override
  State<topic> createState() => _topicState();
}

class _topicState extends State<topic> {
  TextEditingController nameController = TextEditingController();
  final String email = FirebaseAuth.instance.currentUser!.email
      .toString(); //current userinte email id
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('topic'),
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

                              FirebaseFirestore.instance
                                  .collection(email)
                                  .doc(widget.docid2)
                                  .collection('modules')
                                  .doc(widget.docid)
                                  .collection('topic')
                                  .add({
                                'name': nameController.text,
                              });
                              //display 'module' value from collection email and doc with id widget.docid
                              FirebaseFirestore.instance
                                  .collection(email)
                                  .doc(widget.docid2)
                                  .collection('modules')
                                  .doc(widget.docid)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  print(
                                      'Document data: ${documentSnapshot.data()}');
                                  // Get the current module value as a string
                                  Map<String, dynamic>? data = documentSnapshot
                                      .data() as Map<String, dynamic>?;

                                  String moduleValue = data?['topic'];

                                  // Convert the string to an integer and increment it
                                  int incrementedValue =
                                      int.parse(moduleValue) + 1;
                                  // Convert the incremented integer back to a string
                                  String updatedModuleValue =
                                      incrementedValue.toString();
                                  // Update the document with the incremented module value
                                  FirebaseFirestore.instance
                                      .collection(email)
                                      .doc(widget.docid2)
                                      .collection('modules')
                                      .doc(widget.docid)
                                      .update({
                                    'topic': updatedModuleValue.toString(),
                                  });
                                } else {
                                  print(
                                      'Document does not exist on the database');
                                }
                              });
                              nameController.clear();
                              Navigator.pop(context);
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
          //get name and topicfrom all documents in collection email,docid document
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(email)
                .doc(widget.docid2)
                .collection('modules')
                .doc(widget.docid)
                .collection('topic')
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
              return Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: snapshot.data!.docs.map((document) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        width: double.infinity,
                        height: 87,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                ],
                              ),
                              //delete button
                              GestureDetector(
                                onTap: () {
                                  //delete document
                                  FirebaseFirestore.instance
                                      .collection(email)
                                      .doc(widget.docid2)
                                      .collection('modules')
                                      .doc(widget.docid)
                                      .collection('topic')
                                      .doc(document.id)
                                      .delete();
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 2, color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
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
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
