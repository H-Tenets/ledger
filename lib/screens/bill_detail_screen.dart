import 'package:flutter/material.dart';

class BillDetailScreen extends StatefulWidget {
  const BillDetailScreen({super.key});

  @override
  _BillDetailScreenState createState() => _BillDetailScreenState();
}

class _BillDetailScreenState extends State<BillDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF9F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF52616B),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '账单详情',
          style: TextStyle(
            color: Color(0xFF313330),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Color(0xFF52616B),
            ),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category and Amount Section
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEEEE0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.restaurant,
                    color: Color(0xFF63584E),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  '餐饮美食',
                  style: TextStyle(
                    color: Color(0xFF5E5F5C),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '-168.00',
              style: TextStyle(
                color: Color(0xFF313330),
                fontWeight: FontWeight.extraBold,
                fontSize: 40,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '2023年11月24日 19:32',
              style: TextStyle(
                color: Color(0xFF5E5F5C),
                fontSize: 14,
                opacity: 0.7,
              ),
            ),
            const SizedBox(height: 40),

            // Payment and Balance Section
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
                      spaceBetween: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '支付方式',
                              style: TextStyle(
                                color: Color(0xFF5E5F5C),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const Text(
                              '招商银行 (8821)',
                              style: TextStyle(
                                color: Color(0xFF313330),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '账户余额',
                              style: TextStyle(
                                color: Color(0xFF5E5F5C),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const Text(
                              '¥12,450.00',
                              style: TextStyle(
                                color: Color(0xFF313330),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
                      color: const Color(0xFFF5F3F0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEEEE0).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: const Color(0xFFB2B2AE).withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.sell,
                                size: 14,
                                color: Color(0xFF63584E),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '晚餐',
                                style: TextStyle(
                                  color: const Color(0xFF63584E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEEEE0).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: const Color(0xFFB2B2AE).withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.sell,
                                size: 14,
                                color: Color(0xFF63584E),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '朋友聚会',
                                style: TextStyle(
                                  color: const Color(0xFF63584E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF52616B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            '+ 标签',
                            style: TextStyle(
                              color: Color(0xFF52616B),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Notes Section
            Text(
              '备注',
              style: TextStyle(
                color: Color(0xFF5E5F5C),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"和老友在静安寺附近的意式餐厅叙旧，氛围很好，手工意面味道正宗。"',
                    style: TextStyle(
                      color: const Color(0xFF313330),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      opacity: 0.9,
                      lineHeight: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          aspectRatio: 4/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFB2B2AE).withOpacity(0.1),
                            ),
                            image: const DecorationImage(
                              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDtTzKtAnQUpZeyqXf1mF347NPdF7vsyGZ7vOKpr8wAetwBfQSdjwUwS8sFTrIkvx2L4DDIMxWVYD3otNFwUbO02cXQFrBK6N5SZF0L8652gBNWpOHz2jtwAat109z4xdDqBwwormGNXI1re4cZn818TeUsbROWZGQf8pocXwJdQwHqZNG8H8vEYtsHTeFt6DfBXiFJMvQaas92rr886gQw_tfecCgLBVAYUrLAANxJLhhki1BumtZC_g7kkFaBlN6wAPAOj88flaM'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          aspectRatio: 4/3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFFB2B2AE).withOpacity(0.1),
                            ),
                            image: const DecorationImage(
                              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDZiW9cCC3GeastLbE1TT8Lu3sr8zX5vtSw_UvGYZLtRuYeEqnCGcfC7nGcYCjjhCzx0cf-EiI4Ck1WnDcgmKkSLxW80nlLfhlEc6II9fvBf4xV-wX7yRU66PdHaejTmYEGatNLLK_phMu3zL-zzJqwEXtmsiQvLcubhDOMbckduZDQLcs97-ju3TIfPHjUhmVucd5eq-LlQaq91j8R0vaoKsMieMG3l0tVKmk9O4YCmhgc2ly_5xw8qFeBlhqhryy2EfbSA2n3MhU'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Location Section
            Text(
              '地点',
              style: TextStyle(
                color: Color(0xFF5E5F5C),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: '上海市静安区延安西路',
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '点击输入地点',
                        hintStyle: TextStyle(
                          color: Color(0xFF5E5F5C).withOpacity(0.5),
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFF313330),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF5E5F5C),
                    opacity: 0.4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle edit bill
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF52616B),
                      foregroundColor: const Color(0xFFF4F9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text(
                          '编辑账单',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFA746F).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xFFA83836),
                    ),
                    onPressed: () {
                      // Handle delete bill
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
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