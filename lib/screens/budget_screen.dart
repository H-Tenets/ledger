import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  double _monthlyBudget = 5000.0;
  double _spentAmount = 3711.50;
  String _selectedCategory = '全部';

  // 模拟预算分类数据
  final List<Map<String, dynamic>> _budgetCategories = [
    {
      'id': '1',
      'name': '餐饮',
      'budget': 1500.0,
      'spent': 1200.0,
      'color': const Color(0xFFD8E7D4),
      'textColor': const Color(0xFF556354),
      'icon': Icons.restaurant,
    },
    {
      'id': '2',
      'name': '购物',
      'budget': 1000.0,
      'spent': 800.0,
      'color': const Color(0xFFFEEEE0),
      'textColor': const Color(0xFF685D53),
      'icon': Icons.shopping_cart,
    },
    {
      'id': '3',
      'name': '交通',
      'budget': 500.0,
      'spent': 300.0,
      'color': const Color(0xFFE8D8F0),
      'textColor': const Color(0xFF6E5A7A),
      'icon': Icons.directions_car,
    },
    {
      'id': '4',
      'name': '住房',
      'budget': 3500.0,
      'spent': 3500.0,
      'color': const Color(0xFFF5E5D3),
      'textColor': const Color(0xFF7D6A57),
      'icon': Icons.home,
    },
    {
      'id': '5',
      'name': '娱乐',
      'budget': 500.0,
      'spent': 200.0,
      'color': const Color(0xFFD5E5F1),
      'textColor': const Color(0xFF52616B),
      'icon': Icons.movie,
    },
  ];

  // 预算分类列表
  final List<String> _categories = [
    '全部',
    '餐饮',
    '购物',
    '交通',
    '住房',
    '娱乐',
    '医疗',
    '教育',
  ];

  @override
  Widget build(BuildContext context) {
    double progress = _monthlyBudget > 0 ? _spentAmount / _monthlyBudget : 0;
    String progressPercentage = '${(progress * 100).toStringAsFixed(0)}%';

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
          '预算管理',
          style: TextStyle(
            color: const Color(0xFF313330),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 月度预算总览
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
                  const Text(
                    '本月预算',
                    style: TextStyle(
                      color: const Color(0xFF5E5F5C),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '¥${_monthlyBudget.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: const Color(0xFF313330),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '已用 $progressPercentage',
                        style: TextStyle(
                          color: progress > 0.8
                              ? const Color(0xFFA83836)
                              : progress > 0.6
                                  ? const Color(0xFF685D53)
                                  : const Color(0xFF556354),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFFF5F3F0),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress > 0.8
                          ? const Color(0xFFA83836)
                          : progress > 0.6
                              ? const Color(0xFF685D53)
                              : const Color(0xFF556354),
                    ),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '已花费: ¥${_spentAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: const Color(0xFF5E5F5C),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '剩余: ¥${(_monthlyBudget - _spentAmount).toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: const Color(0xFF556354),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _showBudgetEditDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF52616B),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            '调整预算',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 预算分类筛选
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '预算分类',
                  style: TextStyle(
                    color: const Color(0xFF313330),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownButton<String>(
                  value: _selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  style: const TextStyle(
                    color: const Color(0xFF313330),
                    fontSize: 14,
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF5E5F5C)),
                  underline: Container(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 预算分类列表
            Column(
              children: _budgetCategories
                  .where((category) =>
                      _selectedCategory == '全部' || category['name'] == _selectedCategory)
                  .map<Widget>((category) {
                double categoryProgress = category['budget'] > 0
                    ? category['spent'] / category['budget']
                    : 0;
                String categoryProgressPercentage = '${(categoryProgress * 100).toStringAsFixed(0)}%';

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: category['color'],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(category['icon'], color: category['textColor'], size: 20),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                category['name'],
                                style: const TextStyle(
                                  color: const Color(0xFF313330),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '¥${category['spent'].toStringAsFixed(2)}/${category['budget'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: const Color(0xFF5E5F5C),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: categoryProgress,
                        backgroundColor: const Color(0xFFF5F3F0),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          categoryProgress > 0.8
                              ? const Color(0xFFA83836)
                              : categoryProgress > 0.6
                                  ? const Color(0xFF685D53)
                                  : category['textColor'],
                        ),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            categoryProgressPercentage,
                            style: TextStyle(
                              color: categoryProgress > 0.8
                                  ? const Color(0xFFA83836)
                                  : categoryProgress > 0.6
                                      ? const Color(0xFF685D53)
                                      : category['textColor'],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            // 底部间距
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showBudgetEditDialog() {
    TextEditingController budgetController = TextEditingController(
      text: _monthlyBudget.toStringAsFixed(2),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('调整月度预算'),
          content: TextField(
            controller: budgetController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: '预算金额',
              prefixText: '¥',
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
                double newBudget = double.tryParse(budgetController.text) ?? _monthlyBudget;
                setState(() {
                  _monthlyBudget = newBudget;
                });
                Navigator.pop(context);
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}
