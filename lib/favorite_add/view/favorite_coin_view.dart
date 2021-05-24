import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteCoinsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection("Favorites")
              .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(""),
                );
              }
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.docs[index]['name'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    "USD: ${snapshot.data.docs[index]['price'].toString()}",
                                    style: TextStyle(fontSize: 15.0))),
                          ]);
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data.size,
                  ),
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
      ),
    );
  }
}
