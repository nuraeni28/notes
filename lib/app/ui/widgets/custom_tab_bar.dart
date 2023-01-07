import 'package:flutter/material.dart';
import 'package:notes/shared/theme.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xffE4EDF9);
  final _unselectedColor = Color(0xff5f6368);
  final _tabs = [
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on,
            size: 12,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Dashboard',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on,
            size: 12,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Patient',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on,
            size: 12,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Registration',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on,
            size: 12,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Appointment',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 40),
        child: Container(
          width: 450,
          height: 32,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.zero,
            indicatorWeight: 0,
            tabs: _tabs,
            unselectedLabelColor: kBlackColor,
            labelColor: kBlueColor,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: _selectedColor),
          ),
        ),
      ),
    );
  }
}
