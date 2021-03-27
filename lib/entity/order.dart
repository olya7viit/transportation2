import 'package:transportation2/entity/segment.dart';

class Order {
  String id;
  String clientEmail;
  String driverEmail;
  String dayOfArrival;
  String dayOfDispatch;
  double fullRouteDistatnc;
  String organizationName;
  List<Segment> segments;

  Order ({
    this.id,
    this.clientEmail,
    this.driverEmail,
    this.dayOfArrival,
    this.dayOfDispatch,
    this.fullRouteDistatnc,
    this.organizationName,
    this.segments
  });

  Map toMap() {
    Map<String, dynamic> map = Map();
    map.putIfAbsent('id', () => id);
    map.putIfAbsent('clientEmail', () => clientEmail);
    map.putIfAbsent('driverEmail', () => driverEmail);
    map.putIfAbsent('dayOfArrival', () => dayOfArrival);
    map.putIfAbsent('dayOfDispatch', () => dayOfDispatch);
    map.putIfAbsent('fullRouteDistatnc', () => fullRouteDistatnc);
    map.putIfAbsent('organizationName', () => organizationName);
    map.putIfAbsent(
        "segments",
            () => segments == null
            ? []
            : segments.map((e) => e.toMap()).toList());
    return map;
  }

  static Order fromMap(Map map) {
    Order order = Order(
        id: map['id'],
        clientEmail: map['clientEmail'],
        driverEmail: map['driverEmail'],
        dayOfArrival: map['dayOfArrival'],
        dayOfDispatch: map['dayOfDispatch'],
        fullRouteDistatnc: map['fullRouteDistatnc'],
        organizationName: map['organizationName'],
        segments: (map['segments'] as List).map((w) => Segment.fromJson(w)).toList()
    );
    return order;
  }
}