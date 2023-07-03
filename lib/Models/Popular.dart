class Popular {
  final int id;
  final String title;
  final String artist;
  final String date;
  final String image;

  Popular(
      {required this.id,
        required this.title,
        required this.artist,
        required this.date,
        required this.image});
}

List<Popular> demoPopulars = [
  Popular(id: 1, title: "Bad Guy", artist: "Billie Eilish", date: '2019', image: "https://wallpapercave.com/wp/wp4246977.jpg"),
  Popular(id: 2, title: "Faded", artist: "Alan Walker", date: '2015', image: "https://wallpapercave.com/wp/wp4645778.jpg"),
  Popular(id: 3, title: "This Awesome Day", artist: "Ahmed Saad", date: '2022', image: "https://i1.sndcdn.com/artworks-b9pHa0xDInNe9rTX-Cuz0yw-t500x500.jpg"),
  Popular(id: 4, title: "Shape of You", artist: "Ed Sheeran", date: '2017', image: "https://wallpapercave.com/wp/wp3537465.jpg"),
];
