import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_bloc/application/features/auth/model/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        Future.delayed(Duration(seconds: 1)).then((value) async {
          user = _auth.currentUser;
        });

        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
    on<SignupEvent>((event, state) async {
      emit(AuthLoading());
      try {
        print(event.user.toString());
        final userCrdential = await _auth.createUserWithEmailAndPassword(
          email: event.user.email!.toString(),
          password: event.user.password!.toString(),
        );
        final user = userCrdential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection("users").doc(user.uid).set({
            'uId': user.uid,
            'email': user.email,
            'name': event.user.name,
            'phone': event.user.phone,
            'createdAt': DateTime.now()
          });
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
    on<LogoutEvent>((event, state) async {
      try {
        await _auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
    on<LoginEvent>((event, state) async {
      try {
        print("login");
        final usercreation = await _auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        final user = usercreation.user;
        if (user != null) {
          emit(Authenticated(user: user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {}
    });
    on<PhoneNumberLoginEvent>((event, state) async {
      try {
        print("phone sent");
        await _auth.verifyPhoneNumber(
          phoneNumber: event.phone,
          verificationCompleted: (phoneAuthCredential) async {},
          verificationFailed: (error) {
            emit(AuthenticatedError(message: error.toString()));
          },
          codeSent: (verificationId, forceResendingToken) async {
            emit(PhoneVerfiedState(verficationCode: verificationId));
          },
          codeAutoRetrievalTimeout: (verificationId) {},
        );
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
    on<OtpSentEvent>((event, emit) async {
      try {
        print("otp sent");
        PhoneAuthCredential credential = await PhoneAuthProvider.credential(
            verificationId: event.verficationCode, smsCode: event.otp);
        await _auth.signInWithCredential(credential);
        emit(Authenticated());
      } catch (e) {}
    });
    on<LoginGoogleEvent>((event, emit) async {
      print("login event");
      try {
        final googleUser = await GoogleSignIn().signIn();
        final googleAuth = await googleUser!.authentication;
        print(googleAuth.accessToken);
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        print(credential.accessToken);
        await _auth.signInWithCredential(credential);
        print("authated");
        emit(Authenticated());
      } catch (e) {
        emit(AuthenticatedError(message: e.toString()));
      }
    });
  }
}
