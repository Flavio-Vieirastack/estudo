
import 'package:flutter/material.dart';

class CoffeePage extends StatefulWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  final pageController = PageController(viewportFraction: 0.3);
  double? currentPage = 0.0;
  void coffeScroolListner() {
    setState(() {
      currentPage = pageController.page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(coffeScroolListner);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.removeListener(coffeScroolListner);
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double height = 200;
    const double width = 100;
    final text = List.generate(4, (index) => index.toString());
    const textstyle = TextStyle(fontSize: 20, color: Colors.white);
    final content = [
      Container(
        height: height,
        width: width,
        color: Colors.red,
        child: Center(
          child: Text(
            text[0],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.green,
        child: Center(
          child: Text(
            text[1],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.amber,
        child: Center(
          child: Text(
            text[2],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.cyan,
        child: Center(
          child: Text(
            text[3],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.red,
        child: Center(
          child: Text(
            text[0],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.green,
        child: Center(
          child: Text(
            text[1],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.amber,
        child: Center(
          child: Text(
            text[2],
            style: textstyle,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        color: Colors.cyan,
        child: Center(
          child: Text(
            text[3],
            style: textstyle,
          ),
        ),
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Data'),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   left: 0,
          //   top: 0,
          //   right: 0,
          //   height: 100,
          //   child: Container(
          //     color: Colors.red,
          //   ),
          // ),

          Positioned(
            bottom: 300,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                clipBehavior: Clip.none,
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: content.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox.shrink();
                  }
                  final result = currentPage! - index + 1;
                  final value = -0.4 * result + 1;
                  final opacity = value.clamp(0.0, 1.0);
                  return Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..translate(
                        0.0,
                        MediaQuery.of(context).size.height /
                            2.6 *
                            (1 - value).abs(),
                      )
                      ..setEntry(3, 2, 0.001)
                      ..infinityNorm()
                      ..scale(value),
                    child: Opacity(
                      opacity: opacity,
                      child: content[index - 1],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
