import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkBrain {
  NetworkBrain(this.uri);

  Uri uri;

  Future getData() async {
    http.Response response = await http.get(uri);
    String data = response.body;
    //print(data);
    var decodedData = jsonDecode(data);
    return decodedData;
  }
}
