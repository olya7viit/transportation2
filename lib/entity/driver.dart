class Driver {
  String firstName;
  String lastName;
  String email;
  String password;
  double driverPayment;
  bool isRetired;
  int drivingExperience;

  Driver(
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.driverPayment,
    this.isRetired,
    this.drivingExperience
  );

  Map toMap() {
    Map<String, dynamic> map = Map();
    map.putIfAbsent('firstName', () => firstName);
    map.putIfAbsent('lastName', () => lastName);
    map.putIfAbsent('email', () => email);
    map.putIfAbsent('password', () => password);
    map.putIfAbsent('driverPayment', () => driverPayment);
    map.putIfAbsent('isRetired', () => isRetired);
    map.putIfAbsent('drivingExperience', () => drivingExperience);

    return map;
  }

  static Driver fromMap(Map map) {
    Driver driver = Driver(
      map['firstName'],
      map['lastName'],
      map['email'],
      map['password'],
      map['driverPayment'].toDouble(),
      map['isRetired'],
      map['drivingExperience']
    );
    return driver;
  }
}