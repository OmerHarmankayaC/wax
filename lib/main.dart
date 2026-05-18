import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiers/collection_notifier.dart';
import 'theme/app_theme.dart';
import 'screens/discover_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/collection_screen.dart';

export 'notifiers/collection_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CollectionNotifier(),
      child: const WaxApp(),
    ),
  );
}

class WaxApp extends StatelessWidget {
  const WaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WAX',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MainShell(),
        '/detail': (_) => const DetailScreen(),
      },
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DiscoverScreen(),
    CollectionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: kBlack, width: 2)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'DISCOVER',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: 'COLLECTION',
            ),
          ],
        ),
      ),
    );
  }
}
