import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _buildPreferencesCard(String locationOfImage, String header, String desc,
      Color? backgroundColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 230.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: header,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Image.asset(
                      locationOfImage,
                      height: 20,
                      width: 20,
                    )),
                  ),
                ),
                SizedBox(height: 20),
                Text(header,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                Text(desc,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProfileOptions(IconData? icon, String name) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 25, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 1.2),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 12, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 32.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Profile.png',
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Darshan Hande",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPreferencesCard('assets/Size.png', 'Size & Fit',
                  'Your Size & Fit Preferences', Colors.blue[100]),
              _buildPreferencesCard('assets/mustache.png', 'Style',
                  'Your Style Preferences', Colors.pink[100]),
              _buildPreferencesCard('assets/clothes-hanger.png', 'Closet',
                  'Your Closet', Colors.brown[100]),
            ],
          ),
        ),
        SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileOptions(CupertinoIcons.cube_box, 'All Purchases'),
            _buildProfileOptions(CupertinoIcons.info, 'FAQs'),
            _buildProfileOptions(
                CupertinoIcons.arrow_2_circlepath, 'Exchanges & Return Policy'),
            _buildProfileOptions(CupertinoIcons.lock, 'Privacy Policy'),
            _buildProfileOptions(CupertinoIcons.doc_text, 'About Us'),
          ],
        ),
        SizedBox(height: 45),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.headphones,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Need Assistance ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
