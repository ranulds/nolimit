import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatefulWidget {
  @override
  _carouselPage createState() => _carouselPage();
}

class _carouselPage extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/1.jpg'),
        AssetImage('assets/2.jpg'),
        AssetImage('assets/3.jpg'),
        AssetImage('assets/4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 2000),
    );
  }
}
