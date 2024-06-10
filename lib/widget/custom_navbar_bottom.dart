import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fe_panda_unair/assets/warna.dart';
import 'package:fe_panda_unair/page/home.dart';
import 'package:fe_panda_unair/page/pengaduan.dart';
import 'package:fe_panda_unair/page/profile.dart';
import 'package:fe_panda_unair/page/riwayat_pengaduan.dart';



class navBottom extends StatelessWidget {
  const navBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentScreen = 0;
  //
  final Screens = [Home(), Pengaduan(),RiwayatPengaduan(), Profile()];

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.primary,
      body: Screens[currentScreen],
      bottomNavigationBar: CurvedNavigationBar(
          color: Warna.secondary,
          // buttonBackgroundColor: Colors.amber,
          animationCurve: Curves.easeIn,
          animationDuration: Duration(milliseconds: 200),
          backgroundColor: Warna.primary,
          onTap: (index) {
            // print(index);
            setState(() {
              currentScreen = index;
            });
          },
          items: [
            Container(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            Icon(
              Icons.people,
              color: Colors.white,
            )
          ]),
    );
  }
}