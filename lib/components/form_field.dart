class MtFormField {
  String _value;
  bool isDirty = false;

  String get value {
    return _value;
  }

  set value(newValue) {
    _value = newValue;
    isDirty = true;
  }
}
