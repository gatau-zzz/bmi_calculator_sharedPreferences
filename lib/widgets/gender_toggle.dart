import 'package:flutter/material.dart';

class GenderToggle extends StatelessWidget {
  final bool isMale;
  final ValueChanged<bool> onChanged;

  const GenderToggle({
    super.key,
    required this.isMale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: const [Icon(Icons.male), Icon(Icons.female)],
      isSelected: [isMale, !isMale],
      onPressed: (index) => onChanged(index == 0),
    );
  }
}
