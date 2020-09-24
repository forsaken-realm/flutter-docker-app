import 'package:http/http.dart' as http;

server(String cmd, http.Client client) async {
  String url = 'http://52.188.71.174/cgi-bin/docker.py?x=$cmd'; //192.168.43.236
  final response = await client.get(url);

  String a = response.body;
  return a;
}
