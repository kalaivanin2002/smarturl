import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  final dio = Dio();
  final baseURL = 'http://localhost:3000/';

  Future<List> getURLs() async {
    try {
      final res = await dio.get(baseURL);
      final data = res.data;
      List urls = data['shortUrls'] ?? [];
      return urls;
    } catch (e) {
      return [];
    }
  }

  Future<bool> addURL(String url) async {
    try {
      final res = await dio.post(
        '${'http://localhost:3000/'}shortUrls',
        data: {'fullUrl': url},
      );
      return res.statusCode == 201 ? true : false;
    } catch (e) {
      return false;
    }
  }

  launchShortURL(String url) {
    launchUrl(Uri.parse(url));
  }
}
