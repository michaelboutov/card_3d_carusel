import 'package:card_3d_carusel/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/tour_page.dart';

class PageViewHolder extends ChangeNotifier {
  double value;

  PageViewHolder({required this.value});

  void setValue(newValue) {
    value = newValue;
    notifyListeners();
  }
}

class FlipCard extends StatelessWidget {
  final double number;
  final double fraction;

  // ignore: use_key_in_widget_constructors
  const FlipCard({required this.number, required this.fraction});

  @override
  Widget build(BuildContext context) {
    double value = Provider.of<PageViewHolder>(context).value;
    double diff = (number - value);
    final price = tourPrice[number.toInt()];

    //Matrix for Elements
    final Matrix4 pvMatrix =
        Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, -60, 0, 1)
          ..setEntry(3, 1, 0.004 * -diff);

    final i = number.toInt() + 1;
    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return TourPage(
                i: i,
              );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return Align(
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: <Widget>[
          Transform(
            transform: pvMatrix,
            alignment: const FractionalOffset(0.5, 0.15),
            child: SizedBox(
              width: 300,
              height: 800,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Stack(fit: StackFit.expand, children: [
                  Hero(
                    tag: 'Background$number',
                    child: Image.asset(
                      // ignore: prefer_adjacent_string_concatenation
                      'assets/images/image_$i' + '.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    bottom: 180,
                    child: Hero(
                      tag: 'Button$number',
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
                    bottom: 60,
                    left: 30,
                    child: SizedBox(
                        width: 180,
                        child: Text(
                          'your vacation',
                          style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.w800,
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 40),
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 60,
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
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 20),
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
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 23),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 30,
                      bottom: 35,
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text(
                            tourLocation[number.toInt()],
                            style: GoogleFonts.bebasNeue(fontSize: 20),
                          )
                        ],
                      ))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
