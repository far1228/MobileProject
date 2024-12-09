import 'package:get/get.dart';
import 'package:project_mobile/app/modules/snack/models/snack_item_model.dart';


class SnackController extends GetxController {
  var snackItems = <SnackItem>[
    SnackItem(
      name: 'Onion Ring',
      description: 'Crispy, golden-brown rings of onion, perfect for snacking.',
      price: '15.000',
      rating: 4.7,
      imageUrl: 'assets/images/onion.png',
    ),
    SnackItem(
      name: 'French Fries',
      description: 'These perfectly cooked French fries are crispy on the outside and fluffy on the inside, offering a delightful texture in every bite.',
      price: '15.000',
      rating: 4.4,
      imageUrl: 'assets/images/kentang.png',
    ),
  ].obs;
}