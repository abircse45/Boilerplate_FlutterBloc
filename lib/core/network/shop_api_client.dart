import 'dart:convert';
import 'package:http/http.dart' as http;

class ShopApiClient {
  static final ShopApiClient _instance = ShopApiClient._internal();
  factory ShopApiClient() => _instance;
  ShopApiClient._internal();

  final String _baseUrl = 'https://creationedge.com.bd/api/v1';

  Future<dynamic> searchShop({
    required String categoryId,
    String min = '',
    String max = '',
    String filter = '',
  }) async {
    final url =
        '$_baseUrl/search_shop?category=$categoryId&min=$min&max=$max&filter=$filter';
    final response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Network error: ${response.statusCode}');
    }
  }
}
