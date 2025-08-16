import 'package:flutter/material.dart';
import '../widgets/common.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      children: [
        const BrandHeader(),
        Text('Domingo, 11 de Agosto de 2025', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 12),
        const CircleAvatar(radius: 44, backgroundColor: Colors.black26, child: Icon(Icons.person, size: 48, color: Colors.white70)),
        const SizedBox(height: 18),
        Center(child: Text('Mi Perfil', style: Theme.of(context).textTheme.titleMedium)),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: const [
              _FieldLine(label: 'Nombres:'),
              _FieldLine(label: 'Apellidos:'),
              _FieldLine(label: 'Matrícula:'),
              _FieldLine(label: 'Facultad:'),
              _FieldLine(label: 'Usuario:'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const BigSoftButton(label: 'Compartir', icon: Icons.send_rounded),
      ],
    );
  }
}

class _FieldLine extends StatelessWidget {
  final String label;
  final String value;
  const _FieldLine({required this.label, this.value = ''});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
        Expanded(child: Text(value.isEmpty ? '—' : value)),
      ],
    );
  }
}
