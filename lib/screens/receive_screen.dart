import 'package:flutter/material.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  double _receiveAmount = 0.0;
  String _remark = '';
  bool _isLoading = false;

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
          '收款',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 收款码
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
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
                children: [
                  // 模拟收款码
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F3F0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            size: 120,
                            color: Color(0xFF52616B),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '收款码',
                            style: TextStyle(
                              color: const Color(0xFF313330),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '请让付款方扫描此二维码',
                    style: TextStyle(
                      color: const Color(0xFF5E5F5C),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // 收款金额
            const SizedBox(height: 32),
            const Text(
              '收款金额',
              style: TextStyle(
                color: const Color(0xFF313330),
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
                      color: const Color(0xFF313330),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '请输入收款金额',
                      hintStyle: TextStyle(
                        color: const Color(0xFF5E5F5C),
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: const TextStyle(
                      color: const Color(0xFF313330),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _receiveAmount = double.tryParse(value) ?? 0.0;
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

            // 收款备注
            const SizedBox(height: 32),
            const Text(
              '收款备注',
              style: TextStyle(
                color: const Color(0xFF313330),
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
                    color: const Color(0xFF5E5F5C),
                    fontSize: 14,
                  ),
                ),
                style: const TextStyle(
                  color: const Color(0xFF313330),
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

            // 收款方式
            const SizedBox(height: 32),
            const Text(
              '收款方式',
              style: TextStyle(
                color: const Color(0xFF313330),
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
                children: [
                  _buildPaymentMethod('招商银行 (8821)', true),
                  const SizedBox(height: 16),
                  _buildPaymentMethod('工商银行 (6688)', false),
                  const SizedBox(height: 16),
                  _buildPaymentMethod('建设银行 (9988)', false),
                ],
              ),
            ),

            // 分享按钮
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        _shareReceiveInfo();
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
                        '分享收款信息',
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
          _receiveAmount = double.parse(amount);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _receiveAmount == double.parse(amount)
              ? const Color(0xFF52616B)
              : const Color(0xFFF5F3F0),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          '¥$amount',
          style: TextStyle(
            color: _receiveAmount == double.parse(amount)
                ? Colors.white
                : const Color(0xFF313330),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String method, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF5F3F0) : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF52616B)
              : const Color(0xFFB2B2AE).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            method,
            style: TextStyle(
              color: const Color(0xFF313330),
              fontSize: 14,
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Color(0xFF52616B),
              size: 20,
            ),
        ],
      ),
    );
  }

  void _shareReceiveInfo() {
    setState(() {
      _isLoading = true;
    });

    // 模拟分享过程
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // 显示分享成功对话框
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('分享成功'),
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
                  '收款信息已成功分享',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
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
