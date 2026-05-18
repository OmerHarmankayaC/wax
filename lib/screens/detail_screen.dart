import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';
import '../theme/app_theme.dart';
import '../widgets/track_tile.dart';
import '../notifiers/collection_notifier.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final album = ModalRoute.of(context)!.settings.arguments as Album;
    final collection = context.watch<CollectionNotifier>();
    final isInCollection = collection.contains(album.id);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                '← BACK',
                style: TextStyle(
                  fontFamily: 'Courier',
                  color: kBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 80,
        title: Text(
          album.title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    album.coverUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) =>
                        Container(height: 300, color: kBlack),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    color: kRed,
                    child: Text(
                      '${album.year}',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.title.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    album.artist,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 16,
                      color: kRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${album.genre}  |  ${album.label}',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 12,
                      color: kBlack.withAlpha(153),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    album.description,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 13,
                      color: kBlack,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'TRACKLIST',
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kRed,
                  letterSpacing: 2,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              decoration: BoxDecoration(
                border: Border.all(color: kBlack, width: 2.5),
                color: kWhite,
                boxShadow: const [
                  BoxShadow(color: kBlack, offset: Offset(4, 4), blurRadius: 0),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < album.tracks.length; i++)
                    TrackTile(number: i + 1, title: album.tracks[i]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: GestureDetector(
                onTap: () {
                  if (!isInCollection) {
                    context.read<CollectionNotifier>().add(album);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: isInCollection ? kRed : kBlack,
                    border: Border.all(color: kRed, width: 2.5),
                  ),
                  child: Center(
                    child: Text(
                      isInCollection ? 'IN COLLECTION ✓' : 'ADD TO COLLECTION',
                      style: TextStyle(
                        fontFamily: 'Courier',
                        color: isInCollection ? kWhite : kBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
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
