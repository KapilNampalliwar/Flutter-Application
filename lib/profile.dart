// ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:ui_hut/home_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _obscureText = true;
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
    // final Storage storage = Storage();
    // ignore: prefer_const_constructors
    Future pickUploadProfilePic(ImageSource source) async {
      final image = await ImagePicker().pickImage(
        source: source,
      );

      Reference ref = FirebaseStorage.instance.ref().child(image!.name);

      await ref.putFile(File(image.path));
      print(File(image.path));
      print(image.name);

      ref.getDownloadURL().then((url) async {
        setState(() {
          FirebaseFirestore.instance
              .collection('usersdata')
              .doc(user.uid)
              .update({'pic_url': url});
          print(url);
        });
      });
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const Page1();
                }),
              );
            },
          ),
          title: Text('Profile',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ))),
        ),
        body: GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus?.unfocus();
          }),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: url == ''
                                ? Icon(
                                    Icons.person,
                                    color: Colors.blue[300],
                                    size: 150,
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(
                                      '${curruser.url}',
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 100,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      50,
                                    ),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(2, 4),
                                      color: Colors.grey.withOpacity(
                                        0.9,
                                      ),
                                      blurRadius: 3,
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: IconButton(
                                  icon: const Icon(Icons.add_a_photo_rounded,
                                      color: Color.fromRGBO(76, 166, 168, 1)),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isDismissible: true,
                                        builder: ((builder) => Container(
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.all(20),
                                            child: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Text('Choose profile Photo',
                                                      style: GoogleFonts.poppins(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .grey))),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            IconButton(
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .camera_alt,
                                                                  size: 40,
                                                                ),
                                                                onPressed: (() {
                                                                  pickUploadProfilePic(
                                                                      ImageSource
                                                                          .camera);
                                                                })),
                                                            const Text('Camera')
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 30,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            IconButton(
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .add_photo_alternate,
                                                                  size: 40,
                                                                ),
                                                                onPressed: (() {
                                                                  pickUploadProfilePic(
                                                                      ImageSource
                                                                          .gallery);
                                                                })),
                                                            const Text(
                                                                'Gallery')
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ))));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Text('${curruser.username}',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ))),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Edit profile',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UserName',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey))),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          controller: TextEditingController(
                              text: "${curruser.username}"),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person_outlined),
                            hintText: 'UserName',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Email',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey))),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          controller:
                              TextEditingController(text: "${user.email}"),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Password',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey))),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          obscureText: _obscureText,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.lock_outlined),
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 40),
                  width: 211,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 166, 168, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Update Profile',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
