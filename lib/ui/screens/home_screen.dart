import 'package:flutter/material.dart';
import 'package:plesson/ui/screens/bookmarked_assistants_screen.dart';
import 'package:plesson/ui/screens/search_asssistants_screen.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';
import 'chat_sessions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = const [
    BookmarkedAssistantsScreen(),
    SearchAssistantsScreen(),
    ChatSessionsScreen(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Bookmarked Assistants')),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal.shade700,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.74),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bookmark, size: 30), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.message, size: 30), label: 'Messages'),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}