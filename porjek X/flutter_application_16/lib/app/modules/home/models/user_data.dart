class UserData {
  final String firstName;
  final String lastName;
  final String city;
  final String gender;
  final String picture;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.gender,
    required this.picture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    final results = json['results'][0];
    return UserData(
      firstName: results['name']['first'],
      lastName: results['name']['last'],
      city: results['location']['city'],
      gender: results['gender'],
      picture: results['picture']['large'],
    );
  }
}
