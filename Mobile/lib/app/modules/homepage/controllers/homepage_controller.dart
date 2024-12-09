import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Example data for categories and best sellers
  var bestSellers = [
    {'name': 'Sate Ayam', 'image': 'assets/images/sate.png'},
    {'name': 'Kari Ayam', 'image': 'assets/images/curry.png'},
    {'name': 'Ayam Geprek', 'image': 'assets/images/geprek.png'},
    {'name': 'Onion Rings', 'image': 'assets/images/onion.png'},
  ].obs;

  var recommended = [
    {'name': 'Ayam Bakar', 'image': 'assets/images/bakar.png', 'price': 5.0},
    {'name': 'French Fries', 'image': 'assets/images/kentang.png', 'price': 6.0},
  ].obs;


}