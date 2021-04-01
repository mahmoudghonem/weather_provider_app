class Location {
  final double longtitude;
  final double latitude;

  Location({this.longtitude, this.latitude});
  static Location fromJson(dynamic json) {
    return Location(
        longtitude: json['coord']['lon'].toDouble(),
        latitude: json['coord']['lat'].toDouble());
  }
}
