class Member {
  String name;
  String department;
  String user;
  bool founder = false;

  Member({
    this.name,
    this.department,
    this.user,
  });
}

List members = [
  Member(
    name: 'Abhijeet',
    department: 'IT',
    user: 'student',
  )
];
