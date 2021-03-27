class Segment {
  int id;
  String origin;
  String destination;
  bool isDestinationChecked;
  bool isOriginChecked;
  String segmentNumber;
  String time;
  double distance;
  String distanceUnit;

  Segment(
      this.id,
      this.origin,
      this.destination,
      this.isDestinationChecked,
      this.isOriginChecked,
      this.segmentNumber,
      this.time,
      this.distance,
      this.distanceUnit
  );

  Map toMap() {
    Map<String, dynamic> map = Map();
    map.putIfAbsent('id', () => id);
    map.putIfAbsent('origin', () => origin);
    map.putIfAbsent('destination', () => destination);
    map.putIfAbsent('isDestinationChecked', () => isDestinationChecked);
    map.putIfAbsent('isOriginChecked', () => isOriginChecked);
    map.putIfAbsent('segmentNumber', () => segmentNumber);
    map.putIfAbsent('time', () => time);
    map.putIfAbsent('distance', () => distance);
    map.putIfAbsent('distanceUnit', () => distanceUnit);
    return map;
  }

  static Segment fromMap(Map map) {
    Segment segment = Segment(
        map['id'],
        map['origin'],
        map['destination'],
        map['isDestinationChecked'],
        map['isOriginChecked'],
        map['segmentNumber'],
        map['time'],
        map['distance'],
        map['distanceUnit'],
    );
    return segment;
  }

  Segment.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    origin = data['origin'];
    destination = data['destination'];
    isDestinationChecked = data['isDestinationChecked'];
    isOriginChecked = data['isOriginChecked'];
    segmentNumber = data['segmentNumber'];
    time = data['time'];
    distance = data['distance'];
    distanceUnit = data['distanceUnit'];
  }
}
