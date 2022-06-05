// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter104_advanced_ui/data/data.dart';
import 'package:flutter104_advanced_ui/models/post_model.dart';

class PostCarosal extends  StatelessWidget {
  PageController? pCon;
   PostCarosal({ this.pCon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Posts:',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
              controller: pCon,
              itemBuilder: (context , index){

                return buildPost(context,index);
              },
            itemCount: posts.length,
          ),
        )
      ],
    );
  }

  Widget buildPost(BuildContext context, int index) {
      Post post =posts[index];
    return

      AnimatedBuilder(
        animation: pCon!,
        child:  Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2,2),
                      color: Colors.black,
                      blurRadius: 5,
                    ),

                  ]
              ),
              child: ClipRRect(
                child: Image(
                  image: AssetImage('${post.imageUrl}'),
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),

                    ),
                    color: Colors.white.withOpacity(.7),

                  ),
                  height: 120,

                )),
            Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${post.title}',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('${post.location}',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('❤ ${post.likes}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.comment,
                                color: Colors.blue,
                              ),
                              Text(' ${post.comments}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )


                        ],
                      ),
                      // SizedBox(height: 10,),

                    ],

                  ),
                ))
          ],
        ),
        builder: (context, child) {
          double value = 1.0;
          if (pCon!.position.haveDimensions) {
            value = pCon!.page! - index;
            value = (1 - (value.abs() * .40)).clamp(0.0, 1.0);
          }
          return new Center(
            child: new SizedBox(
              height: Curves.easeOut.transform(value) * 400,
              width: double.infinity,
              child: child
              ,)
            ,)
          ;}
        ,);










  }
}
