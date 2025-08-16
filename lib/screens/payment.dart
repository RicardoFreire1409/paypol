import 'package:flutter/material.dart';
import '../widgets/common.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final amountCtrl = TextEditingController();
    String selected = 'Frutango';

    return StatefulBuilder(
      builder: (context, setState) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          children: [
            const BrandHeader(),
            Text('Domingo, 11 de Agosto de 2025', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Center(child: Text('Pago', style: Theme.of(context).textTheme.titleMedium)),
            const SizedBox(height: 8),

            SoftCard(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selected,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'Frutango', child: Text('Frutango')),
                    DropdownMenuItem(value: 'Cafetería FIEC', child: Text('Cafetería FIEC')),
                    DropdownMenuItem(value: 'Librería', child: Text('Librería')),
                  ],
                  onChanged: (v) => setState(() => selected = v ?? selected),
                ),
              ),
            ),

            SoftCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Saldo Disponible: \$2.95'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: amountCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      hintText: '0.00',
                      filled: true,
                      fillColor: Color(0xFFD2FFC6),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(14))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            const BigSoftButton(label: 'Pagar', icon: Icons.attach_money_rounded),
          ],
        );
      },
    );
  }
}
