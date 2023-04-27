import 'package:get/get.dart';

class ExampleData {
  ExampleData._internal();

  static List<String> images = [
  ];

  static List<Category> data =
   [
      category1,
      category2,
      category3,
      category4,
    ];

  static Category category1 = Category(
    title: "How to play".tr,
    subtitle: "subCategory1".tr,
    isHotSale: true,
    foods: List.generate(
      5,
          (index) {
        return Food(
          name: "701. Superman Sparkling Vegetable Pot".tr,
          price: "200",
          comparePrice: "\$198",
          imageUrl: '',
          isHotSale: false,
        );
      },
    ),
  );

  static Category category2 = Category(
    title: "Participate in the process".tr,
    subtitle: "Comes with a side meal".tr,
    isHotSale: false,
    foods: List.generate(
      3,
          (index) {
        return Food(
          name: "706. Mini Original Flavor Pot".tr,
          price: "230",
          comparePrice: "\$250",
          imageUrl: '',
          isHotSale: index == 2 ? true : false,
        );
      },
    ),
  );

  static Category category3 = Category(
    title: "gamecommon".tr,
    subtitle: null,
    isHotSale: false,
    foods: List.generate(
      1,
          (index) {
        return Food(
          name: "Classic Hot Pot".tr,
          price: "258",
          comparePrice: "\$289",
          imageUrl: '',
          isHotSale: false,
        );
      },
    ),
  );

  static Category category4 = Category(
    title: "Partner".tr,
    subtitle: "subCategory4".tr,
    isHotSale: false,
    foods: List.generate(
      5,
          (index) {
        return Food(
          name: "728. Lian Ting Vegetarian Pot".tr,
          price: "240",
          comparePrice: "\$300",
          imageUrl: '',
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
}

class Category {
  String title;
  String? subtitle;
  List<Food> foods;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.foods,
    required this.isHotSale,
  });
}

class Food {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Food({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}
