import 'package:http/http.dart' as http;

abstract class AHttpClient {
  Future get({required String url});
}

class HttpClient implements AHttpClient {
  final client = http.Client();
  @override
  Future get({required String url}) {
    throw UnimplementedError();
  }
}
