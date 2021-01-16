import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/widgets/club_card_vertical.dart';

//WIDGETS

class CreateProfile extends StatelessWidget {
  List clubs = [
    Club(
      imgUrl: "assets/images/inventors.jpg",
      name: "Inventors",
      status: "open",
      id: "#2171",
      popular: false,
      genre: "Technology",
    ),
    Club(
      imgUrl: "assets/images/mechanical.jpg",
      name: "Mechanical maniac",
      status: "open",
      id: "#2259",
      popular: false,
      genre: "Technology",
    ),
    Club(
      imgUrl: "assets/images/redline.jpg",
      name: "Red line racing",
      status: "open",
      id: "#2375",
      popular: true,
      genre: "Mechanical",
    ),
    Club(
      imgUrl: "assets/images/dancers.jpg",
      name: "Dancer squad",
      status: "closed",
      id: "#2482",
      popular: true,
      genre: "Entertainment",
    ),
    Club(
      imgUrl: "assets/images/cricket.jpg",
      name: "Cricket",
      status: "invite only",
      id: "#2291",
      popular: true,
      genre: "Sports",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nikhil shinde',
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Roboto',
                                          color: new Color(0xFF26C6DA),
                                        ),
                                      ),
                                      Text(
                                        'App Designer',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Roboto',
                                          color: new Color(0xFF26C6DA),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'Roboto',
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Followers'),
                                        Text('10'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Following'),
                                        Text('2'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Clubs Created'),
                                        Text('1'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Clubs that you have created',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 220,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    for (int i = 0; i < clubs.length; i++)
                      ClubCardVertical(
                        clubInfoCard: clubs[i],
                      ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Clubs that you follow',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: 220,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    for (int i = 0; i < clubs.length; i++)
                      ClubCardVertical(
                        clubInfoCard: clubs[i],
                      ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
