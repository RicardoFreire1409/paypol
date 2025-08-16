import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home.dart';
import 'screens/qr.dart';
import 'screens/add_balance.dart';
import 'screens/payment.dart';
import 'screens/profile.dart';

void main() => runApp(const PaypolApp());

class PaypolApp extends StatelessWidget {
  const PaypolApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paypol',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    QRScreen(),
    AddBalanceScreen(),
    ProfileScreen(),
    PaymentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: index,
          onDestinationSelected: (i) => setState(() => index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.qr_code_2_rounded), label: 'QR'),
            NavigationDestination(icon: Icon(Icons.add_card_rounded), label: 'Saldo'),
            NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Perfil'),
            NavigationDestination(icon: Icon(Icons.payments_rounded), label: 'Pagar'),
          ],
        ),
      ),
    );
  }
}
