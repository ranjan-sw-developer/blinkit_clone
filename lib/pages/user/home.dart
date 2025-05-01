import 'package:blink_it_app/constants/color_constants.dart';
import 'package:blink_it_app/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Map<String, String>> tabs = [
    {'label': 'All', 'icon': IconPath.all},
    {'label': 'Summer', 'icon': IconPath.summer},
    {'label': 'Electronics', 'icon': IconPath.electronics},
    {'label': 'Beauty', 'icon': IconPath.beauty},
    {'label': 'Kids', 'icon': IconPath.kids},
    {'label': 'Premium', 'icon': IconPath.premium},
  ];

  final List<Map<String, String>> bottomTabs = [
    {'label': 'Home', 'icon': IconPath.home},
    {'label': 'Order Again', 'icon': IconPath.order},
    {'label': 'Categories', 'icon': IconPath.category},
    {'label': 'Print', 'icon': IconPath.print},
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
                  backgroundColor: ColorConstants.primaryColor,
                  // Primary color for AppBar
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
                                  Icons.person,
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
                              icon: SvgPicture.asset(
                                tab['icon']!,
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                  Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              text: tab['label'],
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
          body: CustomBanner(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: ColorConstants.primaryColor,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Colors.black,
        elevation: 8.0,
        items: List.generate(bottomTabs.length, (index) {
          final tab = bottomTabs[index];
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              tab['icon']!,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                index == _selectedIndex
                    ? ColorConstants.primaryColor
                    : Colors.grey, // selected/unselected
                BlendMode.srcIn,
              ),
            ),
            label: tab['label'],
          );
        }),
      ),
    );
  }
}
