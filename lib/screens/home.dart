import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/common.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 12), // avatar mini
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.qr_code_2_rounded, size: 18),
            )
          ],
        ),
        const BrandHeader(),
        Text('Domingo, 11 de Agosto de 2025', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SoftCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Saldo Disponible', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    const Text('\$2.95', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Agregar Saldo'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(child: _TinyChartCard()),
          ],
        ),

        const SizedBox(height: 12),
        const BigSoftButton(label: '\$   Pagar', icon: Icons.attach_money_rounded),
        const SizedBox(height: 8),

        const SectionTitle('Historial de transacciones'),
        const _HistoryCard(),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton(onPressed: () {}, child: const Text('Ver más')),
        ),

        const SizedBox(height: 16),
        const Center(child: Icon(Icons.qr_code_2_rounded, size: 20)),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard();

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      child: Column(
        children: const [
          _TxnRow(amountText: '-\$5.00', color: AppColors.danger, desc: 'Comida de Toño', tag: 'FIEC'),
          Divider(height: 12),
          _TxnRow(amountText: '-\$1.00', color: AppColors.danger, desc: 'FEDOL', tag: ''),
          Divider(height: 12),
          _TxnRow(amountText: '+\$10.00', color: Colors.green, desc: 'Pago: regar saldo', tag: ''),
        ],
      ),
    );
  }
}

class _TxnRow extends StatelessWidget {
  final String amountText;
  final Color color;
  final String desc;
  final String tag;
  const _TxnRow({required this.amountText, required this.color, required this.desc, required this.tag});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(amountText, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
        const SizedBox(width: 10),
        Expanded(child: Text(desc)),
        if (tag.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(tag, style: const TextStyle(fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }
}

class _TinyChartCard extends StatelessWidget {
  const _TinyChartCard();

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      child: SizedBox(
        height: 90,
        child: CustomPaint(painter: _TinyChartPainter()),
      ),
    );
  }
}

class _TinyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final base = Paint()..color = Colors.black26..strokeWidth = 1..style = PaintingStyle.stroke;
    final line = Paint()..color = Colors.black87..strokeWidth = 2..style = PaintingStyle.stroke;

    final r = RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(12));
    canvas.drawRRect(r, base);

    final pts = <Offset>[
      Offset(size.width*0.05, size.height*0.80),
      Offset(size.width*0.20, size.height*0.35),
      Offset(size.width*0.35, size.height*0.55),
      Offset(size.width*0.50, size.height*0.30),
      Offset(size.width*0.65, size.height*0.70),
      Offset(size.width*0.80, size.height*0.40),
      Offset(size.width*0.95, size.height*0.60),
    ];
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (final p in pts.skip(1)) { path.lineTo(p.dx, p.dy); }
    canvas.drawPath(path, line);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
