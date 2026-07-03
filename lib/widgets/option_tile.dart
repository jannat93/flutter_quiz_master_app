import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context)
              .colorScheme
              .primaryContainer
              : null,
          border: Border.all(
            color: isSelected
                ? Theme.of(context)
                .colorScheme
                .primary
                : Colors.grey,
            width: 2,
          ),
          borderRadius:
          BorderRadius.circular(12),
        ),
        child: Text(
          option,
          style:
          const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}