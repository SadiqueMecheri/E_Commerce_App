import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/Const.dart';
import 'package:machine_test/banner.dart';
import 'Model/HomePageModel.dart';
import 'banner1.dart';
import 'banner2.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

bool loading = false;
late Future<HomePageModel?> future;
String apikey = "";

class _HomepageState extends State<Homepage> {
  //Get token

  Future<String?> getToken() async {
    setState(() {
      loading = true;
    });
    final url = Uri.parse(
        '${mainurl().baseurl}login?email_phone=8547541134&password=12345678'); // Replace with your API endpoint
    final response = await http.post(
      url,
      body: {
        'email_phone': '8547541134', // Replace with actual login data
        'password': '12345678', // Replace with actual login data
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['success'] == 1) {
        setState(() {
          apikey = data['customerdata']['token'];
        });
        return data['customerdata']['token'];
        //fetchHomeData(data['customerdata']['token']);
      } else {
        setState(() {
          loading = false;
        });
        mainurl().snack("Entered login credential wrong", context);
      }
    } else {
      setState(() {
        loading = false;
      });
      mainurl().snack("Something went wrong", context);
    }
    return null;
  }

  //Get Home Page

  Future<HomePageModel?> fetchHomeData(String APIKey) async {
    final url = Uri.parse(
        "https://swan.alisonsnewdemo.online/api/home?id=bDy&token=$APIKey");

    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        setState(() {
          loading = false;
        });
        return HomePageModel.fromJson(jsonResponse);
      } else {
        setState(() {
          loading = false;
        });
        mainurl().snack("Entered login credential wrong", context);
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      mainurl().snack("Something went wrong.$e", context);
    }
    return null;
  }

  loaddata() async {
    String? token = await getToken();
    if (token != null) {
      print('Token: $token');

      setState(() {
        apikey = token;
      });
    } else {
      print('Failed to retrieve token');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata().then(
      (value) {
        future = fetchHomeData(apikey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : FutureBuilder<HomePageModel?>(
            future: future,
            builder:
                (BuildContext context, AsyncSnapshot<HomePageModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final data = snapshot.data;
                return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      toolbarHeight: 60,
                      surfaceTintColor: Colors.white,
                      backgroundColor: Colors.white,
                      title: Row(
                        children: [
                          Image.asset(
                            "assets/images/Logo 2.png",
                            height: 70,
                            width: 75,
                          )
                        ],
                      ),
                      actions: [
                        Image.asset(
                          "assets/icons/search.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "assets/icons/fav.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          clipBehavior: Clip.none,
                          children: [
                            // The main image
                            Image.asset(
                              "assets/icons/bag.png",
                              height: 30,
                              width: 30,
                            ),
                            // Badge positioned in the top-right corner
                            Positioned(
                              right:
                                  -1, // Adjust this value to position the badge
                              top:
                                  -5, // Adjust this value to position the badge
                              bottom: -20,
                              child: Container(
                                padding: const EdgeInsets.all(
                                    5), // Space around badge content
                                decoration: const BoxDecoration(
                                  color: Colors.red, // Badge color
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    data!.notificationCount.toString(),
                                    // '2', // Badge content (e.g., item count)
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 250,
                            color: Colors.black,
                            child: ImageSlider11(banner1: data.banner1),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Our Brands",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 155,
                            // color: Colors.amber,
                            child: ListView.builder(
                              itemCount: data.featuredbrands.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final products = data.featuredbrands[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/ima22.png"
                                                // "https://swan.alisonsnewdemo.online/images/category/1695626477.jpg",
                                                ),
                                            fit: BoxFit.fill)),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Suggested For You",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 280,
                            // color: Colors.amber,
                            child: ListView.builder(
                              itemCount: data.suggestedProducts.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final suggestedProducts =
                                    data.suggestedProducts[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    mainurl().ProductImageurl +
                                                        suggestedProducts.image,
                                                  ),
                                                  fit: BoxFit.fill)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          // "Max & Co Sports",
                                          suggestedProducts.name.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "₹ " +
                                              suggestedProducts.price
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width,
                            // color: Colors.amber,
                            child: ImageSlider1(
                              banner1: data.banner2,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Bestsellers",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 280,
                            // color: Colors.amber,
                            child: ListView.builder(
                              itemCount: data.bestSeller.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final bestseller = data.bestSeller[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.black,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    mainurl().ProductImageurl +
                                                        bestseller.image),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          // "Max & Co Sports",
                                          bestseller.name.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "₹ " + bestseller.price.toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Tranding Categories",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),

                          Center(
                            child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.start,
                                spacing: 15.0,
                                runAlignment: WrapAlignment.center,
                                runSpacing: 15.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                // textDirection: TextDirection.rtl,
                                // verticalDirection: VerticalDirection.up,
                                children: List.generate(
                                  data.categories.length,
                                  (index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  image: NetworkImage(mainurl()
                                                          .CategoryImageurl +
                                                      data.categories[index]
                                                          .category.image),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            // "Skirts",
                                            data.categories[index].category.name
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 11.5,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Shop Exclusive Deals",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 250,
                            child: ImageSlider(
                              banner3: data.banner3,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ));
              }
            });
  }
}
