// app/routes/app_pages.dart
// ignore_for_file: duplicate_import

import 'package:get/get.dart';
import 'package:project_mobile/app/modules/AyamBakar/bindings/ayam_binding.dart';
import 'package:project_mobile/app/modules/AyamBakar/views/ayam_view.dart';
import 'package:project_mobile/app/modules/BagianDua/views/auth_view.dart';
import 'package:project_mobile/app/modules/CancelValid/bindings/cancelvalid_binding.dart';
import 'package:project_mobile/app/modules/CancelValid/views/cancelvalid_view.dart';
import 'package:project_mobile/app/modules/Onion/bindings/onion_binding.dart';
import 'package:project_mobile/app/modules/Onion/views/onion_view.dart';
import 'package:project_mobile/app/modules/ProfilUtama/bindings/utama_binding.dart';
import 'package:project_mobile/app/modules/ProfilUtama/views/utama_view.dart';
import 'package:project_mobile/app/modules/Scanner/views/scanner_view.dart';
import 'package:project_mobile/app/modules/Teh/bindings/teh_binding.dart';
import 'package:project_mobile/app/modules/Teh/views/teh_view.dart';
import 'package:project_mobile/app/modules/cancelOrder/bindings/canor_binding.dart';
import 'package:project_mobile/app/modules/cancelOrder/views/canor_view.dart';
import 'package:project_mobile/app/modules/cancelled/bindings/cancelled_binding.dart';
import 'package:project_mobile/app/modules/cancelled/views/cancelled_view.dart';
import 'package:project_mobile/app/modules/cart/bindings/cart_binding.dart';
import 'package:project_mobile/app/modules/cart/views/cart_view.dart';
import 'package:project_mobile/app/modules/complete/bindings/complete_binding.dart';
import 'package:project_mobile/app/modules/complete/views/complete_view.dart';
import 'package:project_mobile/app/modules/confirms/bindings/confirm_binding.dart';
import 'package:project_mobile/app/modules/confirms/views/confirm_view.dart';
import 'package:project_mobile/app/modules/details/bindings/detail_binding.dart';
import 'package:project_mobile/app/modules/details/views/detail_view.dart';
import 'package:project_mobile/app/modules/drink/bindings/drink_bindings.dart';
import 'package:project_mobile/app/modules/drink/views/drink_view.dart';
import 'package:project_mobile/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:project_mobile/app/modules/favorite/views/favorite_view.dart';
import 'package:project_mobile/app/modules/home/views/food_view.dart';
import 'package:project_mobile/app/modules/homepage/bindings/homepage_binding.dart';
import 'package:project_mobile/app/modules/homepage/views/homepage_view.dart';
import 'package:project_mobile/app/modules/logout/bindings/logout_binding.dart';
import 'package:project_mobile/app/modules/logout/views/logout_view.dart';
import 'package:project_mobile/app/modules/meal/bindings/meal_binding.dart';
import 'package:project_mobile/app/modules/meal/views/meal_view.dart';
import 'package:project_mobile/app/modules/orders/bindings/orders_binding.dart';
import 'package:project_mobile/app/modules/orders/views/orders_view.dart';
import 'package:project_mobile/app/modules/payment/bindings/payment_binding.dart';
import 'package:project_mobile/app/modules/payment/views/payment_view.dart';
import 'package:project_mobile/app/modules/pesan/bindings/pesan_binding.dart';
import 'package:project_mobile/app/modules/pesan/views/pesan_view.dart';
import 'package:project_mobile/app/modules/profile/bindings/profile_binding.dart';
import 'package:project_mobile/app/modules/profile/views/profile_view.dart';
import 'package:project_mobile/app/modules/search/bindings/search_binding.dart';
import 'package:project_mobile/app/modules/search/views/search_view.dart';
import 'package:project_mobile/app/modules/signIn/views/login_view.dart';
import 'package:project_mobile/app/modules/signUp/bindings/masuk_binding.dart';
import 'package:project_mobile/app/modules/signUp/views/masuk_view.dart';
import 'package:project_mobile/app/modules/snack/bindings/snack_binding.dart';
import 'package:project_mobile/app/modules/snack/views/snack_view.dart';
import 'package:project_mobile/app/modules/rate/bindings/rate_binding.dart';
import 'package:project_mobile/app/modules/rate/views/rate_view.dart';
import 'package:project_mobile/app/modules/Scanner/bindings/scanner_binding.dart';
import 'package:project_mobile/app/modules/Scanner/views/scanner_view.dart';
import 'package:project_mobile/app/modules/Audio/bindings/audio_binding.dart';
import 'package:project_mobile/app/modules/Audio/views/audio_views.dart';
import 'package:project_mobile/app/modules/Location/bindings/location_binding.dart';
import 'package:project_mobile/app/modules/Location/views/location_view.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

