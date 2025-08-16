import 'package:flutter/material.dart';
import '../theme.dart';

class BrandHeader extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const BrandHeader({super.key, this.padding = const EdgeInsets.only(top: 8, bottom: 8)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          // Descomenta si tienes el asset:
          // Image.asset('assets/paypol.png', height: 54),
          Text('Paypol', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

class SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;
  const SoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.color = AppColors.card,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: child,
    );
  }
}

class BigSoftButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  const BigSoftButton({super.key, required this.label, this.onPressed, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 22),
                  const SizedBox(width: 8),
                ],
                Text(label, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
