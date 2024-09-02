import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fe_panda_unair/assets/warna.dart';
import 'package:fe_panda_unair/widget/title_custom.dart';

class PengaduanPage extends StatelessWidget {
  const PengaduanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const TitleCustom(title: "Pengaduan"),
        ),
        body: SingleChildScrollView(
          child: PengaduanForm(),
        ),
      ),
    );
  }
}

class PengaduanForm extends StatefulWidget {
  @override
  _PengaduanFormState createState() => _PengaduanFormState();
}

class _PengaduanFormState extends State<PengaduanForm> {
  final _namaKorbanController = TextEditingController();
  final _alamatController = TextEditingController();
  final _aduanController = TextEditingController();
  final _harapanController = TextEditingController();
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('pengaduan');

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildTextField("Nama Korban", _namaKorbanController),
          const SizedBox(height: 20),
          buildTextField("Alamat", _alamatController),
          const SizedBox(height: 20),
          buildTextField("Aduan", _aduanController),
          const SizedBox(height: 20),
          buildTextArea("Hal yang diharapkan", _harapanController),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _submitPengaduan();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Warna.primary, // Mengatur warna tombol menjadi biru
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child:
                const Text('Kirim Pengaduan', style: TextStyle(fontSize: 18,color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 65, 65, 65),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 65, 65, 65)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }

  Widget buildTextArea(String labelText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 65, 65, 65),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 65, 65, 65)),
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
        maxLines: 5,
      ),
    );
  }

  void _submitPengaduan() {
    final pengaduan = {
      'nama_korban': _namaKorbanController.text,
      'alamat': _alamatController.text,
      'aduan': _aduanController.text,
      'harapan': _harapanController.text,
    };

    _databaseRef.push().set(pengaduan).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pengaduan berhasil dikirim')),
      );
      _namaKorbanController.clear();
      _alamatController.clear();
      _aduanController.clear();
      _harapanController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pengaduan gagal dikirim: $error')),
      );
    });
  }
}
