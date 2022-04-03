import 'package:card_3d_carusel/src/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TourPage extends StatelessWidget {
  final int i;

  const TourPage({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = tourPrice[i - 1];
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Hero(
          tag: 'Background$i',
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return Image.asset(
                // ignore: prefer_adjacent_string_concatenation
                'assets/images/image_$i' + '.jpg',
                fit: BoxFit.cover,
              );
            } else {
              return Image.asset(
                // ignore: prefer_adjacent_string_concatenation
                'assets/images/image_$i' + '.jpg',
                fit: BoxFit.contain,
              );
            }
          }),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [colors[i - 1], Colors.transparent])),
          ),
        ),
        Positioned(
          top: 35,
          right: 10,
          child: GestureDetector(
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Profile Image.jpg"),
              radius: 19,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ),
        Positioned(
          left: 25,
          bottom: 320,
          child: Hero(
            tag: 'Button$i',
            child: GlassContainer.clearGlass(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(60.0),
              height: 60,
              width: 60,
              child: const Icon(Icons.favorite),
            ),
          ),
        ),
        Positioned(
          bottom: 180,
          left: 30,
          child: SizedBox(
              width: 180,
              child: Text(
                'your vacation',
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.w800,
                  textStyle: const TextStyle(color: Colors.black, fontSize: 47),
                ),
              )),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Positioned(
          bottom: 180,
          right: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.black,
              width: 80,
              height: 120,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    tourDate[i - 1],
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Text(
                    'mar',
                    style: GoogleFonts.lato(
                      color: Colors.grey,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    ' $price \$ ',
                    style: GoogleFonts.lato(
                      color: colors[i - 1],
                      fontWeight: FontWeight.w800,
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 30,
            bottom: 140,
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined),
                Text(
                  tourLocation[i.toInt() - 1],
                  style: GoogleFonts.bebasNeue(fontSize: 20),
                )
              ],
            )),
        Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 70,
            child: Center(
              child: CupertinoButton(
                child: Text('book',
                    style: GoogleFonts.bebasNeue(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                onPressed: () => {},
                color: Colors.white,
              ),
            )),
      ]),
    );
  }
}
