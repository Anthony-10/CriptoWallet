import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  User get user => _firebaseUser.value;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;


  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> createUser(
      {String email, String password, String firstName}) async {
    try {
      // String uid = FirebaseAuth.instance.currentUser.uid;
      // final CollectionReference reference =
      //     FirebaseFirestore.instance.collection("Users");
      //
      // Map<String, String> userdata = {
      //   "First Name": firstName,
      //   "Email": email,
      //   'userId': uid
      // };

      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      // final FirebaseFirestore _firestores = FirebaseFirestore.instance;
      // await _firestores
      //     .collection("Users")
      //     .doc()
      //     .set({"First Name": firstName,
      //   "Email": email,
      //   'userId': uid});

      {
        addUserInfo(email,firstName);
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepOrange);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> addUserInfo(String email, String firstName) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _fireStore
            .collection("Users")
            .doc()
            .set({'email': email, 'firstName': firstName, 'userId': uid});
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Adding User Info", e.message,
          snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.deepOrange,);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logIn({String email, String password,functionOnSuccess}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      functionOnSuccess();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error login account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error signOut account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }
}
