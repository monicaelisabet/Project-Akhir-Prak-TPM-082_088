import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/pic2.jpg'),
              // child: Icon(
              //   Icons.person,
              //   size: 80,
              //   color: Colors.white,
              // ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Monica Elisabet',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '123200082',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/pic.jpg'),
              // child: Icon(
              //   Icons.person,
              //   size: 80,
              //   color: Colors.white,
              // ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yuni Safitri',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '123200088',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0)
          ],
        ),
      ),
    );
  }
}
