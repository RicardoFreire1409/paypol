import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/common.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      children: [
        const SizedBox(height: 4),
        const CircleAvatar(radius: 20, child: Icon(Icons.person, size: 26)),
        const SizedBox(height: 8),
        Text('Domingo, 11 de Agosto de 2025', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Center(child: Text('Mi Código QR', style: Theme.of(context).textTheme.titleMedium)),
        const SizedBox(height: 10),

        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFA7EB9B),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
                ),
                child: QrImageView(
                  data: 'paypol:usuario=juan@espol.edu.ec',
                  size: 210,
                  eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square),
                  dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square),
                ),
              ),
              const Text('Paypol', style: TextStyle(fontWeight: FontWeight.w800)),
              // Si tienes logo: coloca Image.asset('assets/paypol.png', height: 48),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Column(
            children: const [
              Text('Usuario:'),
              Text('juan@espol.edu.ec', style: TextStyle(fontWeight: FontWeight.w800)),
            ],
          ),
        ),
        const SizedBox(height: 14),
        const BigSoftButton(label: 'Compartir', icon: Icons.send_rounded),
      ],
    );
  }
}
