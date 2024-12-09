import 'package:get/get.dart';
import 'package:project_mobile/app/modules/meal/models/meal_item_model.dart';


class MealController extends GetxController {
  var mealItems = <MealItem>[
    MealItem(
      name: 'Ayam Bakar',
      description: 'Ayam bakar yang lezat dengan bumbu rempah.',
      price: '35.000',
      rating: 5.0,
      imageUrl: 'assets/images/bakar.png',
    ),
    MealItem(
      name: 'Sate Ayam',
      description: 'Sate ayam yang gurih dengan bumbu kacang.',
      price: '20.000',
      rating: 4.0,
      imageUrl: 'assets/images/sate.png',
    ),
  ].obs;
}