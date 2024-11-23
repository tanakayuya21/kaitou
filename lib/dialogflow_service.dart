import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class DialogFlowService {
  final String projectId = 'YOUR_PROJECT_ID'; // Google Cloud プロジェクトID
  final String sessionId = 'random_session_id'; // セッションID（ランダムで良い）
  final String languageCode = 'ja'; // 日本語を使う場合

  Future<String> sendMessageToDialogflow(String message) async {
    final serviceAccountKey =
        await rootBundle.loadString('assets/your-service-account-file.json');
    final credentials = ServiceAccountCredentials.fromJson(serviceAccountKey);

    final authClient = await clientViaServiceAccount(
        credentials, ['https://www.googleapis.com/auth/cloud-platform']);

    final url = Uri.https('dialogflow.googleapis.com',
        '/v2/projects/$projectId/agent/sessions/$sessionId:detectIntent');

    final body = jsonEncode({
      'queryInput': {
        'text': {
          'text': message,
          'languageCode': languageCode,
        }
      }
    });

    final response = await authClient.post(url, body: body, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final fulfillmentText = data['queryResult']['fulfillmentText'];
      return fulfillmentText;
    } else {
      throw Exception('Failed to connect to Dialogflow');
    }
  }
}
