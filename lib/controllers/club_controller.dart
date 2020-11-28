import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/models/clubs.dart';

class ClubController extends GetxController {
  var clubs = List<Club>().obs;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
    fetchClubs();
  }

  void fetchClubs() async {
    await Future.delayed(Duration(
      milliseconds: 0,
    ));
    var fetchResults = [
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

    clubs.assignAll(fetchResults);
  }
}
