class ScheduleModel {
  String? id;
  String? sellerId;
  String? buyerId;
  String? propertyId;
  String? chatId;
  String? appointmentTime;
  String? startTime;
  String? status;

  ScheduleModel({
    this.id,
    this.sellerId,
    this.buyerId,
    this.propertyId,
    this.chatId,
    this.appointmentTime,
    this.startTime,
    this.status,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'] as String?,
      sellerId: json['sellerId'] as String?,
      buyerId: json['buyerId'] as String?,
      propertyId: json['propertyId'] as String?,
      chatId: json['chatId'] as String?,
      appointmentTime: json['appointmentTime'] as String?,
      startTime: json['startTime'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellerId': sellerId,
      'buyerId': buyerId,
      'propertyId': propertyId,
      'chatId': chatId,
      'appointmentTime': appointmentTime,
      'startTime': startTime,
      'status': status,
    };
  }
}
