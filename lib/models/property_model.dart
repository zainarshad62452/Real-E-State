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
    this.propertyImages,
    this.appartmentType,
  });


  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      uid: json['uid'] as String?,
      title: json['title'] as String?,
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
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'numberOfBedRooms': numberOfBedRooms,
      'numberOfBathrooms': numberOfBathrooms,
      'isKitchen': isKitchen,
      'dimensions': dimensions,
      'isParking': isParking,
      'furnishedType': furnishedType,
      'numberOfFloor': numberOfFloor,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'sellerId': sellerId,
      'solledTo': solledTo,
      'isSold': isSold,
      'propertyImages': propertyImages,
      'appartmentType': appartmentType,
    };
  }
}
