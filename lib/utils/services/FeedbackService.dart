import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pizzahut/modules/contact/models/feedback_model.dart';

const base_url = 'https://pizza-hut-backend.herokuapp.com/api/feedback/';
const feedbackCreateUrl = base_url + "/add";
var headers = <String, String>{"Content-Type": "application/json"};

Future<String> sendFeedback(FeedbackModel model) async {
  return http
      .post(Uri.parse(feedbackCreateUrl), headers: headers,
      body: jsonEncode(model.toJson()))
      .then((value) {
    if (value.statusCode == 201) {
      print(value);
      return "Successfully Send!";
    }
    return "An Error Occur";
  });
}
