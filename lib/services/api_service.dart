import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api';

  // 获取账单列表
  static Future<List<dynamic>> getBills() async {
    final response = await http.get(Uri.parse('$baseUrl/bills'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load bills');
    }
  }

  // 获取单个账单详情
  static Future<dynamic> getBill(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/bills/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load bill');
    }
  }

  // 创建新账单
  static Future<dynamic> createBill(Map<String, dynamic> bill) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bills'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(bill),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create bill');
    }
  }

  // 更新账单
  static Future<dynamic> updateBill(String id, Map<String, dynamic> bill) async {
    final response = await http.put(
      Uri.parse('$baseUrl/bills/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(bill),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update bill');
    }
  }

  // 删除账单
  static Future<dynamic> deleteBill(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/bills/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete bill');
    }
  }

  // 获取安全设置
  static Future<dynamic> getSecuritySettings() async {
    final response = await http.get(Uri.parse('$baseUrl/security/settings'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load security settings');
    }
  }

  // 更新安全设置
  static Future<dynamic> updateSecuritySettings(Map<String, dynamic> settings) async {
    final response = await http.put(
      Uri.parse('$baseUrl/security/settings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(settings),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update security settings');
    }
  }
}