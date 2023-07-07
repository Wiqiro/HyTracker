abstract class StatRecord {
  /* final String id;
  final String playerUuid; */
  final DateTime time = DateTime.now();
  late final Map<String, dynamic> data;

  String get getSummarisedString;
}
