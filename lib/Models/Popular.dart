class Popular {
  final int id;
  final String title;
  final String artist;
  final String date;
  final String image;
  final String songUrl;

  Popular(
      {required this.id,
      required this.title,
      required this.artist,
      required this.date,
      required this.image,
      required this.songUrl});
}

List<Popular> demoPopulars = [
  Popular(
      id: 1,
      title: "Believer",
      artist: "Imagine Dragons",
      date: '2017',
      image: "https://wallpapercave.com/wp/wp2741342.jpg",
      songUrl: "https://files.abdwap2.com/uploads/songs/2017/IDEV/03.%20Believer.mp3"
  ),
  Popular(
      id: 2,
      title: "Faded",
      artist: "Alan Walker",
      date: '2015',
      image: "https://wallpapercave.com/wp/wp4645778.jpg",
      songUrl: "https://files.abdwap2.com/uploads/songs/alan_walker_-_faded.mp3"
  ),
  Popular(
      id: 3,
      title: "Alywm Alhlw Dh",
      artist: "Ahmed Saad",
      date: '2022',
      image:
          "https://i1.sndcdn.com/artworks-b9pHa0xDInNe9rTX-Cuz0yw-t500x500.jpg",
      songUrl: "https://serv100.albumaty.com/songs_2020/Albumaty.Com_ahmd_sad_alywm_alhlw_dh_-_mn_fylm_amhm.mp3"
  ),
  Popular(
      id: 4,
      title: "Shape of You",
      artist: "Ed Sheeran",
      date: '2017',
      image: "https://wallpapercave.com/wp/wp3537465.jpg",
      songUrl: "https://files.abdwap2.com/uploads/songs/shapeofyou.mp3"
  ),
];
