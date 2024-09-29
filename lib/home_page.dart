// ignore_for_file: avoid_unnecessary_containers, unused_field, avoid_returning_null_for_void, unrelated_type_equality_checks, prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:path/path.dart';
import 'package:ui_hut/notificationset.dart';
import 'profile.dart';
import 'message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollPhysics scrollPhysics;

  final user = FirebaseAuth.instance.currentUser!;
  UserData curruser = UserData();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("usersdata")
        .doc(user.uid)
        .get()
        .then((value) {
      curruser = UserData.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset('assets/images/Menu.png')),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Center(
                child: Text('${curruser.username}',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ))),
              ),
              Center(
                child: url == ''
                    ? const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 121, 121, 121),
                        size: 20,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            '${curruser.url}',
                          ),
                        ),
                      ),
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150.0, bottom: 0),
            child: ListTile(
                title: Center(
              child: url == ''
                  ? Icon(
                      Icons.person,
                      color: Colors.grey[300],
                      size: 60,
                    )
                  : CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        '${curruser.url}',
                      ),
                    ),
            )),
          ),
          SizedBox(
            height: 40,
            child: ListTile(
              title: Text(
                '${curruser.username}',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ),
          ),
          ListTile(
            title: Text(
              user.email!,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_sharp,
              color: Colors.red,
              size: 40,
            ),
            title: Text('Edit Profile',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ))),
            onTap: (() {}),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.apps,
              color: Colors.pink,
              size: 40,
            ),
            title: Text('Application',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ))),
            onTap: () => null,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_active_rounded,
              color: Colors.green,
              size: 40,
            ),
            title: Text('Notification Setting',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ))),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage())),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.red,
              size: 40,
            ),
            title: Text('Share App',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ))),
            onTap: () => null,
          ),
          const SizedBox(
            height: 120,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
              size: 40,
            ),
            title: Text('Logout',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ))),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ]),
      ),
      body: GestureDetector(
        onTap: (() {
          FocusManager.instance.primaryFocus?.unfocus();
        }),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search here...'),
                            ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                        child: const Icon(
                      Icons.settings_applications_rounded,
                      color: Color.fromRGBO(76, 166, 168, 1),
                      size: 50,
                    )),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: Row(
                children: [
                  Text('Popular Job',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600))),
                  const Padding(padding: EdgeInsets.only(right: 120)),
                  Text('Show all',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 175,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                padEnds: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
              ),
              items: [
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                              'assets/images/Google.png',
                              width: 35,
                            ),
                          ),
                          Container(
                            child: FavoriteButton(
                              isFavorite: false,
                              iconSize: 35,
                              valueChanged: (isStarred) {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Google',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          )),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lead Product Manager',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '"\$2500/m',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 5)),
                                Text(
                                  'Toronto, Canada',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                              106, 106, 106, 1))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            child: Image.asset(
                              'assets/images/spotify.png',
                              width: 35,
                            ),
                          ),
                          Container(
                            child: FavoriteButton(
                              isFavorite: false,
                              iconSize: 35,
                              valueChanged: (isStarred) {},
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Spotify',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          )),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Senior UI Designer',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '"\$2500/m',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 5)),
                                Text(
                                  'Toronto, Canada',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                              106, 106, 106, 1))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
              child: Row(
                children: [
                  Text('Recent Post',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600))),
                  const Padding(padding: EdgeInsets.only(right: 120)),
                  Text('Show all',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 280,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 50,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.4,
                  scrollPhysics: const ClampingScrollPhysics(),
                  autoPlay: false,
                  padEnds: false,
                  pauseAutoPlayInFiniteScroll: true,
                  pauseAutoPlayOnManualNavigate: true,
                  scrollDirection: Axis.vertical,
                  autoPlayInterval: const Duration(seconds: 7),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1600),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                ),
                items: [
                  Container(
                    height: 75,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 11, bottom: 11),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, right: 9, bottom: 9),
                                child: Image.asset(
                                  'assets/images/netflix.png',
                                  width: 45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Visual Designer',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      'Full Time',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  106, 106, 106, 1))),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '"\$2500/m',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 9, right: 9),
                                child: Image.asset(
                                  'assets/images/spotify.png',
                                  width: 45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product Designer',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      'Full Time',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  106, 106, 106, 1))),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '"\$2500/m',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 9, right: 9),
                                child: Image.asset(
                                  'assets/images/spotify.png',
                                  width: 45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product Designer',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      'Full Time',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  106, 106, 106, 1))),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '"\$2500/m',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 75,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 9, right: 9),
                                child: Image.asset(
                                  'assets/images/spotify.png',
                                  width: 45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product Designer',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      'Full Time',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  106, 106, 106, 1))),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '"\$2500/m',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class UserData {
  String? url;
  var username;

  bool? dark_mode;

  UserData({
    this.username,
    this.url,
    this.dark_mode,
  });

  // data from server
  factory UserData.fromMap(map) {
    return UserData(
      username: map['user_name'],
      url: map['pic_url'],
      dark_mode: map['dark_mode'],
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [HomePage(), Message(), Profile(), NotificationPage()],
        onPageChanged: (index) {
          onPageChange(index);
        },
      ),
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 7,
        activeColor: const Color.fromRGBO(76, 166, 168, 1),
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,

        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          const GButton(
            icon: Icons.sms_rounded,
            text: 'messeage',
          ),
          const GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          const GButton(
            icon: Icons.settings,
            text: 'Setting',
          )
        ],
        onTabChange: (int index) {
          _pageController.animateToPage(index,
              duration: const Duration(microseconds: 1000),
              curve: Curves.easeInOut);
        },
      ),
    );
  }

  onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
