import 'package:flutter/material.dart';
import 'package:wallet_app/screens/bill_detail_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String _selectedCategory = '全部';
  String _selectedTimeRange = '最近30天';
  bool _showOnlyExpenses = false;
  bool _showOnlyIncome = false;

  // 模拟交易数据
  final List<Map<String, dynamic>> _transactions = [
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
      'paymentMethod': '招商银行 (8821)',
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
      'paymentMethod': '工商银行 (6688)',
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
      'paymentMethod': '招商银行 (8821)',
    },
    {
      'id': '4',
      'title': '交通费用',
      'amount': -45.00,
      'category': '交通',
      'date': '2023-11-15',
      'time': '08:30',
      'icon': Icons.directions_car,
      'color': const Color(0xFFE8D8F0),
      'textColor': const Color(0xFF6E5A7A),
      'paymentMethod': '支付宝',
    },
    {
      'id': '5',
      'title': '房租',
      'amount': -3500.00,
      'category': '住房',
      'date': '2023-11-01',
      'time': '10:00',
      'icon': Icons.home,
      'color': const Color(0xFFF5E5D3),
      'textColor': const Color(0xFF7D6A57),
      'paymentMethod': '建设银行 (9988)',
    },
  ];

  // 交易分类
  final List<String> _categories = [
    '全部',
    '餐饮',
    '购物',
    '交通',
    '住房',
    '娱乐',
    '医疗',
    '教育',
    '收入',
  ];

  // 时间范围
  final List<String> _timeRanges = [
    '今天',
    '最近7天',
    '最近30天',
    '本月',
    '上月',
    '今年',
    '自定义',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF313330)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '交易记录',
          style: TextStyle(
            color: Color(0xFF313330),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF313330)),
            onPressed: () {
              _showFilterDialog();
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort, color: Color(0xFF313330)),
            onPressed: () {
              _showSortDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 筛选和统计信息
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
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
                  const Text(
                    '统计信息',
                    style: TextStyle(
                      color: Color(0xFF313330),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '总收入',
                            style: TextStyle(
                              color: Color(0xFF5E5F5C),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '¥8,500.00',
                            style: TextStyle(
                              color: const Color(0xFF556354),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '总支出',
                            style: TextStyle(
                              color: Color(0xFF5E5F5C),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '¥3,711.50',
                            style: TextStyle(
                              color: const Color(0xFF313330),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 交易列表
            const SizedBox(height: 32),
            const Text(
              '交易列表',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: _transactions.map((transaction) {
                return _buildTransactionItem(transaction);
              }).toList(),
            ),

            // 底部间距
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bill-detail');
      },
      child: Container(
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
                      '${transaction['date']} ${transaction['time']} · ${transaction['paymentMethod']}',
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
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('筛选'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('分类'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _categories.map((category) {
                    return ChoiceChip(
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      selectedColor: const Color(0xFF52616B),
                      labelStyle: TextStyle(
                        color: _selectedCategory == category ? Colors.white : const Color(0xFF313330),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text('时间范围'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _timeRanges.map((range) {
                    return ChoiceChip(
                      label: Text(range),
                      selected: _selectedTimeRange == range,
                      onSelected: (selected) {
                        setState(() {
                          _selectedTimeRange = range;
                        });
                      },
                      selectedColor: const Color(0xFF52616B),
                      labelStyle: TextStyle(
                        color: _selectedTimeRange == range ? Colors.white : const Color(0xFF313330),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _showOnlyExpenses,
                      onChanged: (value) {
                        setState(() {
                          _showOnlyExpenses = value!;
                          if (value) {
                            _showOnlyIncome = false;
                          }
                        });
                      },
                    ),
                    const Text('只看支出'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _showOnlyIncome,
                      onChanged: (value) {
                        setState(() {
                          _showOnlyIncome = value!;
                          if (value) {
                            _showOnlyExpenses = false;
                          }
                        });
                      },
                    ),
                    const Text('只看收入'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 应用筛选
                Navigator.pop(context);
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('排序'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('按日期排序（最新优先）'),
                trailing: const Icon(Icons.check),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('按日期排序（最早优先）'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('按金额排序（从大到小）'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('按金额排序（从小到大）'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
