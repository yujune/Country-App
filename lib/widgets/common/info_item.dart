import 'package:country/utils/extensions.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: context.theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
