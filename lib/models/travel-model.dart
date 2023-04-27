class TravelModel {
  String title;

  TravelModel({required this.title});
}

class TravelModels {
  static List<TravelModel> list = [
    TravelModel(title: 'Quiet place'),
    TravelModel(title: 'Romantic trip'),
    TravelModel(title: 'Adventure trip'),
  ];
}
