class Club {
  String imgUrl;
  String name;
  String status;
  String id;
  bool popular;
  bool bookmark;
  bool like;
  Club(
      {this.imgUrl,
      this.name,
      this.status,
      this.id,
      this.bookmark,
      this.like,
      this.popular});
}

var clubs = [
  Club(
    imgUrl: "assets/images/inventors.jpg",
    name: "Inventors",
    status: "open",
    id: "#2171",
    bookmark: false,
    like: false,
    popular: false,
  ),
  Club(
    imgUrl: "assets/images/mechanical.jpg",
    name: "Mechanical maniac",
    status: "open",
    id: "#2259",
    bookmark: false,
    like: true,
    popular: false,
  ),
  Club(
    imgUrl: "assets/images/redline.jpg",
    name: "Red line racing",
    status: "open",
    id: "#2375",
    bookmark: false,
    like: false,
    popular: true,
  ),
  Club(
    imgUrl: "assets/images/dancers.jpg",
    name: "Dancer squad",
    status: "closed",
    id: "#2482",
    bookmark: false,
    like: true,
    popular: true,
  ),
  Club(
    imgUrl: "assets/images/cricket.jpg",
    name: "Cricket",
    status: "invite only",
    id: "#2291",
    bookmark: true,
    like: true,
    popular: true,
  ),
];
