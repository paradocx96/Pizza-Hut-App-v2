class FeedbackModel {
  late String user;
  late String message_type;
  late String description;

  FeedbackModel(
      {required this.user,
      required this.message_type,
      required this.description});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
      user: json["user"],
      message_type: json["message_type"],
      description: json["description"]);

  Map<String, dynamic> toJson() =>
      {"user": user, "message_type": message_type, "description": description};

  String get getUser => user;

  String get getMessageType => message_type;

  String get getDescription => description;
}
