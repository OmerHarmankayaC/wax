import 'package:flutter/material.dart';
import '../data/albums_data.dart';
import '../theme/app_theme.dart';
import '../widgets/featured_card.dart';
import '../widgets/album_card.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = kAlbums.first;
    final rest = kAlbums.skip(1).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WAX',
          style: TextStyle(
            fontFamily: 'Courier',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.album, color: kBlack, size: 28),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FeaturedCard(
                album: featured,
                onTap: () => Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: featured,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'ALL RECORDS',
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final album = rest[index];
                  return AlbumCard(
                    album: album,
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: album,
                    ),
                  );
                },
                childCount: rest.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
