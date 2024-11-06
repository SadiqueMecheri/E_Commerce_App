import 'package:flutter/material.dart';

class mainurl {
  final String baseurl = "https://swan.alisonsnewdemo.online/api/";
  final String ProductImageurl = "https://swan.alisonsnewdemo.online/images/product/" ;
  final String BannerImageurl ="https://swan.alisonsnewdemo.online/images/banner/";
  final String CategoryImageurl="https://swan.alisonsnewdemo.online/images/category/";

  void snack(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(15.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Text(msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          )),
    ));
  }
}
