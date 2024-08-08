import 'package:flutter/material.dart';

class EventData {
  final String eventName;
  final String hospitalName;
  final String imageLink;

  EventData({
    required this.eventName,
    required this.hospitalName,
    required this.imageLink,
  });
}

class EventDataModel extends ChangeNotifier {
  EventData? _eventData;

  EventData? get eventData => _eventData;

  void setEventData(EventData eventData) {
    _eventData = eventData;
    notifyListeners();
  }
}
