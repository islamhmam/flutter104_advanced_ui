// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter104_advanced_ui/components/custom_drawer.dart';
import 'package:flutter104_advanced_ui/components/following_users.dart';
import 'package:flutter104_advanced_ui/components/post_carosal.dart';

class MainScreen extends  StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
TabController? tabcon;
PageController? pageCon;

@override
void initState(){
  super.initState();
  tabcon =TabController(length: 2, vsync: this);
  pageCon=PageController(initialPage: 0,viewportFraction: .8);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(
          color: Colors.blue
        ) ,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Freeze',
        style: TextStyle(
          letterSpacing: 3,
          color: Colors.blue,
          fontSize: 33,
          fontWeight: FontWeight.bold

        ),),

        bottom: TabBar(
          controller: tabcon,
          indicatorWeight: 2,
          tabs: [
            Tab(text: 'Trending',),
            Tab(text: 'Latest',),
          ],

           labelColor: Colors.blue,
          unselectedLabelColor: Colors.blue[300],
          labelStyle: TextStyle(
            color: Colors.blue,
            fontSize: 23,
            fontWeight: FontWeight.w600,
              letterSpacing: 2,
          ),
          unselectedLabelStyle:TextStyle(
            color: Colors.blue[300],
            fontSize: 19,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ) ,
        ),
      ),
      body: TabBarView(
        controller: tabcon,
          children: [
            ListView(
          children: [
            FollowingUsers(),
            PostCarosal(pCon: pageCon)
          ],
        ),
            Container(
              color: Colors.blue[100],
            )

      ]),
      drawer: CustomDrawer(),
    );
  }
}
