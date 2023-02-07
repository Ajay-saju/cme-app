import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenTab extends StatefulWidget {
  const ProfileScreenTab({Key? key}) : super(key: key);

  @override
  State<ProfileScreenTab> createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends State<ProfileScreenTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xff63c3fe),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/R.png',
                      height: 15,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    // Spacer(),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          ExpansionTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                'assets/ff.png',
                fit: BoxFit.cover,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Member Details',
              style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text('Name'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Karnataka Medical Council'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('7804019771'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            leading: SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                'assets/ed.png',
                fit: BoxFit.cover,
                color: Colors.black87,
              ),
            ),
            title: Text(
              'Education Details',
              style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text('Degree'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('University'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Collage'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Speciality'),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
