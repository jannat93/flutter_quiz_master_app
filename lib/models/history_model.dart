class HistoryModel {
  final String category;
  final int score;
  final int total;
  final String date;

  final List<Map<String, dynamic>> answers;

  HistoryModel({
    required this.category,
    required this.score,
    required this.total,
    required this.date,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'score': score,
      'total': total,
      'date': date,
      'answers': answers,
    };
  }

  factory HistoryModel.fromJson(
      Map<String, dynamic> json) {
    return HistoryModel(
      category: json['category'],
      score: json['score'],
      total: json['total'],
      date: json['date'],
      answers:
      List<Map<String, dynamic>>.from(
        json['answers'],
      ),
    );
  }
}