class ClubP {
  String image;
  String name;
  String status;
  String id;
  bool bookmark;
  bool like;
  ClubP(
      {this.image, this.name, this.status, this.id, this.bookmark, this.like});
}

var otherClubs = [
  ClubP(
    image: "assets/images/inventors.jpg",
    name: "Inventors",
    status: "open",
    id: "#2171",
    bookmark: false,
    like: false,
  ),
  ClubP(
    image: "assets/images/mechanical.jpg",
    name: "Mechanical maniac",
    status: "open",
    id: "#2259",
    bookmark: false,
    like: true,
  ),
];
