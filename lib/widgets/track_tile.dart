import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TrackTile extends StatelessWidget {
  final int number;
  final String title;

  const TrackTile({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kBlack, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Text(
              number.toString().padLeft(2, '0'),
              style: TextStyle(
                fontFamily: 'Courier',
                color: kBlack.withAlpha(128),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Courier',
                color: kBlack,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
