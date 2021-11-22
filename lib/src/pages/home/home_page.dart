import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/src/configs/app_route.dart';
import 'package:project/src/configs/app_setting.dart';
import 'package:project/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
      "title": "Painting Studio",
      "description":
      "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
      "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
      "title": "Art Gallery",
      "description":
      "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
      "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
      "title": "Video Services",
      "description":
      "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/mini.jpg'),
              ),
              accountName: Text('Wipawinee Panmee'),
              accountEmail: Text('624235017@parichat.skru.ac.th'),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.pink,
              ),
              title: const Text('ออกจากระบบ'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.LoginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/TA.png'),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'WIPAWINEE PANMEE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.upcomingMovieRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        image: DecorationImage(
                            image: AssetImage('assets/images/cinema.png'),
                            scale: 10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('MOVIE'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.pink.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      image: DecorationImage(
                          image: AssetImage('assets/images/newspaper.png'),
                          scale: 10),
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.mapRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        image: DecorationImage(
                            image: AssetImage('assets/images/map.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.qrGenRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        image: DecorationImage(
                            image: AssetImage('assets/images/qr-gen.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.scanRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        image: DecorationImage(
                            image: AssetImage('assets/images/qr-scan.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.gameRoute);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Colors.pink.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        image: DecorationImage(
                            image: AssetImage('assets/images/search.png'),
                            scale: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                height: 60,
                child: Divider(
                  color: Colors.pink.shade100,
                  thickness: 3,
                ),
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage('assets/images/leaf.jpg'),
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Text('Rule number 1 of life. Do what makes you happy.'),
                  ],
                ),
              ),
              SizedBox(height: 100),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.pink.shade100,
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/search.png'),
                ),
                title: Text('My ListTile'),
                subtitle: Text('Subtitle'),
              ),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    child: Center(
                        child: Image.network(images[index],
                            fit: BoxFit.cover, width: 1000)),
                  );
                },
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: imgArray
                    .map((item) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, item["page"]);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                  blurRadius: 8,
                                  spreadRadius: 0.3,
                                  offset: Offset(0, 3))
                            ]),
                            child: AspectRatio(
                              aspectRatio: 2 / 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  item["img"],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              Text(item["price"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black12)),
                              Text(item["title"],
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.black)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, top: 8),
                                child: Text(
                                  item["description"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black12),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
                    .toList(),
                options: CarouselOptions(
                    height: 530,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 2,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    // viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
} //end class
