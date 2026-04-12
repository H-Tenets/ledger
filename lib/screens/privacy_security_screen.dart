import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  _PrivacySecurityScreenState createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometricEnabled = true;
  bool _hideBalance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F6).withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF52616B),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '隐私与安全',
          style: TextStyle(
            color: Color(0xFF52616B),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Editorial Header Section
            const SizedBox(height: 16),
            Text(
              '安全账本 / SECURITY LEDGER',
              style: TextStyle(
                color: const Color(0xFF5E5F5C),
                fontSize: 10,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '保护您的\n财务私隐',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 48),

            // Main Settings List
            Column(
              spaceBetween: 16,
              children: [
                // Biometric Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F3F0),
                    borderRadius: BorderRadius.circular(12),
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
                              color: const Color(0xFFD8E7D4),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(
                              Icons.fingerprint,
                              color: Color(0xFF556354),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '生物识别登录',
                                style: TextStyle(
                                  color: Color(0xFF313330),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '使用 Face ID 或指纹快速解锁',
                                style: TextStyle(
                                  color: const Color(0xFF5E5F5C),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: _biometricEnabled,
                        onChanged: (value) {
                          setState(() {
                            _biometricEnabled = value;
                          });
                        },
                        activeColor: const Color(0xFF52616B),
                        inactiveTrackColor: const Color(0xFFE3E3DE),
                      ),
                    ],
                  ),
                ),

                // Hide Balance Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F3F0),
                    borderRadius: BorderRadius.circular(12),
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
                              color: const Color(0xFFFEEEE0),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF685D53),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '首页隐藏余额',
                                style: TextStyle(
                                  color: const Color(0xFF313330),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '进入应用后默认隐藏数值',
                                style: TextStyle(
                                  color: const Color(0xFF5E5F5C),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: _hideBalance,
                        onChanged: (value) {
                          setState(() {
                            _hideBalance = value;
                          });
                        },
                        activeColor: const Color(0xFF52616B),
                        inactiveTrackColor: const Color(0xFFE3E3DE),
                      ),
                    ],
                  ),
                ),

                // PIN Code Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFB2B2AE).withOpacity(0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF313330).withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 32,
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
                              color: const Color(0xFFD5E5F1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(
                              Icons.dialpad,
                              color: Color(0xFF52616B),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '数字密码锁',
                                style: TextStyle(
                                  color: Color(0xFF313330),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '设置 6 位安全数字 PIN 码',
                                style: TextStyle(
                                  color: const Color(0xFF5E5F5C),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF7A7B77),
                      ),
                    ],
                  ),
                ),

                // Spacing
                const SizedBox(height: 32),

                // Dangerous Zone Section
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    '危险区域 / DANGEROUS ZONE',
                    style: TextStyle(
                      color: const Color(0xFF5E5F5C),
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Account Deletion
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F3F0).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFFA746F).withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFA746F).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Icon(
                              Icons.delete_forever,
                              color: Color(0xFFA83836),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '注销账号',
                                style: TextStyle(
                                  color: Color(0xFF313330),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '此操作不可撤销。您的所有财务记录、资产配置以及加密数据将被永久删除。',
                                style: TextStyle(
                                  color: const Color(0xFF5E5F5C),
                                  fontSize: 14,
                                  lineHeight: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle account deletion
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: const Color(0xFFA83836),
                            side: BorderSide(
                              color: const Color(0xFFA83836).withOpacity(0.3),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            '申请永久删除账号',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Decorative Zen Element
                const SizedBox(height: 80),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB2B2AE).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Miaoji Security Core v4.0',
                        style: TextStyle(
                          color: const Color(0xFF313330).withOpacity(0.3),
                          fontSize: 10,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
        currentIndex: 3,
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