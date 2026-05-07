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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UniqueId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  
  @override
  String toString() => value;
}
