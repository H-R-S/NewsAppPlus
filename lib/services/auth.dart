import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final googles = GoogleSignIn();

Future<UserCredential?> signInWithGoogle() async {
  final googleUser = await googles.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await _auth.signInWithCredential(credential);
}

void Logout() async {
  await googles.disconnect();
  await FirebaseAuth.instance.signOut();
}
