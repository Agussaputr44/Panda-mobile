import 'package:fe_panda_unair/page/login.dart';
import 'package:fe_panda_unair/widget/title_custom.dart';
import 'package:flutter/material.dart';
import 'package:fe_panda_unair/assets/warna.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TitleCustom(title: "Profile"),
        ),
      
      backgroundColor: Color.fromARGB(255, 255, 250, 250),
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildUserInfo(context),
                  const SizedBox(height: 16),
                  _buildLogoutButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? 'User';
    String email = user?.email ?? 'example@example.com';
    String joinDate = user != null
        ? DateFormat('yMMMMd').format(user.metadata.creationTime!)
        : '';

    return Column(
      children: [
        Text(
          displayName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'poppins'
          ),
        ),
        const SizedBox(height: 5),
        Text(
          email,
          style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'poppins'),
        ),
        const SizedBox(height: 5),
        const SizedBox(height: 5),
        Text(
          'Joined since: $joinDate',
          style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'poppins'),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Warna.primary,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Warna.primary)
          
        ),
        
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      ),
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'poppins',
          color: Colors.black
        ),
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration:const BoxDecoration(
            color: Color.fromARGB(255, 255, 250, 250),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Warna.primary,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Warna.primary,
                backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser?.photoURL ??
                      'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
