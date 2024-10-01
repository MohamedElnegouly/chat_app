import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());

  Future<void> regesterUser(
      {required String email, required String password}) async {
    emit(RegesterLoading());

    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegesterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegesterFaliure(errMessage: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegesterFaliure(errMessage: 'Email already exists'));
      }
    } on Exception catch (e) {
      emit(RegesterFaliure(errMessage: 'there was an error'));
    }
  }
}
