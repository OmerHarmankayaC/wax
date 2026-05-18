import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../notifiers/collection_notifier.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final collection = context.watch<CollectionNotifier>().collection;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY COLLECTION',
          style: TextStyle(letterSpacing: 2),
        ),
        actions: [
          if (collection.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kRed,
                  border: Border.all(color: kBlack, width: 1.5),
                ),
                child: Text(
                  '${collection.length}',
                  style: const TextStyle(
                    fontFamily: 'Courier',
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: collection.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.album_outlined, size: 80, color: kBlack),
                  SizedBox(height: 16),
                  Text(
                    'YOUR COLLECTION IS EMPTY',
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kBlack,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: collection.length,
                    itemBuilder: (context, index) {
                      final album = collection[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhite,
                            border: Border.all(color: kBlack, width: 2.5),
                            boxShadow: const [
                              BoxShadow(
                                color: kBlack,
                                offset: Offset(3, 3),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.network(
                                  album.coverUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stack) =>
                                      Container(color: kBlack),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        album.title.toUpperCase(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'Courier',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: kBlack,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        album.artist,
                                        style: const TextStyle(
                                          fontFamily: 'Courier',
                                          color: kRed,
                                          fontSize: 11,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '${album.year}',
                                        style: TextStyle(
                                          fontFamily: 'Courier',
                                          color: kBlack.withAlpha(153),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context
                                    .read<CollectionNotifier>()
                                    .remove(album.id),
                                child: Container(
                                  width: 44,
                                  height: 60,
                                  color: kRed,
                                  child: const Center(
                                    child: Text(
                                      '×',
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: kBlack, width: 2)),
                  ),
                  child: Text(
                    '${collection.length} RECORDS IN YOUR COLLECTION',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      color: kRed,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
