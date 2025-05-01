import 'package:blink_it_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'label': 'All', 'icon': Icons.all_inbox_outlined},
    {'label': 'Summer', 'icon': Icons.sunny},
    {'label': 'Electronics', 'icon': Icons.headphones},
    {'label': 'Beauty', 'icon': Icons.colorize_sharp},
    {'label': 'Kids', 'icon': Icons.child_care},
    {'label': 'Bakery', 'icon': Icons.cake},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 220.0,
                  backgroundColor:
                      ColorConstants.primaryColor, // Primary color for AppBar
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title + Profile Icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Blinkit in',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '14 minutes',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'HOME - Ranjan Moger, #406, Niki',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 20,
                                child: Icon(
                                  Icons.verified_user,
                                ), // replace with your asset
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Search Field
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search products',
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(80),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.black,
                      indicatorColor: Colors.green,
                      indicatorPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      tabs:
                          tabs.map((tab) {
                            return Tab(
                              icon: Icon(tab['icon'], size: 20),
                              text: tab['label'],
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
          body: TabBarView(
            controller: _tabController,
            children:
                tabs.map((tab) {
                  return Center(child: Text('Content for ${tab['label']}'));
                }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Currently selected tab
        onTap: _onItemTapped, // Callback when tab is tapped
        backgroundColor:
            Colors.red, // Set background color for BottomNavigationBar
        selectedItemColor:
            ColorConstants.primaryColor, // Color of the selected item (active)
        unselectedItemColor: Colors.grey, // Color of the unselected items
        elevation: 8.0, // Optional: Adds a shadow to the BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: 'Order Again',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.print), label: 'Print'),
        ],
      ),
    );
  }
}
