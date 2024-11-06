import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:machine_test/Const.dart';
import 'package:machine_test/Model/HomePageModel.dart';

class ImageSlider1 extends StatelessWidget {
  List<Bannerrr> banner1;
  ImageSlider1({required this.banner1});

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
          itemCount: banner1.length,
          slideBuilder: (index) {
            final image = banner1[index];
            return Padding(
              padding: const EdgeInsets.only(right: 2),
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
        ));
  }
}
