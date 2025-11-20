import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/auth/data/moodle/user_moodle.dart';
import 'package:todo_app/core/network/res_firebase.dart';

abstract class FBSAUser {
  static CollectionReference<UserMoodle> get _getCollection {
    return FirebaseFirestore.instance
        .collection(UserMoodle.collection)
        .withConverter(
          fromFirestore: (snap, _) => UserMoodle.fromJson(snap.data()!),
          toFirestore: (UserMoodle, _) => UserMoodle.toJson(),
        );
  }

  static Future<void> addUser(UserMoodle user) async {
    try {
      await _getCollection.doc(user.id).set(user);
    } catch (e) {
      throw "error from added user$e";
    }
  }

  static Future<ResFirbase<UserMoodle>> registerUser(UserMoodle user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email ?? "",
            password: user.password ?? "",
          );

      user.id = credential.user?.uid;
      await _getCollection.doc(user.id).set(user);
      return SuccessFB(data: user);
    } catch (e) {
      return ErrorFB(e.toString());
    }
  }

  static Future<ResFirbase<UserCredential>> loginUser({required
      String email,required String password}) async {
    try {
           final userCredential=  await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
           return SuccessFB(data: userCredential);  
    } catch (e) {
      return ErrorFB(e.toString());
    }
  }
}
