import 'package:flutter/material.dart';
import 'package:wallet_app/screens/privacy_security_screen.dart';
import 'package:wallet_app/screens/bill_detail_screen.dart';
import 'package:wallet_app/screens/profile_screen.dart';
import 'package:wallet_app/screens/add_plan_screen.dart';
import 'package:wallet_app/screens/dashboard_screen.dart';
import 'package:wallet_app/screens/transactions_screen.dart';
import 'package:wallet_app/screens/transfer_screen.dart';
import 'package:wallet_app/screens/receive_screen.dart';

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
        '/': (context) => const DashboardScreen(),
        '/privacy': (context) => const PrivacySecurityScreen(),
        '/bill-detail': (context) => const BillDetailScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/add-plan': (context) => const AddPlanScreen(),
        '/transactions': (context) => const TransactionsScreen(),
        '/transfer': (context) => const TransferScreen(),
        '/receive': (context) => const ReceiveScreen(),
      },
    );
  }
}
