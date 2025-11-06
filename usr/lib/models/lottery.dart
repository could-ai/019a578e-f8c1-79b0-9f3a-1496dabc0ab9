class Lottery {
  final String name;
  final List<String> drawTimes;
  final List<int> daysOfWeek; // 1=Monday, 7=Sunday

  Lottery({
    required this.name,
    required this.drawTimes,
    required this.daysOfWeek,
  });
}
