class Club {
  String image;
  String name;
  String status;
  String id;
  bool bookmark;
  bool like;
  Club({this.image, this.name, this.status, this.id, this.bookmark, this.like});
}

var clubs = [
  Club(
    image: "assets/images/redline.jpg",
    name: "Red line racing",
    status: "open",
    id: "#2375",
    bookmark: false,
    like: false,
  ),
  Club(
    image: "assets/images/dancers.jpg",
    name: "Dancer squad",
    status: "closed",
    id: "#2482",
    bookmark: false,
    like: true,
  ),
  Club(
    image: "assets/images/cricket.jpg",
    name: "Cricket",
    status: "invite only",
    id: "#2171",
    bookmark: true,
    like: true,
  ),
];
