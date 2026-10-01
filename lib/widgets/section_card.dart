import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Widget? child;

  const SectionCard({super.key, required this.title, this.subtitle, this.trailing, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800))),
            if (trailing != null) trailing!,
          ]),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ],
          if (child != null) ...[const SizedBox(height: 14), child!],
        ],
      ),
    );
    return Card(child: onTap == null ? body : InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: body));
  }
}
