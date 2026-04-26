import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bmi_category.dart';

class BmiService {
  static const _endpoint =
      'https://gist.githubusercontent.com/gatau-zzz/45d6486d70e6f986a9c9fa3a3edb6b4a/raw/24b94045be1c9c52271be62137c394e94e5529a7/bmi_categories.json';

  /// Mengambil daftar kategori BMI dari server
  static Future<List<BmiCategory>> fetchCategories() async {
    final response = await http
        .get(Uri.parse(_endpoint))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data
          .map((item) => BmiCategory.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat data (HTTP ${response.statusCode})');
    }
  }
}
