import 'package:get/get.dart';
import 'package:realstate/models/favorite_model.dart';

class FavoriteController extends GetxController {
  var favoriteList = <FavoriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch or initialize your favorite data here
  }

  void addFavorite(FavoriteModel favorite) {
    favoriteList.add(favorite);
  }

  void removeFavorite(int index) {
    favoriteList.removeAt(index);
  }

  void removeAllFavorites() {
    favoriteList.clear();
  }
}

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}