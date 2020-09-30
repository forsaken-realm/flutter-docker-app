import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<LinuxPerform> fetchLinuxPerformaceData(
    http.Client client, String cmd) async {
  final response = await client.get(
      'http://192.168.225.116/cgi-bin/web.py?x=curl%20-s%20--unix-socket%20/var/run/docker.sock%20http://localhost/$cmd');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsedata, response.body);
}

LinuxPerform parsedata(String responsebody) {
  final parsed = jsonDecode(responsebody);
  LinuxPerform linuxPerform = LinuxPerform.fromJson(parsed);

  return linuxPerform;
}

class LinuxPerform {
  String id;
  int totalContainers;
  int runningContainers;
  int stoppedContainer;
  int totalImagesavailable;
  int pausedContainers;
  int totalImagesAvailable;
  String kernalVersion;
  String osname;
  String ostype;
  String architecture;
  int noOfCpu;
  int totalMemory;
  String serverVersion;

  LinuxPerform(
      {this.architecture,
      this.id,
      this.osname,
      this.kernalVersion,
      this.noOfCpu,
      this.ostype,
      this.pausedContainers,
      this.runningContainers,
      this.serverVersion,
      this.stoppedContainer,
      this.totalImagesAvailable,
      this.totalContainers,
      this.totalImagesavailable,
      this.totalMemory});

  factory LinuxPerform.fromJson(Map<String, dynamic> json) {
    return LinuxPerform(
      id: json['ID'],
      totalContainers: json['Containers'],
      pausedContainers: json['ContainersStopped'],
      runningContainers: json['ContainersRunning'],
      stoppedContainer: json['ContainersStopped'],
      totalImagesAvailable: json['Images'],
      kernalVersion: json['KernelVersion'],
      ostype: json['OSType'],
      architecture: json['Architecture'],
      osname: json['OperatingSystem'],
      noOfCpu: json['NCPU'],
      totalMemory: json['MemTotal'],
      serverVersion: json['ServerVersion'],
    );
  }
}
