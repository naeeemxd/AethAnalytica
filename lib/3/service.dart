import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';
class RandomUserService {
  final String _baseUrl = 'https://randomuser.me/api';
  Future<List<RandomUser>> fetchRandomUsers(int count) async {
    final response = await http.get(Uri.parse('$_baseUrl/?results=$count'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> results = jsonData['results'];
      return results.map((json) => RandomUser.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load random users');
    }
  }
}
