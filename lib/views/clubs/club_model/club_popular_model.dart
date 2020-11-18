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

var popularClubs = [
  ClubP(
    image: "assets/images/redline.jpg",
    name: "Red line racing",
    status: "open",
    id: "#2375",
    bookmark: false,
    like: false,
  ),
  ClubP(
    image: "assets/images/dancers.jpg",
    name: "Dancer squad",
    status: "closed",
    id: "#2482",
    bookmark: false,
    like: true,
  ),
  ClubP(
    image: "assets/images/cricket.jpg",
    name: "Cricket",
    status: "invite only",
    id: "#2291",
    bookmark: true,
    like: true,
  ),
];
