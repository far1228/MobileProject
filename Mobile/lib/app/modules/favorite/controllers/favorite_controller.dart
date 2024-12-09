import 'package:get/get.dart';
import 'package:project_mobile/app/modules/favorite/models/favorite_model.dart';

class FavoriteController extends GetxController {
  var favoriteItems = <Favorite>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Data dummy, sesuai dengan contoh UI
    favoriteItems.addAll([
      Favorite(
        name: 'Ayam Geprek',
        description: 'Ayam crispy dengan sambal',
        imageUrl: 'assets/images/geprek.png',
        price: 20000,
      ),
      Favorite(
        name: 'Onion Ring',
        description: 'Bawang bombai goreng',
        imageUrl: 'assets/images/onion.png',
        price: 15000,
      ),
      Favorite(
        name: 'Es Teh',
        description: 'Teh sari wangi dengan es',
        imageUrl: 'assets/images/teh.png',
        price: 5000,
      ),
    ]);
  }
}