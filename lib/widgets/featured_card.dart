import 'package:flutter/material.dart';
import '../models/album.dart';
import '../theme/app_theme.dart';

class FeaturedCard extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const FeaturedCard({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(color: kBlack, width: 2.5),
          borderRadius: BorderRadius.zero,
          boxShadow: const [
            BoxShadow(color: kBlack, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              album.coverUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(color: kBlack),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    album.title.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      color: kWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    album.artist,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      color: kRed,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: kRed,
                child: const Text(
                  'FEATURED',
                  style: TextStyle(
                    fontFamily: 'Courier',
                    color: kWhite,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
