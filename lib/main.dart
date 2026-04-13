import 'package:flutter/material.dart';
import 'package:wallet_app/screens/privacy_security_screen.dart';
import 'package:wallet_app/screens/bill_detail_screen.dart';
import 'package:wallet_app/screens/profile_screen.dart';
import 'package:wallet_app/screens/add_plan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miaoji',
      theme: ThemeData(
        primaryColor: const Color(0xFF52616B),
        secondaryHeaderColor: const Color(0xFF556354),
        scaffoldBackgroundColor: const Color(0xFFFBF9F6),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF313330)),
          bodySmall: TextStyle(color: Color(0xFF5E5F5C)),
          titleMedium: TextStyle(
            color: Color(0xFF313330),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/privacy': (context) => const PrivacySecurityScreen(),
        '/bill-detail': (context) => const BillDetailScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/add-plan': (context) => const AddPlanScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miaoji'),
        backgroundColor: const Color(0xFFFBF9F6),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/privacy');
              },
              child: const Text('隐私与安全'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bill-detail');
              },
              child: const Text('账单详情'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('个人设置'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-plan');
              },
              child: const Text('新增计划'),
            ),
          ],
        ),
      ),
    );
  }
}