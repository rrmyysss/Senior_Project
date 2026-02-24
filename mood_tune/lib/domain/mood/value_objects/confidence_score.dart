class ConfidenceScore {
  final double value;

  const ConfidenceScore._(this.value);

  factory ConfidenceScore(double input) {
    if (input < 0.0 || input > 1.0) {
      throw ArgumentError('Confidence score must be between 0.0 and 1.0');
    }
    return ConfidenceScore._(input);
  }

  bool get isConfident => value >= 0.60;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ConfidenceScore && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toStringAsFixed(2);
}
