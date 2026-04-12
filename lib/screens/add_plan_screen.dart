import 'package:flutter/material.dart';

class AddPlanScreen extends StatefulWidget {
  const AddPlanScreen({super.key});

  @override
  _AddPlanScreenState createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  int _selectedCategory = 0; // 0: 短期待办, 1: 中期计划, 2: 长期计划
  TextEditingController _taskNameController = TextEditingController();
  bool _aiFeatureEnabled = true;

  // 清单项目
  List<Map<String, dynamic>> _items = [
    {'name': '有机蔬菜', 'completed': false},
    {'name': '牛奶', 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Color(0xFF52616B),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '新增计划',
          style: TextStyle(
            color: Color(0xFF52616B),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Handle save
            },
            child: const Text(
              '保存',
              style: TextStyle(
                color: Color(0xFF52616B),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Switcher
            const SizedBox(height: 16),
            Center(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F3F0),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: _selectedCategory == 0 
                              ? const Color(0xFFFFFFFF) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: _selectedCategory == 0 
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF313330).withOpacity(0.04),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          '短期待办',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _selectedCategory == 0 
                                ? const Color(0xFF52616B) 
                                : const Color(0xFF5E5F5C),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: _selectedCategory == 1 
                              ? const Color(0xFFFFFFFF) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: _selectedCategory == 1 
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF313330).withOpacity(0.04),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          '中期计划',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _selectedCategory == 1 
                                ? const Color(0xFF52616B) 
                                : const Color(0xFF5E5F5C),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = 2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: _selectedCategory == 2 
                              ? const Color(0xFFFFFFFF) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: _selectedCategory == 2 
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF313330).withOpacity(0.04),
                                    spreadRadius: 0,
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          '长期计划',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _selectedCategory == 2 
                                ? const Color(0xFF52616B) 
                                : const Color(0xFF5E5F5C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Main Input
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '任务名称',
                style: TextStyle(
                  color: const Color(0xFF5E5F5C).withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  // fontFamily: 'Noto Sans SC',
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _taskNameController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFFB2B2AE).withOpacity(0.2),
                    width: 2,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF52616B),
                    width: 2,
                  ),
                ),
                hintText: '例如：日常买菜',
                hintStyle: TextStyle(
                  color: const Color(0xFFB2B2AE).withOpacity(0.4),
                ),
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                // fontFamily: 'Noto Sans SC',
              ),
            ),
            const SizedBox(height: 40),

            // Dynamic Content Area
            Column(
              spaceBetween: 24,
              children: [
                // Items Checklist Card
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F3F0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.shopping_basket,
                                color: Color(0xFF556354),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '清单项目',
                                style: TextStyle(
                                  color: Color(0xFF313330),
                                  fontWeight: FontWeight.w600,
                                  // fontFamily: 'Noto Sans SC',
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle add item
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Color(0xFF52616B),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '添加',
                                  style: TextStyle(
                                    color: Color(0xFF52616B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Column(
                        spaceBetween: 16,
                        children: _items.map((item) {
                          return Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xFFB2B2AE).withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFFB2B2AE),
                                        opacity: 0.1,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    item['name'],
                                    style: TextStyle(
                                      color: item['completed'] 
                                          ? const Color(0xFF5E5F5C).withOpacity(0.4) 
                                          : const Color(0xFF313330).withOpacity(0.8),
                                      // fontFamily: 'Noto Sans SC',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.drag_handle,
                                color: const Color(0xFFB2B2AE),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                // Execution Date
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF313330).withOpacity(0.03),
                        spreadRadius: 0,
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
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
                              color: const Color(0xFFD8E7D4).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Color(0xFF556354),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Execution Date',
                                style: TextStyle(
                                  color: const Color(0xFF5E5F5C).withOpacity(0.4),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.1,
                                  // fontFamily: 'Noto Sans SC',
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                '执行日期',
                                style: TextStyle(
                                  color: Color(0xFF313330),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  // fontFamily: 'Noto Sans SC',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            '24',
                            style: TextStyle(
                              color: Color(0xFF52616B),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Manrope',
                            ),
                          ),
                          Text(
                            '3月, 2024',
                            style: TextStyle(
                              color: Color(0xFF5E5F5C),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Noto Sans SC',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // AI Feature Toggle
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8E7D4).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Color(0xFF556354),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'AI 自动分类',
                                style: TextStyle(
                                  color: Color(0xFF485547),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  // fontFamily: 'Noto Sans SC',
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '完成任务后AI将自动识别交易意图，并记录至您的个人账本。',
                                style: TextStyle(
                                  color: const Color(0xFF525F50),
                                  fontSize: 14,
                                  lineHeight: 1.5,
                                  // fontFamily: 'Noto Sans SC',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: _aiFeatureEnabled,
                        onChanged: (value) {
                          setState(() {
                            _aiFeatureEnabled = value;
                          });
                        },
                        activeColor: const Color(0xFF556354),
                        inactiveTrackColor: const Color(0xFFB2B2AE).withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFBF9F6).withOpacity(0.9),
        elevation: 8,
        selectedItemColor: const Color(0xFF52616B),
        unselectedItemColor: const Color(0xFF5E5F5C),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: '分析',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: '计划',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人',
          ),
        ],
        currentIndex: 2,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

// Extension for Column to add space between children
extension ColumnExtension on Column {
  Column spaceBetween(double space) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children.expand((child) => [child, SizedBox(height: space)]).toList()..removeLast(),
    );
  }
}