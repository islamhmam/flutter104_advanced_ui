// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter104_advanced_ui/data/data.dart';
import 'package:flutter104_advanced_ui/models/user_model.dart';

class FollowingUsers extends  StatelessWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Follwing:',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23
          ),
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
              itemCount: users.length,
              itemBuilder: (context, index){
                User user=users[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2
                    ),
                    shape: BoxShape.circle,

                  ),
                  height: 60,
                  width: 60,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        '${user.profileImageUrl}'
                      ),
                    fit: BoxFit.cover,
                    height: 60,
                      width: 60,
                    ),

                  ),
                );
              },
              scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
