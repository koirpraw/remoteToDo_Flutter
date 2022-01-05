import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _persistedTodo = prefs.getStringList('ff_persistedTodo') ?? [];
  }

  SharedPreferences prefs;

  List<String> todoList = [];

  List<bool> isCheckedList = [];

  List<String> _persistedTodo = [];
  List<String> get persistedTodo => _persistedTodo;
  set persistedTodo(List<String> _value) {
    _persistedTodo = _value;
    prefs.setStringList('ff_persistedTodo', _value);
  }

  void addToPersistedTodo(String _value) {
    _persistedTodo.add(_value);
    prefs.setStringList('ff_persistedTodo', _persistedTodo);
  }

  void removeFromPersistedTodo(String _value) {
    _persistedTodo.remove(_value);
    prefs.setStringList('ff_persistedTodo', _persistedTodo);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
