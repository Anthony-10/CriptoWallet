import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  RxBool loginStatus;

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
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  )),
              SizedBox(
                width: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .where("userId",
                        isEqualTo: FirebaseAuth.instance.currentUser.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Check your connection"),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.size,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 20,
                              width: 20,
                              margin: const EdgeInsets.all(20.0),
                              child: Column(children: [
                                Text(
                                  snapshot.data.docs[index]['firstName']
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data.docs[index]['email']
                                    .toString()),
                              ]),
                            );
                          },
                        );
                      }
                    }
                    return null;
                  } else {
                    return const Center(
                      child: Text("loading..."),
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 30.0),
          //Divider(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
                child: Column(
                  children: [
                    Card(
                      child: InkWell(
                        child: ListTile(
                          onTap: () {},
                          title: const Text("Settings"),
                          leading: const Icon(
                            Icons.settings,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLoginState();
  // }

  void getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    loginStatus = prefs.getBool("loginWithFinger").obs;
  }
}
