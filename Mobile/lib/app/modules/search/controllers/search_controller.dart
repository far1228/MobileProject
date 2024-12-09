import 'package:get/get.dart';
import 'package:project_mobile/app/modules/search/models/search_model.dart';


class MySearchController extends GetxController {
  var searchItems = <Search>[].obs;
  var categories = <String>['Chicken', 'Beef', 'Fish'].obs;

  @override
  void onInit() {
    super.onInit();
    // Data dummy untuk tampilan Search Results
    searchItems.addAll([
      Search(
        name: 'Kari Ayam',
        description: 'Curry with chicken and more',
        imageUrl: 'assets/images/curry.png',
        price: 25000,
        rating: 4.7,
      ),
      Search(
        name: 'Ayam Geprek',
        description: 'Crispy fried chicken smashed and topped with spicy sambal.',
        imageUrl: 'assets/images/geprek.png',
        price: 20000,
        rating: 4.7,
      ),
      Search(
        name: 'Sate Ayam',
        description: 'Delicious chicken skewers grilled to perfection, served with peanut sauce.',
        imageUrl: 'assets/images/sate.png',
        price: 25000,
        rating: 4.7,
      ),
    ]);
  }
}