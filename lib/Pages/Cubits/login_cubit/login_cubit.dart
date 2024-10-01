import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String username, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'wrong-password'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errMessage: 'something went wrong'));
    }
  }
}
