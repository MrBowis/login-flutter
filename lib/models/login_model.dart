class User {
  String user;
  String pass;
  String name;
  String lastName;
  Map<String, String> direction = {'city': '', 'state': '', 'zipCode': ''};
  String phone;
  String email;

  User({
    required this.user,
    required this.pass,
    required this.name,
    this.lastName = '',
    this.direction = const {'city': '', 'state': '', 'zipCode': ''},
    this.phone = '',
    this.email = '',
  });
}
