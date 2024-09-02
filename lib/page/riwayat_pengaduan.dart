import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fe_panda_unair/widget/title_custom.dart';

class RiwayatPengaduan extends StatefulWidget {
  const RiwayatPengaduan({Key? key}) : super(key: key);

  @override
  _RiwayatPengaduanState createState() => _RiwayatPengaduanState();
}

class Pengaduan {
  final String key;
  final String namaKorban;
  final String alamat;
  final String aduan;
  final String harapan;

  Pengaduan({
    required this.key,
    required this.namaKorban,
    required this.alamat,
    required this.aduan,
    required this.harapan,
  });

  factory Pengaduan.fromMap(Map<String, dynamic> map, String key) {
    return Pengaduan(
      key: key,
      namaKorban: map['nama_korban'],
      alamat: map['alamat'],
      aduan: map['aduan'],
      harapan: map['harapan'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama_korban': namaKorban,
      'alamat': alamat,
      'aduan': aduan,
      'harapan': harapan,
    };
  }
}

class _RiwayatPengaduanState extends State<RiwayatPengaduan> {
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('pengaduan');
  List<Pengaduan> _pengaduanList = [];

  @override
  void initState() {
    super.initState();
    _fetchPengaduan();
  }

  void _fetchPengaduan() {
    _databaseRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        final List<Pengaduan> loadedPengaduan = [];
        data.forEach((key, value) {
          final pengaduanData = Map<String, dynamic>.from(value);
          loadedPengaduan.add(Pengaduan.fromMap(pengaduanData, key));
        });
        setState(() {
          _pengaduanList = loadedPengaduan;
        });
      } else {
        setState(() {
          _pengaduanList = [];
        });
      }
    });
  }

  void _deletePengaduan(String key) async {
    try {
      await _databaseRef.child(key).remove();
      setState(() {
        _pengaduanList.removeWhere((item) => item.key == key);
      });
    } catch (error) {
      print("Failed to delete pengaduan: $error");
    }
  }

  void _confirmDelete(String key) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus"),
          content: const Text("Apakah Anda yakin ingin menghapus pengaduan ini?"),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Hapus"),
              onPressed: () {
                _deletePengaduan(key);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editPengaduan(Pengaduan pengaduan) async {
    TextEditingController namaKorbanController = TextEditingController(text: pengaduan.namaKorban);
    TextEditingController alamatController = TextEditingController(text: pengaduan.alamat);
    TextEditingController aduanController = TextEditingController(text: pengaduan.aduan);
    TextEditingController harapanController = TextEditingController(text: pengaduan.harapan);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Pengaduan"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: namaKorbanController,
                  decoration: const InputDecoration(labelText: 'Nama Korban'),
                ),
                TextField(
                  controller: alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                ),
                TextField(
                  controller: aduanController,
                  decoration: const InputDecoration(labelText: 'Aduan'),
                ),
                TextField(
                  controller: harapanController,
                  decoration: const InputDecoration(labelText: 'Harapan'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Simpan"),
              onPressed: () async {
                final updatedPengaduan = Pengaduan(
                  key: pengaduan.key,
                  namaKorban: namaKorbanController.text,
                  alamat: alamatController.text,
                  aduan: aduanController.text,
                  harapan: harapanController.text,
                );
                try {
                  await _databaseRef.child(updatedPengaduan.key).set(updatedPengaduan.toMap());
                  setState(() {
                    final index = _pengaduanList.indexWhere((item) => item.key == updatedPengaduan.key);
                    if (index != -1) {
                      _pengaduanList[index] = updatedPengaduan;
                    }
                  });
                  Navigator.of(context).pop();
                } catch (error) {
                  print("Failed to update pengaduan: $error");
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const TitleCustom(title: "Riwayat Pengaduan")),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: _pengaduanList.isEmpty
                ? const Text("Tidak ada pengaduan")
                : ListView.builder(
                    itemCount: _pengaduanList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = _pengaduanList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextRow('Nama Korban: ', item.namaKorban),
                            const SizedBox(height: 8),
                            buildTextRow('Alamat: ', item.alamat),
                            const SizedBox(height: 8),
                            buildTextRow('Aduan: ', item.aduan),
                            const SizedBox(height: 8),
                            buildTextRow('Harapan: ', item.harapan),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    _editPengaduan(item);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _confirmDelete(item.key);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildTextRow(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
