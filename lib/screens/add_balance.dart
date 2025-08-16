import 'package:flutter/material.dart';
import '../widgets/common.dart';

class AddBalanceScreen extends StatelessWidget {
  const AddBalanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      children: [
        const BrandHeader(),
        Text('Domingo, 11 de Agosto de 2025', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),

        const SectionTitle('Agregar saldo'),
        SoftCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Saldo Disponible: \$2.95'),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
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

        const SectionTitle('Método de pago'),
        SoftCard(
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mastercard', style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(height: 4),
                    Text('terminado en 0123'),
                    Text('Expira el 09/29'),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD2FFC6),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.refresh_rounded),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        const BigSoftButton(label: 'Agregar Saldo', icon: Icons.attach_money_rounded),
        const SizedBox(height: 8),
      ],
    );
  }
}
