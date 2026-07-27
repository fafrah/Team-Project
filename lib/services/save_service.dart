import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/game_state.dart';

class SaveService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveGame(GameState gameState) async {
    final user = _auth.currentUser;

    if (user == null) return;

    await _firestore
        .collection("gameSaves")
        .doc(user.uid)
        .set(gameState.toMap());
  }

  Future<GameState?> loadGame() async {
    final user = _auth.currentUser;

    if (user == null) return null;

    final doc = await _firestore.collection("gameSaves").doc(user.uid).get();

    if (!doc.exists) {
      return null;
    }

    return GameState.fromMap(doc.data()!);
  }

  Future<void> deleteSave() async {
    final user = _auth.currentUser;

    if (user == null) return;

    await _firestore.collection("gameSaves").doc(user.uid).delete();
  }
}
