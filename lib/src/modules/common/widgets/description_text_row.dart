import 'package:shadcn_flutter/shadcn_flutter.dart';

class DescriptionTextRow extends StatelessWidget {
  final String label;
  final String value;

  const DescriptionTextRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        Text(
          "$label:\t",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ).p,
        Text(value).p,
      ],
    );
  }
}
