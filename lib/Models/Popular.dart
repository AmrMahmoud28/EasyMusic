class Popular {
  final int id;
  final String title;
  final String date;
  final String image;

  Popular(
      {required this.id,
        required this.title,
        required this.date,
        required this.image});
}

List<Popular> demoPopulars = [
  Popular(id: 1, title: "Bad Guy", date: '2019', image: "assets/images/pop1.jpg"),
  Popular(id: 2, title: "Faded", date: '2015', image: "assets/images/pop2.jpg"),
  Popular(id: 3, title: "اليوم الحلو ده", date: '2022', image: "assets/images/pop3.jpg"),
  Popular(id: 4, title: "Shape of You", date: '2017', image: "assets/images/pop4.jpg"),
];
