import 'package:flutter/material.dart';
import 'package:sisal/features/external_link_tab_feature/presentation/external_link_tab.dart';
import 'package:sisal/features/list_tab_feature/presentation/list_tab.dart';
import 'package:sisal/features/photo_tab_feature/presentation/photo_tab_feature.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _tabs = [
    const ListTab(),
    const ExternalLinkTab(),
    const PhotoTabFeature(),
  ];

  late TabController _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: _currentIndex,
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sisal'),
        centerTitle: true,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _tabController.animateTo(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: 'External Link',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photo',
          ),
        ],
      ),
    );
  }
}
