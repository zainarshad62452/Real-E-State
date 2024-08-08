class FavoriteModel {
  String? imageUrl;
  String? title;
  String? price;
  String? location;
  String? beds;
  String? baths;

  FavoriteModel({
    this.imageUrl,
    this.title,
    this.price,
    this.location,
    this.beds,
    this.baths,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      location: json['location'] as String?,
      beds: json['beds'] as String?,
      baths: json['baths'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'location': location,
      'beds': beds,
      'baths': baths,
    };
  }
}
