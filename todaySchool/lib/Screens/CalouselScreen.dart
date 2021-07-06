import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final List<Map> images = [
    {
      'id': 0,
      'image':
      'assets/guide1.png',
    },
    {
      'id': 1,
      'image':
      'assets/guide2.png',
    },
    {
      'id': 2,
      'image': 'assets/guide3.png',
    },
    {
      'id': 3,
      'image':
      'assets/guide4.png',
    },
  ];

  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,

            child: PageView.builder(
              controller: pageController,
              onPageChanged: (selectedPage) {
                setState(() {
                  currentPage = selectedPage;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, position) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FadeInImage(
                      placeholder: AssetImage('assets/guide1.png'),
                      image: AssetImage(images[position]['image']
                      ),
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.map((image) {
                            return GestureDetector(
                              onTap: () {
                                currentPage = image['id'];
                                pageController.jumpToPage(currentPage);
                              },
                              child: Container(

                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}