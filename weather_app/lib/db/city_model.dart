class CityModel{
  late final int? id;
  late final String? cityName;
  late final double? lat;
  late final double? lng;

CityModel({
  this.id,
  this.cityName,
  this.lat,
  this. lng
});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['cityName'] = cityName;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }

  CityModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    cityName = map['cityName'];
    lat = map['lat'];
    lng = map['lng'];
  }
}
