import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/auth/view/login.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
            child: Text("profile", style: TextStyle(color: Colors.black))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              authController.signOut((){
                Get.toEnd(() => Login());
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("Users")
            .where("userId",isEqualTo:FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.isBlank) {
              return const Center(
                child: Text(""),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: Colors.black12,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  )),
                              SizedBox(width: 20),
                              Column(children: [
                                Text(
                                  snapshot.data.docs[index]['firstName']
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data.docs[index]['email']
                                    .toString()),
                              ])
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          child: ListTile(
                            onTap: () {},
                            title: const Text("Settings"),
                            leading: const Icon(
                              Icons.settings,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ]);
                },
              );
            }
            return null;
          } else {
            return const Center(
              child: Text("loading..."),
            );
          }
        },
      ),
    );
  }
}
