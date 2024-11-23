import 'dart:convert';
import 'package:http/http.dart' as http;

class LineWorksApi {
  final String botNo;
  final String accessToken;

  LineWorksApi({required this.botNo, required this.accessToken});

  Future<void> sendMessage(String userId, String message) async {
    final url = Uri.parse("https://www.worksapis.com/v1.0/bot/message/send");
    final headers = {
      "Authorization": "Bearer $accessToken",
      "Content-Type": "application/json",
    };
    final body = jsonEncode({
      "botNo": botNo,
      "accountId": userId,
      "content": {
        "type": "text",
        "text": message,
      },
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Message sent successfully: ${response.body}");
    } else {
      print(
          "Failed to send message: ${response.statusCode} - ${response.body}");
    }
  }
}
