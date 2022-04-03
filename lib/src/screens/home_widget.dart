import 'package:card_3d_carusel/src/screens/profile_page.dart';
import 'package:card_3d_carusel/src/widgets/flip_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

typedef OnPageChanged = void Function(int pageIndex);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double fraction = 0.8;
  PageViewHolder holder = PageViewHolder(value: 2.0);
  final PageController _controller =
      PageController(initialPage: 2, viewportFraction: 0.7);
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      holder.setValue(_controller.page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                // do something
              },
            ),
            const Expanded(child: SizedBox()),
            const Center(
              child: SizedBox(
                width: 100,
                child: CupertinoSearchTextField(),
              ),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
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
            const SizedBox(
              width: 6,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: ChangeNotifierProvider<PageViewHolder>.value(
            value: holder,
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _controller,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FlipCard(number: index.toDouble(), fraction: fraction);
                }),
          ),
        ),
      ),
    );
  }
}
