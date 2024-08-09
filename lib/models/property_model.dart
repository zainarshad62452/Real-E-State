class PropertyModel {
  String? uid;
  String? title;
  String? description;
  int? numberOfBedRooms;
  int? numberOfBathrooms;
  bool? isKitchen;
  double? dimensions;
  bool? isParking;
  String? furnishedType;
  int? numberOfFloor;
  int? price;
  double? latitude;
  double? longitude;
  String? address;
  String? sellerId;
  String? solledTo;
  bool? isSold;
  List<String>? propertyImages;
  String? appartmentType;
  String? propertyType;
  String? city;
  double? rating;
  List<Review>? reviews;

  PropertyModel({
    this.uid,
    this.title,
    this.description,
    this.numberOfBedRooms,
    this.numberOfBathrooms,
    this.isKitchen,
    this.dimensions,
    this.isParking,
    this.furnishedType,
    this.numberOfFloor,
    this.price,
    this.latitude,
    this.longitude,
    this.address,
    this.sellerId,
    this.solledTo,
    this.isSold,
    this.city,
    this.propertyImages,
    this.appartmentType,
    this.rating,
    this.propertyType,
    this.reviews,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      uid: json['uid'] as String?,
      title: json['title'] as String?,
      propertyType: json['propertyType'] as String?,
      city: json['city'] as String?,
      description: json['description'] as String?,
      numberOfBedRooms: json['numberOfBedRooms'] as int?,
      numberOfBathrooms: json['numberOfBathrooms'] as int?,
      isKitchen: json['isKitchen'] as bool?,
      dimensions: json['dimensions'] as double?,
      isParking: json['isParking'] as bool?,
      furnishedType: json['furnishedType'] as String?,
      numberOfFloor: json['numberOfFloor'] as int?,
      price: json['price'] as int?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      address: json['address'] as String?,
      sellerId: json['sellerId'] as String?,
      solledTo: json['solledTo'] as String?,
      isSold: json['isSold'] as bool?,
      propertyImages: (json['propertyImages'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      appartmentType: json['appartmentType'] as String?,
      rating: json['rating'] as double?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((item) => Review.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'numberOfBedRooms': numberOfBedRooms,
      'numberOfBathrooms': numberOfBathrooms,
      'isKitchen': isKitchen??false,
      'dimensions': dimensions,
      'isParking': isParking??false,
      'propertyType': propertyType,
      'city': city,
      'furnishedType': furnishedType,
      'numberOfFloor': numberOfFloor??0,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'sellerId': sellerId,
      'solledTo': solledTo??"",
      'isSold': isSold,
      'propertyImages': propertyImages,
      'appartmentType': appartmentType,
      'rating': rating??0,
      'reviews': reviews?.map((item) => item.toJson()).toList()??[],
    };
  }
}

class Review {
  String? userId;
  String? comment;
  DateTime? date;
  double? rating;

  Review({
    this.userId,
    this.comment,
    this.date,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['userId'] as String?,
      comment: json['comment'] as String?,
      date: DateTime.tryParse(json['date'] as String),
      rating: json['rating'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'comment': comment,
      'date': date?.toIso8601String(),
      'rating': rating,
    };
  }
}
