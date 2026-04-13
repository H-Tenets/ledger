import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String _selectedRecipient = '';
  double _transferAmount = 0.0;
  String _remark = '';
  String _selectedPaymentMethod = '招商银行 (8821)';
  bool _isLoading = false;

  // 模拟收款人列表
  final List<Map<String, dynamic>> _recipients = [
    {
      'id': '1',
      'name': '张三',
      'account': '招商银行 (6688)',
      'avatar': 'https://randomuser.me/api/portraits/men/32.jpg',
    },
    {
      'id': '2',
      'name': '李四',
      'account': '工商银行 (9988)',
      'avatar': 'https://randomuser.me/api/portraits/women/44.jpg',
    },
    {
      'id': '3',
      'name': '王五',
      'account': '建设银行 (7766)',
      'avatar': 'https://randomuser.me/api/portraits/men/55.jpg',
    },
  ];

  // 模拟支付方式列表
  final List<String> _paymentMethods = [
    '招商银行 (8821)',
    '工商银行 (6688)',
    '建设银行 (9988)',
    '支付宝',
    '微信支付',
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
          '转账',
          style: TextStyle(
            color: Color(0xFF313330),
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
            // 收款人选择
            const SizedBox(height: 32),
            const Text(
              '选择收款人',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _showRecipientDialog();
              },
              child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedRecipient.isEmpty
                        ? const Text(
                            '点击选择收款人',
                            style: TextStyle(
                              color: Color(0xFF5E5F5C),
                              fontSize: 16,
                            ),
                          )
                        : Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _recipients.firstWhere(
                                    (recipient) => recipient['name'] == _selectedRecipient,
                                    orElse: () => {'avatar': 'https://randomuser.me/api/portraits/men/32.jpg'},
                                  )['avatar'],
                                ),
                                radius: 24,
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedRecipient,
                                    style: const TextStyle(
                                      color: Color(0xFF313330),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    _recipients.firstWhere(
                                      (recipient) => recipient['name'] == _selectedRecipient,
                                      orElse: () => {'account': ''},
                                    )['account'],
                                    style: const TextStyle(
                                      color: Color(0xFF5E5F5C),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    const Icon(Icons.chevron_right, color: Color(0xFF5E5F5C)),
                  ],
                ),
              ),
            ),

            // 转账金额
            const SizedBox(height: 32),
            const Text(
              '转账金额',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
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
                    '¥',
                    style: TextStyle(
                      color: Color(0xFF313330),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入转账金额',
                      hintStyle: TextStyle(
                        color: Color(0xFF5E5F5C),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF313330),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _transferAmount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAmountButton('100'),
                      _buildAmountButton('500'),
                      _buildAmountButton('1000'),
                      _buildAmountButton('5000'),
                    ],
                  ),
                ],
              ),
            ),

            // 转账备注
            const SizedBox(height: 32),
            const Text(
              '转账备注',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
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
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '添加备注（选填）',
                  hintStyle: TextStyle(
                    color: Color(0xFF5E5F5C),
                    fontSize: 14,
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFF313330),
                  fontSize: 14,
                ),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _remark = value;
                  });
                },
              ),
            ),

            // 支付方式
            const SizedBox(height: 32),
            const Text(
              '支付方式',
              style: TextStyle(
                color: Color(0xFF313330),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _showPaymentMethodDialog();
              },
              child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedPaymentMethod,
                      style: const TextStyle(
                        color: Color(0xFF313330),
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Color(0xFF5E5F5C)),
                  ],
                ),
              ),
            ),

            // 确认转账按钮
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedRecipient.isEmpty || _transferAmount <= 0
                    ? null
                    : () {
                        _confirmTransfer();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF52616B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shadowColor: const Color(0xFF52616B).withOpacity(0.15),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        '确认转账',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),

            // 底部间距
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountButton(String amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _transferAmount = double.parse(amount);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _transferAmount == double.parse(amount)
              ? const Color(0xFF52616B)
              : const Color(0xFFF5F3F0),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          '¥$amount',
          style: TextStyle(
            color: _transferAmount == double.parse(amount)
                ? Colors.white
                : const Color(0xFF313330),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _showRecipientDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('选择收款人'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _recipients.map((recipient) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(recipient['avatar']),
                  ),
                  title: Text(recipient['name']),
                  subtitle: Text(recipient['account']),
                  onTap: () {
                    setState(() {
                      _selectedRecipient = recipient['name'];
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentMethodDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('选择支付方式'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _paymentMethods.map((method) {
                return ListTile(
                  title: Text(method),
                  trailing: _selectedPaymentMethod == method
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = method;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }

  void _confirmTransfer() {
    setState(() {
      _isLoading = true;
    });

    // 模拟转账过程
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // 显示转账成功对话框
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('转账成功'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF556354),
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  '已成功向 $_selectedRecipient 转账 ¥${_transferAmount.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    });
  }
}
