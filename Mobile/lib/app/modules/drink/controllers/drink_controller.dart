import 'package:get/get.dart';
import 'package:project_mobile/app/modules/drink/models/drink_item_model.dart';

class DrinkController extends GetxController {
  var drinkItems = <DrinkItem>[
    DrinkItem(
      name: 'Es Teh',
      description: 'Iced tea is a refreshing beverage made by brewing tea leaves and chilling the infusion.',
      price: '5.000',
      rating: 5.0,
      imageUrl: 'assets/images/teh.png',
    ),
    DrinkItem(
      name: 'Orange Juice',
      description: 'Espresso, chilled milk, and a touch of sweetness, served over ice for a smooth.',
      price: '15.000',
      rating: 4.0,
      imageUrl: 'assets/images/jeruk.png',
    ),
  ].obs;
}