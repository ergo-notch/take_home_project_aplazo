abstract class HttpClientService {
  Future<dynamic> post({
    required String path,
    required dynamic data,
  });

  Future<dynamic> get({
    required String path,
  });
}
