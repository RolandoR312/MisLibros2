class Store {
  var _id;
  var _name;
  var _phone;
  var _schedule;
  var _urlPicture;
  var _latitud;
  var _longitude;
  var _address;

  Store();

  get id => _id;

  set id(value) {
    _id = value;
  }

  get address => _address;

  set address(value) {
    _address = value;
  }

  get longitude => _longitude;

  set longitude(value) {
    _longitude = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get urlPicture => _urlPicture;

  set urlPicture(value) {
    _urlPicture = value;
  }

  get schedule => _schedule;

  set schedule(value) {
    _schedule = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}