import '../modules/home/bindings/food_binding.dart';
import '../modules/BagianDua/bindings/auth_binding.dart';
import '../modules/signIn/bindings/login_binding.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => FoodView(),
      binding: FoodBinding(),
    ),
    GetPage(
      name: Routes.BAGIAN_DUA,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => MasukView(),
      binding: MasukBinding(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: Routes.COMPLETE,
      page: () => CompleteView(),
      binding: CompleteBinding(),
    ),
    GetPage(
      name: Routes.CANCELLED,
      page: () => CancelledView(),
      binding: CancelledBinding(),
    ),
    GetPage(
        name: Routes.CANCEL_ORDER,
        page: () => CanorView(),
        binding: CanorBindings(),
    ),
    GetPage(
        name: Routes.CANCEL_VALIDATION,
        page: () => CancelvalidView(),
        binding: CancelValidBindings(),
    ),
    GetPage(
        name: Routes.MEAL,
        page: () => MealView(),
        binding: MealBindings(),
    ),
    GetPage(
        name: Routes.SNACK,
        page: () => SnackView(),
        binding: SnackBindings(),
    ),
    GetPage(
        name: Routes.DRINK,
        page: () => DrinkView(),
        binding: DrinkBindings(),
    ),
    GetPage(
        name: Routes.FAVORITE,
        page: () => FavoriteView(),
        binding: FavoriteBinding(),
    ),
    GetPage(
        name: Routes.SEARCH,
        page: () => SearchView(),
        binding: SearchBinding(),
    ),
    GetPage(
        name: Routes.AYAM,
        page: () => AyamView(),
        binding: AyamBinding(),
    ),
    GetPage(
        name: Routes.ONION,
        page: () => OnionView(),
        binding: OnionBinding(),
    ),
    GetPage(
        name: Routes.TEH,
        page: () => TehView(),
        binding: TehBinding(),
    ),
    GetPage(
        name: Routes.PROFIL,
        page: () => ProfileView(),
        binding: ProfileBinding(),
    ),
    GetPage(
        name: Routes.LOGOUT,
        page: () => LogoutConfirmationView(),
        binding: LogoutBinding(),
    ),
    GetPage(
        name: Routes.PAYMENT,
        page: () => PaymentView(),
        binding: PaymentBinding(),
    ),
    GetPage(
        name: Routes.UTAMA,
        page: () => UtamaView(),
        binding: ProfileBindings(),
    ),
    GetPage(
        name: Routes.CART,
        page: () => CartView(),
        binding: CartBinding(),
    ),
    GetPage(
        name: Routes.CONFIRM,
        page: () => ConfirmView(),
        binding: ConfirmBinding(),
    ),
    GetPage(
        name: Routes.PESAN,
        page: () => PesanView(),
        binding: PesanBindings(),
    ),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsView(),
        binding: DetailsBindings(),
    ),
    GetPage(
        name: Routes.RATE,
        page: () => RateView(),
        binding: RateBinding(),
    ),
    GetPage(
        name: Routes.SCANNER,
        page: () => ScannerView(),
        binding: ScannerBinding()
    ),
    GetPage(
        name: Routes.AUDIO,
        page: () => AudioViews(),
        binding: AudioBinding(),
        ),
    GetPage(
        name: Routes.LOCATION,
        page: () => LocationView(),
        binding: LocationBindings(),
        ),
   
  ];
}