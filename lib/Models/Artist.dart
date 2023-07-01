class Artist {
  final int id;
  final String name;
  final String image;

  Artist(
      {required this.id,
        required this.name,
        required this.image});
}

List<Artist> demoArtists = [
  Artist(id: 1, name: "Eminem", image: "assets/images/a1.jpg"),
  Artist(id: 2, name: "Tamer Hosny", image: "assets/images/a2.jpg"),
  Artist(id: 3, name: "Amr Diab", image: "assets/images/a3.jpg"),
  Artist(id: 4, name: "Ed Sheeran", image: "assets/images/a4.jpg"),
];
