
import 'package:flutter/material.dart';

class IdCardSubtitle extends StatelessWidget {
  const IdCardSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: '$title : ',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600),
      ),
      TextSpan(
        text: subtitle,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500),
      )
    ]));
  }
}
