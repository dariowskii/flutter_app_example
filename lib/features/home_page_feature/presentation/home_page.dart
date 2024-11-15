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

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sisal'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
