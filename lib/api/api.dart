import 'package:http/http.dart' as http;

class Api {
  static Future sendRequest(url) async {
    try {
      final http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return response.body;
    } catch (e) {
      print(e);
      return {'success': false, 'message': e};
    }
  }
}
