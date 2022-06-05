// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter104_advanced_ui/data/data.dart';

class CustomDrawer extends  StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage('${currentUser.backgroundImageUrl}'),
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,

                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue[700]!,
                              width: 3
                            ),
                            shape: BoxShape.circle,
                          ),

                          child: ClipOval(
                            child: Image(
                              image: AssetImage('${currentUser.profileImageUrl}'),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,

                            ),
                          ),
                        ),
                        Text(' ${currentUser.name}',
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(.4),
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                        ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ListTile(
                leading: Icon(Icons.home,
                  size: 30,
                ),
                title: Text('Home',
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              ListTile(
                leading: Icon(Icons.location_history,
                  size: 30,
                ),
                title: Text('Profile',
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              ListTile(
                leading: Icon(Icons.chat,
                  size: 30,
                ),
                title: Text('Chat',
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              ListTile(
                leading: Icon(Icons.location_on,
                  size: 30,
                ),
                title: Text('Map',
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              Expanded(

                child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: ListTile(
                    leading: Icon(Icons.logout,
                      size: 30,
                    ),
                    title: Text('LogOut',
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ),
                ),
              ),
            ],
      ),
    );
  }
}
