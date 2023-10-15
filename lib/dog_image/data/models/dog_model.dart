class DogModel {
  final dynamic url;

  DogModel({required this.url});

  factory DogModel.fromMap(Map map) => DogModel(url: map['url']);

}