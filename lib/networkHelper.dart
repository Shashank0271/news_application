import 'dart:convert';
import 'package:http/http.dart' as http;
export 'firstPage.dart';

class NetworkHelper {
  String parseThis;
  NetworkHelper(this.parseThis);
  Future getData() async {
    http.Response response = await http.get(Uri.parse(parseThis));
    if (response.statusCode == 200) {
      var decodedStuff = jsonDecode(response.body);
      print(decodedStuff);
      return decodedStuff;
    } else {
      print('sorry something fucked up');
    }
  }
}
