import 'package:flutter/material.dart';
import 'package:fe_panda_unair/assets/warna.dart';
import 'package:fe_panda_unair/widget/title_custom.dart';

// void main() {
//   runApp(const Home());
// }

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const TitleCustom(title: "Home")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: Image.asset(
                "lib/img/Panda.png",
                height: 100,
                width: 130,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Panda (Pusat Aduan Anak Dan Perempuan) adalah sebuah aplikasi yang berguna untuk melakukan pengaduan kepada UPT PPA Kabupaten Bengkalis.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0),
              child: Image.asset(
                "lib/img/orang.png",
                height: 300,
                width: 300,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Warna.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '“ Lindungi Perempuan dan Anak. Jadilah Pelopor Yang Memutus Mata Rantai Kekerasan Terhadap Perempuan Dan Anak ”',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),

              ),

            ),
            
          ],
        ),
      ),
    );
  }
}
