import 'package:ar_furniture_app/core/constants/firebase_constants.dart';
import 'package:ar_furniture_app/core/providers/firebase_providers.dart';
import 'package:ar_furniture_app/core/utils/custom_firebase_exception.dart';
import 'package:ar_furniture_app/core/utils/error_mixin.dart';
import 'package:ar_furniture_app/core/utils/firebase_failure.dart';
import 'package:ar_furniture_app/core/utils/firestore_exception.dart';
import 'package:ar_furniture_app/features/auth/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider<AuthenticationService>(
  (ref) => AuthenticationService(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(firebaseAuthProvider),
      googleSignIn: ref.read(googleSignInProvider),
      facebookAuth: ref.read(facebookSignInProvider)),
);

/// Responsible for login, register, logout, delete account, etc.
class AuthenticationService with ErrorMixin {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthenticationService(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn,
      required FacebookAuth facebookAuth})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn,
        _facebookAuth = facebookAuth;

  Stream<User?> get idTokenChanges => _auth.idTokenChanges();

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<UserModel> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user != null) {
        final UserModel userModel = UserModel(
            id: user.uid, fullName: fullName, email: user.email!, photoUrl: '');
        await _users.doc(user.uid).set(userModel.toMap());
        return userModel;
      } else {
        throw handleError(
          FirestoreException(message: 'Unable to register at the moment'),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          final UserModel userModel = UserModel(
            id: user.uid,
            fullName: user.displayName!,
            email: user.email!,
            photoUrl: user.photoURL ?? '',
          );
          await _users.doc(user.uid).set(userModel.toMap());
          return userModel;
        } else {
          throw handleError(
            FirestoreException(message: 'Unable to register at the moment'),
          );
        }
      } else {
        throw handleError(
          FirestoreException(message: 'Unable to register at the moment'),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<UserModel> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();
      if (loginResult.accessToken != null) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          final UserModel userModel = UserModel(
            id: user.uid,
            fullName: user.displayName!,
            email: user.email!,
            photoUrl: user.photoURL ?? '',
          );
          await _users.doc(user.uid).set(userModel.toMap());
          return userModel;
        } else {
          throw handleError(
            FirestoreException(message: 'Unable to register at the moment'),
          );
        }
      } else {
        throw handleError(
          FirestoreException(message: 'Unable to register at the moment'),
        );
      }
    } catch (error) {
      debugPrint('error: $error');
      throw handleError(error);
    }
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> deleteAccount() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
        return true;
      } else {
        throw CustomFirebaseException(
          failure: FirebaseFailure.unknown(
            message: 'User not found',
          ),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      await GoogleSignIn().signOut();
      return true;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<bool> updateProfilePicture({required String url}) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(url);
        return true;
      } else {
        throw CustomFirebaseException(
          failure: FirebaseFailure.unknown(
            message: 'User not found',
          ),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  //check if token expired and change password
  Future<bool> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final UserCredential userCredential =
            await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(
            email: user.email!,
            password: oldPassword,
          ),
        );
        if (userCredential.user != null) {
          await user.updatePassword(newPassword);
          return true;
        } else {
          throw handleError(
            FirestoreException(message: 'Unable to reauthenticate.'),
          );
        }
      } else {
        throw handleError(
          FirestoreException(message: 'User not found.'),
        );
      }
    } catch (error) {
      throw handleError(error);
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((snapshot) {
      return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    });
  }
}
