class CountryModel {
  final String name;
  final String imagePath;
  final String hotels;

  CountryModel({
    required this.name,
    required this.imagePath,
    required this.hotels,
  });
}

class CountryData {
  static List<CountryModel> countries = [
    CountryModel(
      name: 'Canada',
      imagePath: 'assets/images/ic_canada.png',
      hotels: 'Hotel Indonesia',
    ),
    CountryModel(
      name: 'Croatia',
      imagePath: 'assets/images/ic_croatia.png',
      hotels: 'Hotel Malaysia',
    ),
    CountryModel(
      name: 'Ethiopia',
      imagePath: 'assets/images/ic_ethiopia.png',
      hotels: 'Hotel Singapore',
    ),
    CountryModel(
      name: 'Ghana',
      imagePath: 'assets/images/ic_ghana.png',
      hotels: 'Hotel Thailand',
    ),
  ];
}
