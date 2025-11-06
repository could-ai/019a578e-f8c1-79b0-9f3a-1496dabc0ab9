class LotteryResult {
  final String id;
  final String countryName;
  final String lotteryName;
  final String drawTime;
  final DateTime drawDate;
  final String numbers;
  final DateTime createdAt;

  LotteryResult({
    required this.id,
    required this.countryName,
    required this.lotteryName,
    required this.drawTime,
    required this.drawDate,
    required this.numbers,
    required this.createdAt,
  });

  factory LotteryResult.fromJson(Map<String, dynamic> json) {
    return LotteryResult(
      id: json['id'],
      countryName: json['country_name'],
      lotteryName: json['lottery_name'],
      drawTime: json['draw_time'],
      drawDate: DateTime.parse(json['draw_date']),
      numbers: json['numbers'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_name': countryName,
      'lottery_name': lotteryName,
      'draw_time': drawTime,
      'draw_date': drawDate.toIso8601String(),
      'numbers': numbers,
      'created_at': createdAt.toIso8601String(),
    };
  }
}