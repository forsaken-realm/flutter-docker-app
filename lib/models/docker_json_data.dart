import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Jsondata>> fetchDockerContainerData(
    http.Client client, String cmd, String ip) async {
  final response = await client.get(
      'http://192.168.225.116/cgi-bin/web.py?x=curl%20-s%20--unix-socket%20/var/run/docker.sock%20http://localhost/$cmd');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Jsondata> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Jsondata>((json) => Jsondata.fromJson(json)).toList();
}

class Jsondata {
  String id;
  List name;
  String image;
  String imageID;
  String command;
  int created;
  List<dynamic> ports;
  Map labels;
  String state;
  String status;
  Map hostConfig;
  Map<String, dynamic> networksettings;
  List mounts;

  Jsondata({
    this.command,
    this.created,
    this.hostConfig,
    this.id,
    this.imageID,
    this.labels,
    this.mounts,
    this.name,
    this.networksettings,
    this.ports,
    this.state,
    this.status,
    this.image,
  });
/*
  factory keyword is used to alternate the instanization of class
  property in our own way
 */
//IMORTANT: fromJson is a user given name,just like a named constructor
  factory Jsondata.fromJson(Map<String, dynamic> json) {
    return Jsondata(
      id: json['Id'],
      name: json['Names'],
      image: json['Image'],
      imageID: json['ImageID'],
      command: json['Command'],
      created: json['Created'],
      ports: json['Ports'],
      labels: json['Labels'],
      state: json['State'],
      status: json['Status'],
      hostConfig: json['HostConfig'],
      networksettings: json['NetworkSettings'],
      mounts: json['Mounts'],
    );
  }
}
