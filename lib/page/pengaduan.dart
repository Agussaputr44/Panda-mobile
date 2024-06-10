import 'package:flutter/material.dart';
import 'package:fe_panda_unair/assets/warna.dart';
import 'package:fe_panda_unair/widget/title_custom.dart';

// void main() {
//   runApp(const Pengaduan());
// }

class Pengaduan extends StatelessWidget {
  const Pengaduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const TitleCustom(title: "Pengaduan"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    "lib/img/orang.png",
                    height: 100,
                    width: 130,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Laporkan Kekerasan Sekarang Juga",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField("Nama Korban"),
                const SizedBox(height: 10),
                buildTextField("Alamat"),
                const SizedBox(height: 10),
                buildTextField("Aduan"),
                const SizedBox(height: 10),
                buildTextArea("Hal yang diharapkan"), // Updated method call
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk mengirim pengaduan
                  },
                  child: const Text('Kirim Pengaduan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Warna.secondary,
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }

  Widget buildTextArea(String labelText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Warna.secondary,
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
        maxLines: 5, // Set the number of lines for the text area
      ),
    );
  }
}
