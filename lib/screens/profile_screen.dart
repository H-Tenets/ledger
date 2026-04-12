import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nicknameController = TextEditingController(text: 'Alex Rivera');

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
          '个人设置',
          style: TextStyle(
            color: Color(0xFF52616B),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header Section
            const SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF313330).withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 32,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(64),
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCMo6dOYlxfbTXmSJFNsq6D9zTQa8v2JTTMVFx5j3Q1hyQQNdFQt0rzF6Bsjk_6wqy6nf22Mjdm1drUgFoqt3oqD6V56X9C_cEM_N3RUt9_oou2O4aC4SoEbXvWCfIanzYtZxp_0am7U4mpPM83Z3r-UOk5Iq5U8TduaGKIKEqSsCemWB0uN0YOjkaUBWq__cRojBY4PCGietWq_NcH1TI1SACd-mlr4RtSrcuhdp8U6yGzLlBA39NPa1s1xDIenFGZkkCXNpGwkIU',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF52616B),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF313330).withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Color(0xFFF4F9FF),
                        size: 16,
                      ),
                      onPressed: () {
                        // Handle edit avatar
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '修改个人用户资料',
              style: TextStyle(
                color: const Color(0xFF5E5F5C),
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.5,
                // fontFamily: 'Noto Sans SC',
              ),
            ),
            const SizedBox(height: 48),

            // Minimalist Form
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nickname Field
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    '昵称',
                    style: TextStyle(
                      color: const Color(0xFF5E5F5C),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      // fontFamily: 'Noto Sans SC',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFFB2B2AE).withOpacity(0.2),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF52616B),
                      ),
                    ),
                    hintText: '请输入您的昵称',
                    hintStyle: TextStyle(
                      color: const Color(0xFF5E5F5C).withOpacity(0.5),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.5,
                    // fontFamily: 'Noto Sans SC',
                  ),
                ),
                const SizedBox(height: 40),

                // Join Date Field (Read-only)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    '入会日期',
                    style: TextStyle(
                      color: const Color(0xFF5E5F5C),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      // fontFamily: 'Noto Sans SC',
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Color(0xFF5E5F5C),
                      opacity: 0.4,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '2023年10月24日',
                      style: TextStyle(
                        color: const Color(0xFF5E5F5C),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'Noto Sans SC',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Account Details
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '总资产',
                              style: TextStyle(
                                color: const Color(0xFF5E5F5C),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                // fontFamily: 'Noto Sans SC',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '¥ 12,480',
                              style: const TextStyle(
                                color: Color(0xFF52616B),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEEEE0).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '分析数据',
                              style: TextStyle(
                                color: const Color(0xFF63584E),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                // fontFamily: 'Noto Sans SC',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '98.2%',
                              style: const TextStyle(
                                color: Color(0xFF685D53),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                // fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Save Action
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle save changes
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF52616B),
                          foregroundColor: const Color(0xFFF4F9FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF52616B).withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 32,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Text(
                          '保存更改',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            // fontFamily: 'Noto Sans SC',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          // Handle reset preferences
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF5E5F5C),
                        ),
                        child: Text(
                          '重置偏好',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Noto Sans SC',
                          ),
                        ),
                      ),
                    ),
                  ],
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
        currentIndex: 3,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}