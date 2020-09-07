import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Articles {
  Future<void> getFeaturedArticle() async {
    const url = 'https://url/rest/articles/getFeatured';
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }
}
