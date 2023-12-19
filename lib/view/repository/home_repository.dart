import 'dart:convert';
import 'package:http/http.dart' as http;
class homeRepository{

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz'));

    if (response.statusCode == 200) {
      // Successfully fetched data
      final Map<String, dynamic> data = json.decode(response.body);
      print('Parsed data: $data');
    } else {
      // Handle errors
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  }

}