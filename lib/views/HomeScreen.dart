
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          CircleAvatar(
           // backgroundImage: NetworkImage('your_image_url_here'),
            radius: 20,
          ),
          SizedBox(width: 10),
          Text('Ahmed'),
          SizedBox(width: 10),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: <Widget>[
          _buildGridTile('Dashboard', "assets/Bar-Chart-12818.png"),
          _buildGridTile('Clinical & Non-clinical Risks'," assets/Delete-Shield-11304.png"),
          _buildGridTile('OVR', "assets/Group 1205.png"),
          _buildGridTile('Staff Risk',"assets/Group 1322.png"  ),
          _buildGridTile('PCRA & ICRA',  "assets/Group 1960.png"),
          _buildGridTile('KPIs',  "assets/Path 425.png"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor:(AppColor.homeColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildGridTile(String title, String image) {
    return Card(
      child: InkWell(
        onTap: () {
          // Handle your onTap here
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Image.asset(image),
            Text(title),
          ],
        ),
      ),
    );
  }
}