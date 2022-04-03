import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/Profile Image.jpg"),
                  radius: 80,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Profile name ',
                  style: GoogleFonts.abel(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  ' P r o f i le   e m a i l@ ',
                  style: GoogleFonts.abel(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  ' Trip History  ',
                  style: GoogleFonts.abel(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  ' Pay information ',
                  style: GoogleFonts.abel(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  ' Coupons ',
                  style: GoogleFonts.abel(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' LogOut ',
                    style: GoogleFonts.abel(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.logout,
                    color: Colors.red,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
