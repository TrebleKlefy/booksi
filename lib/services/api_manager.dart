import 'dart:convert';

import 'package:booksi/model/bookInfo.dart';
import 'package:http/http.dart' as http;
import 'package:booksi/constants/strings.dart';

class APIManager {
  Future<BookModel> getBooks(string) async {
    var client = http.Client();
    var bookModel;
    var response;
    var query = 'https://www.googleapis.com/books/v1/volumes?q=$string';

    try {
      if (string == 'empty_string') {
        response = await client.get(Strings.bookurl);
      } else {
        response = await client.get(query);
      }
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(jsonMap);
        bookModel = BookModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception);
      return bookModel;
    }
    return bookModel;
  }
}
