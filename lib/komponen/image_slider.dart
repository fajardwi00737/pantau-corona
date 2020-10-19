import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class SliderImages extends StatefulWidget {
  final List<Widget> listWidget;
  SliderImages({
    @required this.listWidget,
  });

  @override
  _SliderImagesState createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  int _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: this.widget.listWidget.map((widget)  {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  child: widget
              );
            }).toList(),
            options: CarouselOptions(
                height: 120,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                // enableInfiniteScroll: true,
                // viewportFraction: 1.0,
                // enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlideIndex = index;
                  });
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: this.widget.listWidget.map((url) {
                int index = widget.listWidget.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSlideIndex == index
                        ? Color(0xFF0091a6)
                        : Color(0xFFDADADA),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}