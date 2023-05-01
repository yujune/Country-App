import 'package:country/utils/extensions.dart';
import 'package:flutter/material.dart';

class CountryListItem extends StatelessWidget {
  const CountryListItem({
    super.key,
    required this.name,
    required this.flagImageUrl,
    this.onTap,
  });

  final String flagImageUrl;
  final String name;
  final Function(String name)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(name),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Flexible(flex: 1, child: Image.network(flagImageUrl)),
            const SizedBox(width: 10),
            Flexible(
                flex: 3,
                child: Text(
                  name,
                  style: context.theme.textTheme.bodyMedium,
                )),
          ],
        ),
      ),
    );
  }
}
