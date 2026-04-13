import 'package:flutter/material.dart';
import 'package:wallet_app/screens/privacy_security_screen.dart';
import 'package:wallet_app/screens/bill_detail_screen.dart';
import 'package:wallet_app/screens/profile_screen.dart';
import 'package:wallet_app/screens/add_plan_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _hideBalance = false;
  int _currentIndex = 0;

  // 模拟最近交易数据
  final List<Map<String, dynamic>> _recentTransactions = [
    {
      'id': '1',
      'title': '星巴克咖啡',
      'amount': -38.50,
      'category': '餐饮',
      'date': '2023-11-24',
      'time': '19:32',
      'icon': Icons.coffee,
      'color': const Color(0xFFD8E7D4),
      'textColor': const Color(0xFF556354),
    },
    {
      'id': '2',
      'title': '工资收入',
      'amount': 8500.00,
      'category': '收入',
      'date': '2023-11-20',
      'time': '09:00',
      'icon': Icons.account_balance_wallet,
      'color': const Color(0xFFD5E5F1),
      'textColor': const Color(0xFF52616B),
    },
    {
      'id': '3',
      'title': '超市购物',
      'amount': -128.00,
      'category': '购物',
      'date': '2023-11-18',
      'time': '14:25',
      'icon': Icons.shopping_cart,
      'color': const Color(0xFFFEEEE0),
      'textColor': const Color(0xFF685D53),
    },
  ];

  // 模拟账户余额
  final double _accountBalance = 12450.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF313330)),
          onPressed: () {
            // 打开侧边栏
          },
        ),
        title: const Text(
          'Miaoji',
          style: TextStyle(
            color: Color(0xFF313330),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFF313330)),
            onPressed: () {
              // 打开通知
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFF313330)),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 欢迎信息
            const SizedBox(height: 32),
            const Text(
              '你好，用户',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              '今天是 2023年11月24日',
              style: TextStyle(
                color: Color(0xFF5E5F5C),
                fontSize: 14,
              ),
            ),

            // 账户余额卡片
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF313330).withOpacity(0.04),
                    spreadRadius: 0,
                    blurRadius: 32,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '账户余额',
                        style: TextStyle(
                          color: Color(0xFF5E5F5C),
                          fontSize: 14,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _hideBalance ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF5E5F5C),
                        ),
                        onPressed: () {
                          setState(() {
                            _hideBalance = !_hideBalance;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _hideBalance ? '****.**' : '¥${_accountBalance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xFF313330),
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F0),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          '总资产',
                          style: TextStyle(
                            color: Color(0xFF313330),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F0),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          '本月支出',
                          style: TextStyle(
                            color: Color(0xFF313330),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 快捷操作按钮
            const SizedBox(height: 32),
            const Text(
              '快捷操作',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildQuickAction(Icons.send, '转账', const Color(0xFFD5E5F1), const Color(0xFF52616B)),
                _buildQuickAction(Icons.qr_code_scanner, '扫码', const Color(0xFFD8E7D4), const Color(0xFF556354)),
                _buildQuickAction(Icons.receipt, '收款', const Color(0xFFFEEEE0), const Color(0xFF685D53)),
                _buildQuickAction(Icons.add, '新增', const Color(0xFFE8D8F0), const Color(0xFF6E5A7A)),
              ],
            ),

            // 最近交易
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '最近交易',
                  style: TextStyle(
                    color: Color(0xFF313330),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // 查看所有交易
                  },
                  child: const Text(
                    '查看全部',
                    style: TextStyle(
                      color: Color(0xFF52616B),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: _recentTransactions.map((transaction) {
                return _buildTransactionItem(transaction);
              }).toList(),
            ),

            // 底部间距
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // 导航到对应页面
          switch (index) {
            case 0:
              // 首页
              break;
            case 1:
              // 交易
              break;
            case 2:
              // 计划
              Navigator.pushNamed(context, '/add-plan');
              break;
            case 3:
              // 我的
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home, color: Color(0xFF52616B)),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.swap_horiz, color: Color(0xFF5E5F5C)),
            label: '交易',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today, color: Color(0xFF5E5F5C)),
            label: '计划',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person, color: Color(0xFF5E5F5C)),
            label: '我的',
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color backgroundColor, Color textColor) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(icon, color: textColor),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF313330),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFB2B2AE),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: transaction['color'],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(transaction['icon'], color: transaction['textColor']),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['title'],
                    style: const TextStyle(
                      color: Color(0xFF313330),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${transaction['date']} ${transaction['time']}',
                    style: const TextStyle(
                      color: Color(0xFF5E5F5C),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${transaction['amount'] >= 0 ? '+' : ''}¥${transaction['amount'].abs().toStringAsFixed(2)}',
            style: TextStyle(
              color: transaction['amount'] >= 0 ? const Color(0xFF556354) : const Color(0xFF313330),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
