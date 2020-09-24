import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LinuxPerform {
  String hostname;
  String osname;
  String architecture;
  Map<String, dynamic> memory;
  Map<String, dynamic> cpuUsage;

  LinuxPerform(
      {this.architecture,
      this.cpuUsage,
      this.hostname,
      this.memory,
      this.osname});

  factory LinuxPerform.fromJson(Map<String, dynamic> json) {
    return LinuxPerform(
      architecture: json['architecture'],
      cpuUsage: json['cpu'],
      memory: json['memory'],
      osname: json['operatingSystem'],
      hostname: json['hostname'],
    );
  }
}

Future<List<LinuxPerform>> fetchLinuxPerformaceData(
    http.Client client, String cmd) async {
  final response =
      await client.get('http://52.188.71.174/cgi-bin/docker.py?x= $cmd');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsedata, response.body);
}

List<LinuxPerform> parsedata(String responsebody) {
  final parsed = jsonDecode(responsebody).cast<Map<String, dynamic>>();
  return parsed
      .map<LinuxPerform>((json) => LinuxPerform.fromJson(json))
      .toList();
}
