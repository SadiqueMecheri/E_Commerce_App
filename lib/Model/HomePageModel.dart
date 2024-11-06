import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  int success;
  String message;
  List<Bannerrr> banner1;
  List<Bannerrr> banner2;
  List<Bannerrr> banner3;
  List<Bannerrr> banner4;
  List<dynamic> banner5;
  List<BestSeller> recentviews;
  List<BestSeller> ourProducts;
  List<BestSeller> suggestedProducts;
  List<BestSeller> bestSeller;
  List<BestSeller> flashSail;
  List<dynamic> newarrivals;
  List<Ory> categories;
  List<Ory> topAccessories;
  List<Featuredbrand> featuredbrands;
  int cartcount;
  int wishlistcount;
  Currency currency;
  int notificationCount;

  HomePageModel({
    required this.success,
    required this.message,
    required this.banner1,
    required this.banner2,
    required this.banner3,
    required this.banner4,
    required this.banner5,
    required this.recentviews,
    required this.ourProducts,
    required this.suggestedProducts,
    required this.bestSeller,
    required this.flashSail,
    required this.newarrivals,
    required this.categories,
    required this.topAccessories,
    required this.featuredbrands,
    required this.cartcount,
    required this.wishlistcount,
    required this.currency,
    required this.notificationCount,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    success: json["success"],
    message: json["message"],
    banner1: List<Bannerrr>.from(json["banner1"].map((x) => Bannerrr.fromJson(x))),
    banner2: List<Bannerrr>.from(json["banner2"].map((x) => Bannerrr.fromJson(x))),
    banner3: List<Bannerrr>.from(json["banner3"].map((x) => Bannerrr.fromJson(x))),
    banner4: List<Bannerrr>.from(json["banner4"].map((x) => Bannerrr.fromJson(x))),
    banner5: List<dynamic>.from(json["banner5"].map((x) => x)),
    recentviews: List<BestSeller>.from(json["recentviews"].map((x) => BestSeller.fromJson(x))),
    ourProducts: List<BestSeller>.from(json["our_products"].map((x) => BestSeller.fromJson(x))),
    suggestedProducts: List<BestSeller>.from(json["suggested_products"].map((x) => BestSeller.fromJson(x))),
    bestSeller: List<BestSeller>.from(json["best_seller"].map((x) => BestSeller.fromJson(x))),
    flashSail: List<BestSeller>.from(json["flash_sail"].map((x) => BestSeller.fromJson(x))),
    newarrivals: List<dynamic>.from(json["newarrivals"].map((x) => x)),
    categories: List<Ory>.from(json["categories"].map((x) => Ory.fromJson(x))),
    topAccessories: List<Ory>.from(json["top_accessories"].map((x) => Ory.fromJson(x))),
    featuredbrands: List<Featuredbrand>.from(json["featuredbrands"].map((x) => Featuredbrand.fromJson(x))),
    cartcount: json["cartcount"],
    wishlistcount: json["wishlistcount"],
    currency: Currency.fromJson(json["currency"]),
    notificationCount: json["notification_count"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "banner1": List<dynamic>.from(banner1.map((x) => x.toJson())),
    "banner2": List<dynamic>.from(banner2.map((x) => x.toJson())),
    "banner3": List<dynamic>.from(banner3.map((x) => x.toJson())),
    "banner4": List<dynamic>.from(banner4.map((x) => x.toJson())),
    "banner5": List<dynamic>.from(banner5.map((x) => x)),
    "recentviews": List<dynamic>.from(recentviews.map((x) => x.toJson())),
    "our_products": List<dynamic>.from(ourProducts.map((x) => x.toJson())),
    "suggested_products": List<dynamic>.from(suggestedProducts.map((x) => x.toJson())),
    "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
    "flash_sail": List<dynamic>.from(flashSail.map((x) => x.toJson())),
    "newarrivals": List<dynamic>.from(newarrivals.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "top_accessories": List<dynamic>.from(topAccessories.map((x) => x.toJson())),
    "featuredbrands": List<dynamic>.from(featuredbrands.map((x) => x.toJson())),
    "cartcount": cartcount,
    "wishlistcount": wishlistcount,
    "currency": currency.toJson(),
    "notification_count": notificationCount,
  };
}

class Bannerrr {
  int id;
  int linkType;
  String linkValue;
  String image;
  String title;
  String subTitle;
  dynamic logo;

  Bannerrr({
    required this.id,
    required this.linkType,
    required this.linkValue,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.logo,
  });

  factory Bannerrr.fromJson(Map<String, dynamic> json) => Bannerrr(
    id: json["id"],
    linkType: json["link_type"],
    linkValue: json["link_value"],
    image: json["image"],
    title: json["title"],
    subTitle: json["sub_title"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link_type": linkType,
    "link_value": linkValue,
    "image": image,
    "title": title,
    "sub_title": subTitle,
    "logo": logo,
  };
}

class BestSeller {
  int productId;
  String slug;
  String code;
  String? homeImg;
  String name;
  int? isGender;
  Store store;
  Manufacturer manufacturer;
  String oldprice;
  String price;
  String image;
  int cart;
  int wishlist;

  BestSeller({
    required this.productId,
    required this.slug,
    required this.code,
    required this.homeImg,
    required this.name,
    required this.isGender,
    required this.store,
    required this.manufacturer,
    required this.oldprice,
    required this.price,
    required this.image,
    required this.cart,
    required this.wishlist,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
    productId: json["productId"],
    slug: json["slug"],
    code: json["code"],
    homeImg: json["home_img"],
    name: json["name"],
    isGender: json["is_gender"],
    store: storeValues.map[json["store"]]!,
    manufacturer: manufacturerValues.map[json["manufacturer"]]!,
    oldprice: json["oldprice"],
    price: json["price"],
    image: json["image"],
    cart: json["cart"],
    wishlist: json["wishlist"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "slug": slug,
    "code": code,
    "home_img": homeImg,
    "name": name,
    "is_gender": isGender,
    "store": storeValues.reverse[store],
    "manufacturer": manufacturerValues.reverse[manufacturer],
    "oldprice": oldprice,
    "price": price,
    "image": image,
    "cart": cart,
    "wishlist": wishlist,
  };
}

enum Manufacturer {
  FURLA,
  LIUJO,
  MARELLA,
  MAX_CO,
  PENNYBLACK
}

final manufacturerValues = EnumValues({
  "FURLA": Manufacturer.FURLA,
  "LIUJO": Manufacturer.LIUJO,
  "MARELLA": Manufacturer.MARELLA,
  "MAX&Co": Manufacturer.MAX_CO,
  "PENNYBLACK": Manufacturer.PENNYBLACK
});

enum Store {
  SWAN
}

final storeValues = EnumValues({
  "Swan": Store.SWAN
});

class Ory {
  Featuredbrand category;

  Ory({
    required this.category,
  });

  factory Ory.fromJson(Map<String, dynamic> json) => Ory(
    category: Featuredbrand.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "category": category.toJson(),
  };
}

class Featuredbrand {
  int id;
  String slug;
  String image;
  String name;
  String? description;

  Featuredbrand({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
    this.description,
  });

  factory Featuredbrand.fromJson(Map<String, dynamic> json) => Featuredbrand(
    id: json["id"],
    slug: json["slug"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "image": image,
    "name": name,
    "description": description,
  };
}

class Currency {
  String name;
  String code;
  String symbolLeft;
  String symbolRight;
  String value;
  int status;

  Currency({
    required this.name,
    required this.code,
    required this.symbolLeft,
    required this.symbolRight,
    required this.value,
    required this.status,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    name: json["name"],
    code: json["code"],
    symbolLeft: json["symbol_left"],
    symbolRight: json["symbol_right"],
    value: json["value"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "symbol_left": symbolLeft,
    "symbol_right": symbolRight,
    "value": value,
    "status": status,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
