import 'package:fe_panda_unair/widget/custom_navbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      // Logout user sebelumnya, jika ada
      await googleSignIn.signOut();

      // Minta pengguna memilih akun Google yang ingin mereka gunakan untuk login
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Setelah berhasil masuk, pindahkan pengguna ke halaman beranda
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const navBottom(),
          ),
        );
      } else {
        // Tidak ada akun Google yang dipilih
        // Anda bisa menampilkan pesan kesalahan atau melakukan tindakan lainnya
      }
    } catch (error) {
      // Tangani kesalahan saat masuk
      print('Error signing in with Google: $error');
      // Tampilkan pesan kesalahan atau lakukan tindakan lainnya
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/img/background.jpg"), // Gambar latar belakang
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5), // Latar belakang semi-transparan
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/img/Panda.png",
                    height: screenSize.height * 0.2,
                    width: screenSize.width * 0.4,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to Panda App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 217, 217, 217),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Color.fromARGB(232, 24, 42, 137)),
                        ),
                      ),
                      shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.3)),
                      elevation: MaterialStateProperty.all(8),
                    ),
                    onPressed: () {
                      _signInWithGoogle(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.width * 0.02,
                          horizontal: screenSize.width * 0.04),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/img/google.png", // Gambar logo Google
                            height: screenSize.height * 0.03,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(232, 24, 42, 137),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
