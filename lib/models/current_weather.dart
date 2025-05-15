class CurrentWeather {
  late String _city;
  late String _description;
  late double _currentTemp;
  late DateTime _currentTime;
  late DateTime _sunrise;
  late DateTime _sunset;

  String get city => _city;
  String get description => _description;
  double get currentTemp => _currentTemp;
  DateTime get currentTime => _currentTime;
  DateTime get sunrise => _sunrise;
  DateTime get sunset => _sunset;

  // region Setters
  set city(String value) {
    if(value.isEmpty) {
      throw Exception('City cannot be empty.');
    }
    _city = value;
  }

  set description(String value) {
    if(value.isEmpty) {
      throw Exception('Description cannot be empty.');
    }
    _description = value;
  }

  set currentTemp(double value) {
    if(value < -100 || value > 100) {
      throw Exception('Temperature must be between -100 and 100.');
    }
    _currentTemp = value;
  }

  set currentTime(DateTime value) {
    if(value.isAfter(DateTime.now())) {
      throw Exception('Current time cannot be in the future.');
    }
    _currentTime = value;
  }

  set sunrise(DateTime value) {
    if(value.year != _currentTime.year || value.month != _currentTime.month || value.day != _currentTime.day) {
      throw Exception('Sunrise must be on the same day as the current time.');
    }

    if(value.isAfter(_sunset)) {
      throw Exception('Sunrise cannot be after sunset.');
    }
    _sunrise = value;
  }

  set sunset(DateTime value) {
    if(value.year != _currentTime.year || value.month != _currentTime.month || value.day != _currentTime.day) {
      throw Exception('Sunset must be on the same day as the current time.');
    }

    if(value.isBefore(_sunrise)) {
      throw Exception('Sunset cannot be before sunrise.');
    }
    _sunset = value;
  }
  // endregion
}