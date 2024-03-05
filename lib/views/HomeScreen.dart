
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:final_project/constans/appcolor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: [
           Container(
              color: Colors.white, // Background color of the screen
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .4,
                    left: -MediaQuery.of(context).size.width * .6,
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          .8, // Adjust the height as needed
                      width: MediaQuery.of(context).size.width *
                          1.45, // Adjust the width as needed
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff229b95), // Color of the circular shape
                      ),
                    ),
                  ),
                  Positioned(
                    top: -MediaQuery.of(context).size.height * .44,
                    left: -MediaQuery.of(context).size.width * .64,
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          .82, // Adjust the height as needed
                      width: MediaQuery.of(context).size.width *
                          1.45, // Adjust the width as needed
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff2ab9b5), // Color of the circular shape
                      ),
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Home,
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.umbrella,
                          color: Colors.white,
                          size: 70,
                        ),
                        Spacer(),
                        Column(children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://scontent.fcai22-2.fna.fbcdn.net/v/t39.30808-6/409476334_6707694622686147_1642394985538472521_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=-bxHCQEOPUAAX9RGPnj&_nc_ht=scontent.fcai22-2.fna&oh=00_AfCu9GDay4O2bKOYvBQcVz04JFLa6Rh9C0xa_z1ITHxPYA&oe=65B067F0"),
                          ),
                          Text(S.of(context).FullName ,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600))
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          
          
          
          
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: <Widget>[
                _buildGridTile(S.of(context).Dashboard, "assets/Bar-Chart-12818.png"),
                _buildGridTile(S.of(context).ClinicalRisks ,"assets/Group 1322.png"),
                _buildGridTile(S.of(context).OVR, "assets/Group 1205.png"),
                _buildGridTile(S.of(context).StaffRisk,"assets/Group 1322.png"  ),
                _buildGridTile(S.of(context).OVR ,  "assets/Group 1960.png"),
                _buildGridTile(S.of(context).KPIS,  "assets/Path 425.png"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor:(AppColor.homeColor),
        items:   <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: S.of(context).settings,
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