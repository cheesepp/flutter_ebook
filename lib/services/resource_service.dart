import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ResourceService {
  static SharedPreferences? _preferences;
  final _nameKey = 'resource name';
  final _resourceKey = 'resource';
  final _mapKey = 'all-resources';
  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setResourceName(String resourceName) =>
      _preferences!.setString(_nameKey, resourceName);
  String? getResourceName() => _preferences!.getString(_nameKey);

  setResourcce(String resource) =>
      _preferences!.setString(_resourceKey, resource);
  String? getResource() => _preferences!.getString(_resourceKey);

  setMap(String resources) => _preferences!.setString(_mapKey, resources);

  Map<String, String>? getMap() {
    String? storedResources = _preferences!.getString(_mapKey);
    if (storedResources != null) {
      return Map<String, String>.from(jsonDecode(storedResources));
    }
    return null;
  }
}
