import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Images>> fetchDockerImageData(
    http.Client client, String cmd) async {
  final response = await client.get(
      'http://52.188.71.174/cgi-bin/docker.py?x=curl%20-s%20--unix-socket%20/var/run/docker.sock%20http://localhost/$cmd');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Images> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Images>((json) => Images.fromJson(json)).toList();
}

class Images {
  List imageName;
  Images({this.imageName});
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(imageName: json['RepoTags']);
  }
}
