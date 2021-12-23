class Calorie {
  final String foodName;
  final int calorie;

  Calorie({
    required this.foodName,
    required this.calorie,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'calorie': calorie,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Calorie{foodName: $foodName, calorie: $calorie}';
  }
}
