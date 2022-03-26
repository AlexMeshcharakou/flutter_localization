import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:module_nine/model/photo.dart';

const _url = 'https://jsonplaceholder.typicode.com/photos';

class NetworkService {
  Future<List<Photo>?> get() async {
    final response = await http.get(Uri.parse(_url));
    try {
      if (response.statusCode != 200) {
        return null;
      }
      final List<dynamic> body = jsonDecode(response.body);
      final photo = body
          .map(
            (photo) => Photo.fromJson(photo),
          )
          .toList();
      return photo;
    } catch (e) {
      print('Can not get photos.');
    }
    return null;
  }
}
