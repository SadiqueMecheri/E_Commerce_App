import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import 'Const.dart';
import 'Model/HomePageModel.dart';

class ImageSlider extends StatelessWidget {
  List<Bannerrr> banner3;
  ImageSlider({required this.banner3});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: CarouselSlider.builder(
          unlimitedMode: true,
          viewportFraction: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          scrollPhysics: const BouncingScrollPhysics(),
          enableAutoSlider: true,
          autoSliderTransitionCurve: Curves.decelerate,
          autoSliderDelay: const Duration(seconds: 5),
          autoSliderTransitionTime: const Duration(milliseconds: 1000),
          itemCount: banner3.length,
          slideBuilder: (index) {
            final image = banner3[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(mainurl().BannerImageurl + image.image),
                      fit: BoxFit.fill),
                ),
              ),
            );
          },
          slideIndicator: CircularSlideIndicator(
            itemSpacing: 10,
            indicatorRadius: 3,
            indicatorBorderWidth: 1,
            alignment: Alignment.bottomCenter,
            currentIndicatorColor: Colors.black,
            indicatorBackgroundColor: Colors.grey.shade400,
            padding: EdgeInsets.only(
              bottom: 0,
            ),
          ),
        ));
  }
}
