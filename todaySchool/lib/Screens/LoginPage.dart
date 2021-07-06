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
      'http://www.winwallpapers.net/w1/2012/11/Download-Mobile-Wallpaper-With-640x480-230.jpg',
    },
    {
      'id': 1,
      'image':
      'http://www.winwallpapers.net/w1/2012/12/Download-Samsung-Galaxy-Mini-wallpaper-640x480-545.jpg',
    },
    {
      'id': 2,
      'image': 'http://wfiles.brothersoft.com/e6/android_189017-640x480.jpg',
    },
    {
      'id': 3,
      'image':
      'http://www.winwallpapers.net/w1/2012/11/Download-Mobile-Wallpaper-With-640x480-4.jpg',
    },
    {
      'id': 4,
      'image': 'http://www.gdargaud.net/Photo/640/20051224_0255_MtCookRoad.jpg',
    },
    {
      'id': 5,
      'image':
      'https://c.tribune.com.pk/2019/09/2068979-sreutersmedia-1569856767-343-640x480.jpg',
    },
    {
      'id': 6,
      'image':
      'https://www.newmusicusa.org/wp-content/uploads/2018/01/15-image_aurora-640x480.jpg',
    },
  ];

  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
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
            height: MediaQuery.of(context).size.height * 0.4,
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
                      placeholder: AssetImage('assets/images/placeholder.jpg'),
                      image: NetworkImage(images[position]['image']),
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
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: currentPage == image['id'] ? 16 : 10,
                                height: currentPage == image['id'] ? 16 : 10,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(
                                        currentPage == image['id'] ? 8 : 5),
                                    color: Colors.white),
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
          Divider(
            color: Colors.black54,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Text(
              'Current Page Number: $currentPage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}