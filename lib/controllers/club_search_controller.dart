import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/models/clubs.dart';

class SearchController extends GetxController {
  final TextEditingController _controller = new TextEditingController();

  List<Club> _clubs = Get.find<ClubController>().clubs;

  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  SearchController() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        _isSearching = false;
        _searchText = "";
        update();
      } else {
        _isSearching = true;
        _searchText = _controller.text;
        update();
      }
    });
  }

  @override
  void onInit() {
    _isSearching = false;
    super.onInit();
  }

  void searchOperation(dynamic searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _clubs.length; i++) {
        String nameData = _clubs[i].name;
        String idData = _clubs[i].id;
        String imgData = _clubs[i].imgUrl;
        String statusData = _clubs[i].status;
        String descData = _clubs[i].description;
        bool popularData = _clubs[i].popular;
        String genreData = _clubs[i].genre;
        if (nameData.toLowerCase().contains(searchText.toLowerCase()) ||
            idData.toString().contains(searchText)) {
          searchresult.add(
            Club(
              imgUrl: imgData.toString(),
              description: descData.toString(),
              name: nameData.toString(),
              status: statusData.toString(),
              id: idData.toString(),
              popular: popularData,
              genre: genreData.toString(),
            ),
          );
        }
      }
    }
  }
}
