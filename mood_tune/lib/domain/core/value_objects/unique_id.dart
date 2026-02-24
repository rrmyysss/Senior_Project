import 'package:uuid/uuid.dart';

class UniqueId {
  final String value;

  const UniqueId._(this.value);

  factory UniqueId() {
    return UniqueId._(const Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(uniqueIdStr);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is UniqueId && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  
  @override
  String toString() => value;
}
