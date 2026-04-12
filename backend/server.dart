import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router();

  // 模拟数据
  final bills = [
    {
      'id': '1',
      'category': '餐饮美食',
      'amount': -168.00,
      'date': '2023年11月24日 19:32',
      'paymentMethod': '招商银行 (8821)',
      'balance': 12450.00,
      'tags': ['晚餐', '朋友聚会'],
      'note': '和老友在静安寺附近的意式餐厅叙旧，氛围很好，手工意面味道正宗。',
      'location': '上海市静安区延安西路',
      'images': [
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDtTzKtAnQUpZeyqXf1mF347NPdF7vsyGZ7vOKpr8wAetwBfQSdjwUwS8sFTrIkvx2L4DDIMxWVYD3otNFwUbO02cXQFrBK6N5SZF0L8652gBNWpOHz2jtwAat109z4xdDqBwwormGNXI1re4cZn818TeUsbROWZGQf8pocXwJdQwHqZNG8H8vEYtsHTeFt6DfBXiFJMvQaas92rr886gQw_tfecCgLBVAYUrLAANxJLhhki1BumtZC_g7kkFaBlN6wAPAOj88flaM',
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDZiW9cCC3GeastLbE1TT8Lu3sr8zX5vtSw_UvGYZLtRuYeEqnCGcfC7nGcYCjjhCzx0cf-EiI4Ck1WnDcgmKkSLxW80nlLfhlEc6II9fvBf4xV-wX7yRU66PdHaejTmYEGatNLLK_phMu3zL-zzJqwEXtmsiQvLcubhDOMbckduZDQLcs97-ju3TIfPHjUhmVucd5eq-LlQaq91j8R0vaoKsMieMG3l0tVKmk9O4YCmhgc2ly_5xw8qFeBlhqhryy2EfbSA2n3MhU'
      ]
    },
    {
      'id': '2',
      'category': '交通出行',
      'amount': -45.00,
      'date': '2023年11月24日 18:15',
      'paymentMethod': '支付宝',
      'balance': 12495.00,
      'tags': ['打车', '加班'],
      'note': '加班后打车回家',
      'location': '上海市浦东新区张江高科技园区',
      'images': []
    }
  ];

  // 获取账单列表
  router.get('/api/bills', (Request request) {
    return Response.ok(
      '${bills.map((bill) => bill).toList()}',
      headers: {'Content-Type': 'application/json'},
    );
  });

  // 获取单个账单详情
  router.get('/api/bills/<id>', (Request request, String id) {
    final bill = bills.firstWhere((bill) => bill['id'] == id, orElse: () => null);
    if (bill == null) {
      return Response.notFound('Bill not found');
    }
    return Response.ok(
      '$bill',
      headers: {'Content-Type': 'application/json'},
    );
  });

  // 创建新账单
  router.post('/api/bills', (Request request) async {
    final body = await request.readAsString();
    // 这里应该解析 JSON 并添加新账单
    return Response.ok(
      'Bill created successfully',
      headers: {'Content-Type': 'application/json'},
    );
  });

  // 更新账单
  router.put('/api/bills/<id>', (Request request, String id) async {
    final body = await request.readAsString();
    // 这里应该解析 JSON 并更新账单
    return Response.ok(
      'Bill updated successfully',
      headers: {'Content-Type': 'application/json'},
    );
  });

  // 删除账单
  router.delete('/api/bills/<id>', (Request request, String id) {
    // 这里应该删除账单
    return Response.ok(
      'Bill deleted successfully',
      headers: {'Content-Type': 'application/json'},
    );
  });

  // 安全设置相关 API
  router.get('/api/security/settings', (Request request) {
    return Response.ok(
      '{"biometricEnabled": true, "hideBalance": false, "pinCodeSet": true}',
      headers: {'Content-Type': 'application/json'},
    );
  });

  router.put('/api/security/settings', (Request request) async {
    final body = await request.readAsString();
    // 这里应该解析 JSON 并更新安全设置
    return Response.ok(
      'Security settings updated successfully',
      headers: {'Content-Type': 'application/json'},
    );
  });

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);
  final server = await serve(handler, 'localhost', 8080);
  print('Server running on http://{server.address.host}:{server.port}');
}