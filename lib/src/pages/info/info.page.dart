import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์'),
        backgroundColor: Colors.pink,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/TA.png'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/mini.jpg'),
              ),
              Text(
                'Wipawinee  Panmee',
                style: TextStyle(
    fontSize: 30, color: Colors.pink, fontFamily: 'Pacifico'),
    ),
              Text(
                'STUDENT',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'Source Sans Pro'),
              ),
              SizedBox(
                width: 150,
                height: 30,
                child: Divider(
                  color: Colors.pink.shade100,
                  thickness: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Nickname: Samild')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_call,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Number: 0925436316')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm_outlined,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('ID: mildmildsaka')
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
