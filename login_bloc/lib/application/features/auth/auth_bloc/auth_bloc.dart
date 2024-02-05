import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        final userCrdential = await _auth.signInWithEmailAndPassword(
          email: event.user.email!.toString(),
          password: event.user.password!.toString(),
        );
        final user = userCrdential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'uId': user.uid,
            'email': user.email,
            'name': event.user.name,
            'phone': event.user.phone,
            'createdAt':DateTime.now()
          });
        }
      } catch (e) {}
    });
  }
}
