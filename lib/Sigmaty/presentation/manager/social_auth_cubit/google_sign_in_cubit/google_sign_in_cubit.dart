import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInCubit() : super(GoogleSignInInitial());
  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;
      emit(GoogleSignInSuccess());
    } catch (e) {
      emit(
          GoogleSignInFailure("Error signing in with Google: ${e.toString()}"));
    }
  }
}
