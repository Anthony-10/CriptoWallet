import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddCoinsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCoins(String name, var Price) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      if (uid != null) {
        await _firestore
            .collection("Favorites")
            .doc()
            .set({'name': name, 'price': Price, 'userId': uid});
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }
}
