import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider = StateNotifierProvider<UserProvider, User?>(
  (_) => UserProvider(),
);

class UserProvider extends StateNotifier<User?> {
  UserProvider() : super(null) {
    _initialize();
  }

  void _initialize() async {
    final firebaseAuth = FirebaseAuth.instance;
    state = firebaseAuth.currentUser;
    firebaseAuth.authStateChanges().listen((user) {
      state = user;
    });
  }
}
