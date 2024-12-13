class RandomUser {
  final String name;
  final String email;
  final String imageUrl;
  RandomUser({required this.name, required this.email, required this.imageUrl});
  factory RandomUser.fromJson(Map<String, dynamic> json) {
    final nameJson = json['name'];
    return RandomUser(
      name: '${nameJson['title']} ${nameJson['first']} ${nameJson['last']}',
      email: json['email'],
      imageUrl: json['picture']['large'],
    );
  }
}
