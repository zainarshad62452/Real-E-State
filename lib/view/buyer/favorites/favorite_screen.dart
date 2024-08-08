import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/view/buyer/favorites/favorites_controller.dart';

class FavoriteScren extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites and Wish'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Search favorite & wish...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Favorites list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    favoriteController.removeAllFavorites();
                  },
                  child: Text(
                    'Remove all',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: favoriteController.favoriteList.length,
                itemBuilder: (context, index) {
                  var favorite = favoriteController.favoriteList[index];
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    leading: Image.network(favorite.imageUrl ?? ''),
                    title: Text(favorite.title ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${favorite.price ?? ''} Per night'),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 14),
                            Text(favorite.location ?? ''),
                            SizedBox(width: 10),
                            Icon(Icons.king_bed, size: 14),
                            Text(favorite.beds ?? ''),
                            SizedBox(width: 10),
                            Icon(Icons.bathtub, size: 14),
                            Text(favorite.baths ?? ''),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        favoriteController.removeFavorite(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          // Bottom Navigation Bar
        ],
      ),
    );
  }
}
